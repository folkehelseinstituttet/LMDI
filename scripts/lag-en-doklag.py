#!/usr/bin/env python3
from __future__ import annotations

import argparse
import json
import re
import shutil
from dataclasses import dataclass
from html.parser import HTMLParser
from pathlib import Path


EXTERNAL_SCHEMES = ("http://", "https://", "//", "mailto:", "tel:", "data:", "javascript:")


@dataclass(frozen=True)
class MirrorPage:
    source: Path
    target: Path
    source_is_english: bool


def load_replacements(translations_dir: Path) -> list[tuple[str, str]]:
    replacements: list[tuple[str, str]] = []
    seen: set[tuple[str, str]] = set()

    for json_file in sorted(translations_dir.glob("*.json")):
        try:
            payload = json.loads(json_file.read_text(encoding="utf-8"))
        except json.JSONDecodeError:
            continue

        for lang in payload.get("languages", []):
            if lang.get("targetLang") != "en":
                continue
            for entry in lang.get("entries", []):
                source = entry.get("source")
                target = entry.get("target")
                if not isinstance(source, str) or not isinstance(target, str):
                    continue
                if not source or not target or source == target:
                    continue
                key = (source, target)
                if key in seen:
                    continue
                seen.add(key)
                replacements.append(key)

    replacements.sort(key=lambda item: (-len(item[0]), item[0], item[1]))
    return replacements


def apply_replacements(text: str, replacements: list[tuple[str, str]]) -> str:
    for source, target in replacements:
        text = text.replace(source, target)
    return text


LANG_SWITCHER_RE = re.compile(
    r'(<select id="lang-switcher"[^>]*>)(.*?)(</select>)',
    re.DOTALL,
)


def rewrite_language_switcher(html: str, *, root_href: str) -> str:
    def repl(match: re.Match[str]) -> str:
        start, _body, end = match.groups()
        return (
            f'{start}'
            f'<option value="no" data-href="{root_href}">Norsk</option>'
            f'<option value="en" selected="selected" data-href="">English</option>'
            f'{end}'
        )

    return LANG_SWITCHER_RE.sub(repl, html, count=1)


def rebased_href(value: str, *, source_is_english: bool, planned_local_names: set[str]) -> str:
    if not value:
        return value

    if value.startswith(EXTERNAL_SCHEMES) or value.startswith(("#", "/", "../", "./")):
        return value

    if source_is_english:
        if value.startswith("en-") and value.endswith(".html"):
            stripped = value[3:]
            if stripped in planned_local_names:
                return stripped

        if value in planned_local_names:
            return value

        return f"../{value}"

    if value.startswith("en-") and value.endswith(".html"):
        stripped = value[3:]
        if stripped in planned_local_names:
            return stripped

    if value.startswith("en/") and value.endswith(".html"):
        stripped = value[3:]
        if stripped in planned_local_names:
            return stripped

    if value in planned_local_names:
        return value

    return f"../{value}"


class MirrorHtmlParser(HTMLParser):
    def __init__(
        self,
        *,
        source_is_english: bool,
        planned_local_names: set[str],
        replacements: list[tuple[str, str]],
    ) -> None:
        super().__init__(convert_charrefs=False)
        self.source_is_english = source_is_english
        self.planned_local_names = planned_local_names
        self.replacements = replacements
        self.parts: list[str] = []
        self.raw_text_tag: str | None = None

    def handle_decl(self, decl: str) -> None:
        self.parts.append(f"<!{decl}>")

    def handle_pi(self, data: str) -> None:
        self.parts.append(f"<?{data}>")

    def handle_comment(self, data: str) -> None:
        self.parts.append(f"<!--{data}-->")

    def handle_starttag(self, tag: str, attrs: list[tuple[str, str | None]]) -> None:
        self.parts.append(self._render_tag(tag, attrs, closing=False, self_closing=False))
        if tag in {"script", "style"}:
            self.raw_text_tag = tag

    def handle_startendtag(self, tag: str, attrs: list[tuple[str, str | None]]) -> None:
        self.parts.append(self._render_tag(tag, attrs, closing=False, self_closing=True))

    def handle_endtag(self, tag: str) -> None:
        self.parts.append(f"</{tag}>")
        if self.raw_text_tag == tag:
            self.raw_text_tag = None

    def handle_data(self, data: str) -> None:
        if self.raw_text_tag in {"script", "style"}:
            self.parts.append(data)
            return
        self.parts.append(apply_replacements(data, self.replacements))

    def handle_entityref(self, name: str) -> None:
        self.parts.append(f"&{name};")

    def handle_charref(self, name: str) -> None:
        self.parts.append(f"&#{name};")

    def _render_tag(
        self,
        tag: str,
        attrs: list[tuple[str, str | None]],
        *,
        closing: bool,
        self_closing: bool,
    ) -> str:
        rendered_attrs: list[str] = []
        for attr, value in attrs:
            if value is None:
                rendered_attrs.append(attr)
                continue

            if attr in {"href", "src"}:
                value = rebased_href(
                    value,
                    source_is_english=self.source_is_english,
                    planned_local_names=self.planned_local_names,
                )
            elif attr == "data-href":
                if self.source_is_english:
                    if value and not value.startswith(EXTERNAL_SCHEMES) and not value.startswith(("#", "/", "../", "./")):
                        value = f"../{value}"
                else:
                    if value.startswith("en-") and value.endswith(".html"):
                        stripped = value[3:]
                        if stripped in self.planned_local_names:
                            value = stripped
                    elif value.startswith("en/") and value.endswith(".html"):
                        stripped = value[3:]
                        if stripped in self.planned_local_names:
                            value = stripped
                    elif value and not value.startswith(EXTERNAL_SCHEMES) and value not in self.planned_local_names:
                        value = f"../{value}"
            else:
                value = apply_replacements(value, self.replacements)

            escaped = (
                value.replace("&", "&amp;")
                .replace('"', "&quot;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
            )
            rendered_attrs.append(f'{attr}="{escaped}"')

        suffix = " /" if self_closing else ""
        attrs_text = f" {' '.join(rendered_attrs)}" if rendered_attrs else ""
        return f"<{tag}{attrs_text}{suffix}>"

    def get_html(self) -> str:
        return "".join(self.parts)


def build_mirror(
    *,
    output_dir: Path,
    replacements: list[tuple[str, str]],
) -> list[MirrorPage]:
    mirror_dir = output_dir / "en"
    if mirror_dir.exists():
        shutil.rmtree(mirror_dir)
    mirror_dir.mkdir(parents=True, exist_ok=True)

    english_sources = sorted(output_dir.glob("en-*.html"))
    reserved_targets = {item.name[3:] for item in english_sources}

    pages: list[MirrorPage] = []
    for source in english_sources:
        target = mirror_dir / source.name[3:]
        pages.append(MirrorPage(source=source, target=target, source_is_english=True))

    for source in sorted(output_dir.glob("*.html")):
        if source.name.startswith("en-"):
            continue
        if source.name in reserved_targets:
            continue
        target = mirror_dir / source.name
        pages.append(MirrorPage(source=source, target=target, source_is_english=False))

    planned_local_names = {page.target.name for page in pages}

    for page in pages:
        html = page.source.read_text(encoding="utf-8")
        parser = MirrorHtmlParser(
            source_is_english=page.source_is_english,
            planned_local_names=planned_local_names,
            replacements=replacements if not page.source_is_english else [],
        )
        parser.feed(html)
        parser.close()
        html = parser.get_html()
        html = html.replace('src="assets/', 'src="../assets/')
        html = html.replace("src='assets/", "src='../assets/")
        html = html.replace('href="assets/', 'href="../assets/')
        html = html.replace("href='assets/", "href='../assets/")
        if not page.source_is_english:
            html = html.replace(
                '<html xml:lang="nb" xmlns="http://www.w3.org/1999/xhtml" lang="nb">',
                '<html xml:lang="en" xmlns="http://www.w3.org/1999/xhtml" lang="en">',
                1,
            )
        root_href = f"../{page.target.name}"
        html = rewrite_language_switcher(html, root_href=root_href)
        page.target.parent.mkdir(parents=True, exist_ok=True)
        page.target.write_text(html, encoding="utf-8")

    return pages


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Bygg en /en/-speiling av LMDI-output.")
    parser.add_argument(
        "--ig-root",
        default="LMDI",
        help="Sti til IG-roten som inneholder output/ og translations/.",
    )
    parser.add_argument(
        "--output-dir",
        default=None,
        help="Sti til IG Publisher output-mappen. Default er <ig-root>/output.",
    )
    parser.add_argument(
        "--translations-dir",
        default=None,
        help="Sti til oversettelses-json. Default er <ig-root>/translations/en/json.",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    ig_root = Path(args.ig_root).resolve()
    output_dir = Path(args.output_dir).resolve() if args.output_dir else ig_root / "output"
    translations_dir = Path(args.translations_dir).resolve() if args.translations_dir else ig_root / "translations" / "en" / "json"

    if not output_dir.exists():
        raise SystemExit(f"Fant ikke output-mappen: {output_dir}")
    if not translations_dir.exists():
        raise SystemExit(f"Fant ikke oversettelses-mappen: {translations_dir}")

    replacements = load_replacements(translations_dir)
    mirrored_pages = build_mirror(output_dir=output_dir, replacements=replacements)

    print(f"Bygget {len(mirrored_pages)} engelske speilsider under {output_dir / 'en'}")
    print(f"Brukte {len(replacements)} oversettelsespar fra {translations_dir}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
