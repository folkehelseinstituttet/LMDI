#!/usr/bin/env bash
# Validerer at SKILL.md er konsistent med snapshoten i references/
# Sjekker: filreferanser, ingen eksterne stier, mappingtabell-dekning, metadata-synk.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
SKILL_MD="$SKILL_DIR/SKILL.md"
TARGET_FSH="$SKILL_DIR/references/fsh"
TARGET_CONFIG="$SKILL_DIR/references/sushi-config.yaml"

ERRORS=0

error() {
    echo "FEIL: $1" >&2
    ERRORS=$((ERRORS + 1))
}

# --- 1. Sjekk at SKILL.md ikke bruker LMDI/input/fsh/ som kilde (unntak: redigeringsinstruksjonen) ---
echo "=== Sjekker eksterne stier ==="
# Filtrer bort linjen som forklarer at redigeringer gjøres i LMDI/input/fsh/
ext_hits=$(grep -n 'LMDI/input/fsh/' "$SKILL_MD" | grep -v 'redigere\|rediger\|endring' || true)
if [[ -n "$ext_hits" ]]; then
    error "SKILL.md refererer til LMDI/input/fsh/ som kilde (ikke redigeringsinstruksjon):"
    echo "$ext_hits" | head -5 >&2
fi

# --- 2. Sjekk at filreferanser i SKILL.md finnes i snapshoten ---
echo "=== Sjekker filreferanser ==="
# Hent konkrete .fsh-filreferanser (ignorer glob-mønstre med *)
refs_file=$(mktemp)
grep -oE 'references/fsh/[^ |`\)]+\.fsh' "$SKILL_MD" \
    | grep -v '\*' \
    | sort -u > "$refs_file"
while read -r ref; do
    full_path="$SKILL_DIR/$ref"
    if [[ ! -f "$full_path" ]]; then
        error "Filreferanse i SKILL.md peker til manglende fil: $ref"
    fi
done < "$refs_file"
rm -f "$refs_file"

# --- 3. Mappingtabell-dekning ---
echo "=== Sjekker mappingtabell-dekning ==="

# Bygg lookup: for hvert artefakt samle både FSH-navn og Id (hvis definert)
# Sjekk at minst én av dem finnes i tabellen
snapshot_pairs=$(mktemp)

# Hent Profile/Extension/ValueSet-definisjoner med deres Id (hvis den finnes)
for fsh_file in "$TARGET_FSH"/profiles/*.fsh "$TARGET_FSH"/extensions/*.fsh "$TARGET_FSH"/valuesets/*.fsh; do
    [[ -f "$fsh_file" ]] || continue
    grep -nE '^(Profile|Extension|ValueSet): ' "$fsh_file" 2>/dev/null | while IFS=: read -r line_num match; do
        fsh_name=$(echo "$match" | sed 's/^\(Profile\|Extension\|ValueSet\): *//' | tr -d '\r' | sed 's/ *$//')
        # Sjekk om det finnes en Id: innen de neste 5 linjene
        fsh_id=$(sed -n "$((line_num+1)),$((line_num+5))p" "$fsh_file" \
            | grep -E '^Id: ' | head -1 | sed 's/^Id: *//' | tr -d '\r' | sed 's/ *$//' || true)
        if [[ -n "$fsh_id" ]]; then
            echo "${fsh_name}|${fsh_id}"
        else
            echo "${fsh_name}|${fsh_name}"
        fi
    done
done > "$snapshot_pairs"

# Hent artefakter fra mappingtabellen (første kolonne, fjern suffiks)
table_ids=$(mktemp)
grep -E '^\|[^|]+\|.*references/fsh/' "$SKILL_MD" \
    | sed 's/^| *//;s/ *(ext)//;s/ *(vs)//;s/ *(cs)//;s/ *|.*//' \
    | tr -d '\r' \
    | sort -u > "$table_ids"

# Sjekk at hvert snapshot-artefakt har en rad (match på enten navn eller Id)
while IFS='|' read -r fsh_name fsh_id; do
    [[ -z "$fsh_name" ]] && continue
    if ! grep -qx "$fsh_name" "$table_ids" && ! grep -qx "$fsh_id" "$table_ids"; then
        error "Snapshot-artefakt '$fsh_name' (Id: $fsh_id) mangler rad i mappingtabellen"
    fi
done < "$snapshot_pairs"

rm -f "$snapshot_pairs" "$table_ids"

# --- 3b. Sjekk at hver mappingrad peker til riktig artefakt i riktig fil ---
echo "=== Sjekker at tabellrader peker til riktig artefakt i riktig fil ==="
table_rows=$(mktemp)
grep -E '^\|[^|]+\|.*references/fsh/' "$SKILL_MD" | tr -d '\r' > "$table_rows"
while IFS='|' read -r _ artifact_col file_col _rest; do
    # Trim whitespace og fjern suffiks
    artifact=$(echo "$artifact_col" | sed 's/^ *//;s/ *$//;s/ *(ext)$//;s/ *(vs)$//;s/ *(cs)$//')
    fsh_file=$(echo "$file_col" | sed 's/^ *`//;s/`.*//;s/ *$//')
    [[ -z "$artifact" || -z "$fsh_file" ]] && continue
    full_path="$SKILL_DIR/$fsh_file"
    [[ ! -f "$full_path" ]] && continue
    # Sjekk at artefaktet finnes i filen (match på Id: eller Profile:/Extension:/ValueSet: navn, tolererer trailing whitespace)
    if ! grep -qE "(^(Profile|Extension|ValueSet): *${artifact} *$|^Id: *${artifact} *$)" "$full_path" 2>/dev/null; then
        error "Tabellrad '$artifact' peker til '$fsh_file', men artefaktet finnes ikke i den filen"
    fi
done < "$table_rows"
rm -f "$table_rows"

# --- 4. Metadata-synk ---
echo "=== Sjekker metadata-synk ==="
if [[ -f "$TARGET_CONFIG" ]]; then
    config_version=$(grep -E '^version:' "$TARGET_CONFIG" | sed 's/version: *//' | tr -d '\r')
    skill_version=$(grep 'Versjon: `' "$SKILL_MD" | sed 's/.*Versjon: `//;s/`.*//' | tr -d '\r')
    if [[ -n "$config_version" && -n "$skill_version" && "$config_version" != "$skill_version" ]]; then
        error "Versjon mismatch: sushi-config.yaml=$config_version, SKILL.md=$skill_version"
    fi

    config_date=$(grep -E '^date:' "$TARGET_CONFIG" | sed 's/date: *//' | tr -d '\r')
    skill_date=$(grep 'Dato: `' "$SKILL_MD" | sed 's/.*Dato: `//;s/`.*//' | tr -d '\r')
    if [[ -n "$config_date" && -n "$skill_date" && "$config_date" != "$skill_date" ]]; then
        error "Dato mismatch: sushi-config.yaml=$config_date, SKILL.md=$skill_date"
    fi

    config_status=$(grep -E '^status:' "$TARGET_CONFIG" | sed 's/status: *//' | tr -d '\r')
    skill_status=$(grep 'Status: `' "$SKILL_MD" | sed 's/.*Status: `//;s/`.*//' | tr -d '\r')
    if [[ -n "$config_status" && -n "$skill_status" && "$config_status" != "$skill_status" ]]; then
        error "Status mismatch: sushi-config.yaml=$config_status, SKILL.md=$skill_status"
    fi
else
    error "references/sushi-config.yaml finnes ikke — kjør sync_references.sh først"
fi

# --- Resultat ---
echo ""
if [[ $ERRORS -gt 0 ]]; then
    echo "Validering FEILET med $ERRORS feil."
    exit 1
else
    echo "Validering OK — ingen feil funnet."
    exit 0
fi
