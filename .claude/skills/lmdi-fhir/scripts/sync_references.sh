#!/usr/bin/env bash
# Vedlikeholdsscript — kun for bruk i kilderepoet (ikke i distribuert ZIP).
# Synkroniserer FSH-kilder og sushi-config.yaml fra LMDI/ til references/
# Idempotent — trygt å kjøre flere ganger.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
REPO_ROOT="$(cd "$SKILL_DIR/../../.." && pwd)"

SOURCE_FSH="$REPO_ROOT/LMDI/input/fsh"
SOURCE_CONFIG="$REPO_ROOT/LMDI/sushi-config.yaml"
TARGET_REF="$SKILL_DIR/references"
TARGET_FSH="$TARGET_REF/fsh"

# Sjekk at forventede kildebaner finnes
for path in "$SOURCE_FSH" "$SOURCE_CONFIG" \
            "$SOURCE_FSH/aliases.fsh" \
            "$SOURCE_FSH/profiles" \
            "$SOURCE_FSH/extensions" \
            "$SOURCE_FSH/valuesets" \
            "$SOURCE_FSH/namingsystems"; do
    if [[ ! -e "$path" ]]; then
        echo "FEIL: Forventet kildebane mangler: $path" >&2
        exit 1
    fi
done

# Opprett målmapper
mkdir -p "$TARGET_FSH"

# Kopier sushi-config.yaml
cp "$SOURCE_CONFIG" "$TARGET_REF/sushi-config.yaml"
echo "Kopiert sushi-config.yaml"

# Kopier aliases.fsh
cp "$SOURCE_FSH/aliases.fsh" "$TARGET_FSH/aliases.fsh"
echo "Kopiert aliases.fsh"

# Synkroniser undermapper (sletter innhold først, kopierer deretter fra kilde)
for subdir in profiles extensions valuesets namingsystems; do
    if [[ -d "$SOURCE_FSH/$subdir" ]]; then
        rm -rf "$TARGET_FSH/$subdir"
        mkdir -p "$TARGET_FSH/$subdir"
        cp "$SOURCE_FSH/$subdir"/*.fsh "$TARGET_FSH/$subdir/"
        echo "Synkronisert $subdir/"
    fi
done

# Slett eventuelle undermapper i target som ikke finnes i source
for target_subdir in "$TARGET_FSH"/*/; do
    subdir_name="$(basename "$target_subdir")"
    if [[ ! -d "$SOURCE_FSH/$subdir_name" ]]; then
        rm -rf "$target_subdir"
        echo "Slettet utdatert mappe: $subdir_name/"
    fi
done

echo ""
echo "Sync fullført. Snapshot oppdatert i: $TARGET_REF"
