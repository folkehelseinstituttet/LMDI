# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the LMDI (Legemiddeldata fra institusjon til Legemiddelregisteret) project - a FHIR R4 implementation guide for medication data transfer from healthcare institutions to the Norwegian Medication Registry. The project develops FHIR profiles, extensions, and documentation using FHIR Shorthand (FSH) and the FHIR IG Publisher.

## Architecture

- **FSH definitions**: All FHIR artifacts are defined using FSH in `LMDI/input/fsh/`
  - `profiles/`: Core FHIR profiles for medication data
  - `extensions/`: Custom extensions for Norwegian healthcare requirements  
  - `valuesets/`: Code systems and value sets
  - `examples/`: Sample instances demonstrating profile usage
  - `namingsystems/`: Identifier system definitions

- **Documentation**: Norwegian-language documentation in `LMDI/input/pagecontent/`
- **Templates**: Custom FHI template in `LMDI/ig-template-fhi/`
- **Generated output**: Published IG content in `LMDI/output/`

## Tospråklighet (engelsk /en/-speiling)

IG-en er norsk. Engelsk versjon lages som en **etterprosessering** av IG Publisher-output,
ikke via IG Publisher sin innebygde flerspråksmekanisme.

- **Gjeldende mekanisme**: `scripts/lag-en-doklag.py` bygger en speiling under
  `LMDI/output/en/`. Den henter oversettelsespar fra `_title`/`_description`/`_short`/
  `_definition`-felter (FHIR `translation`-extension, `lang=en`) i
  `LMDI/fsh-generated/resources/*.json`, og gjør **ordrett substring-erstatning** av
  norsk → engelsk i HTML-en. For StructureDefinition-sider byttes hele rendret
  description-blokk ut særskilt. Kjøres etter en full IG-bygg (output/ må finnes).
- **Oversettelser defineres i FSH** via `^...extension[...]`-blokker (se f.eks.
  `lmdi-Patient.fsh`). Det finnes ingen separate oversettelsesfiler.
- **Utdatert/forlatt mekanisme**: `LMDI/translations/en/{json,xliff}/` var IG Publisher
  sin offisielle flerspråksmekanisme (alle `target` = null). Den er **revertert** og
  filene slettes (se de stagede slettingene i arbeidstreet). Ikke bygg videre på dem.
- **Kjent begrensning**: substring-erstatning krever eksakt treff. IG Publisher dropper
  siste punktum og legger til "(this element must be supported)" i `mustSupport`-tooltips,
  så lange `definition`-oversettelser slår ikke alltid inn der.
- **Revisjon av dekning**: `python3 scripts/sjekk-oversettelser.py` (kun lesende) lister
  felt som mangler oversettelse, og MS-definisjoner der eksisterende oversettelse ikke
  anvendes. Eksempel-**dataverdier** (stedsnavn o.l.) er utenfor scope.

## Development Commands

### FHIR Shorthand Compilation
```bash
cd LMDI
sushi .
```

### Full IG Build (requires Java and IG Publisher)
```bash
# Download IG Publisher first
wget -q https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar

# Run IG Publisher
java -jar publisher.jar -ig ig.ini -generate
```

### Validation
```bash
cd LMDI/input/fsh/profiles/
fsh-validator *.fsh
```

### Dependencies Installation
```bash
# Install SUSHI globally
npm install -g fsh-sushi

# Install FHIR R4 core
npm --registry https://packages.simplifier.net install hl7.fhir.r4.core@4.0.1

# Install Norwegian base profiles (no-basis 2.2.0 - snapshot version)
# Download snapshot from GitHub (required for SUSHI compilation)
curl -L -o hl7.fhir.no.basis-2.2.0-snapshots.tgz https://raw.githubusercontent.com/HL7Norway/resources/main/snapshots/hl7.fhir.no.basis-2.2.0-snapshots.tgz
npm install hl7.fhir.no.basis-2.2.0-snapshots.tgz

# Setup FHIR package cache for no-basis (required for SUSHI compilation)
mkdir -p ~/.fhir/packages/hl7.fhir.no.basis#2.2.0/package
cp -r ./node_modules/hl7.fhir.no.basis/* ~/.fhir/packages/hl7.fhir.no.basis#2.2.0/package
```

## Key Files

- `LMDI/sushi-config.yaml`: Main SUSHI configuration with IG metadata
- `LMDI/ig.ini`: IG Publisher configuration  
- `LMDI/input/ignoreWarnings.txt`: QA validation suppressions
- `.github/workflows/`: CI/CD workflows for validation and publishing

## Version Information

- FHIR Version: 4.0.1
- Current Version: 1.0.4 (targeting 1.0 release spring 2025)
- Language: Norwegian (no)
- License: CC-BY-4.0

## Development Workflow

1. Edit FSH files in appropriate subdirectories under `LMDI/input/fsh/`
2. Run `sushi .` to compile FSH to FHIR resources
3. For full documentation generation, run IG Publisher
4. Generated content appears in `LMDI/output/`
5. Etter endringer i FSH-filer: oppdater lmdi-fhir-skillen etter prosedyren i `.claude/skills/lmdi-fhir/UPDATE.md`

## Claude Skills

`.claude/skills/lmdi-fhir/` er en symlink til `Fhi.Legemiddelregisteret.wiki`-repoet (`AgentSkills/lmdi-fhir/`). Skill-filene (SKILL.md, UPDATE.md, references/) versjonsstyres **ikke** i dette repoet.

**Viktig ved arbeid med skill-filer:**
- Sjekk at skill-filene er oppdatert med siste FSH-endringer før bruk (se proveniens-tabellen i `UPDATE.md`)
- Oppdatering av skillen gjøres etter prosedyren i `.claude/skills/lmdi-fhir/UPDATE.md`
- Endringer i skill-filer må committes og pushes i wiki-repoet (`Fhi.Legemiddelregisteret.wiki`)
- `.claude/skills/` er lagt til i `.gitignore` og trackes ikke her

The project follows Norwegian healthcare data standards and integrates with FEST (Norwegian drug database) identifiers.

## Local Testing with no-basis

When working with no-basis profiles, follow these testing steps:

### 1. Setup Development Environment
```bash
# From project root
cd /path/to/LMDI

# Install dependencies (see Dependencies Installation above)
npm install -g fsh-sushi
npm --registry https://packages.simplifier.net install hl7.fhir.r4.core@4.0.1
curl -L -o hl7.fhir.no.basis-2.2.0-snapshots.tgz https://raw.githubusercontent.com/HL7Norway/resources/main/snapshots/hl7.fhir.no.basis-2.2.0-snapshots.tgz
npm install hl7.fhir.no.basis-2.2.0-snapshots.tgz
mkdir -p ~/.fhir/packages/hl7.fhir.no.basis#2.2.0/package
cp -r ./node_modules/hl7.fhir.no.basis/* ~/.fhir/packages/hl7.fhir.no.basis#2.2.0/package
```

### 2. Test SUSHI Compilation
```bash
cd LMDI
sushi .

# Check for errors
echo $?  # Should be 0 for success

# Verify generated resources
ls fsh-generated/resources/
grep -i error fsh-generated/resources/*.json || echo "No errors found"
```

### 3. Verify no-basis Integration
```bash
# Check that NoBasisSubstance is available
grep -r "NoBasisSubstance" ~/.fhir/packages/hl7.fhir.no.basis#2.2.0/package/ || echo "Profile not found"

# Verify Substance profile compilation
grep -i "no-basis-substance" fsh-generated/resources/StructureDefinition-lmdi-substance.json
```

### 4. Troubleshooting
Common issues and solutions:

**SUSHI cannot find NoBasisSubstance:**
- Verify no-basis is installed in FHIR package cache: `ls ~/.fhir/packages/hl7.fhir.no.basis#2.2.0/package/`
- Check version consistency in sushi-config.yaml (should be 2.2.0)
- Clear cache and reinstall: `rm -rf ~/.fhir/packages/hl7.fhir.no.basis#2.2.0 && [reinstall]`
- Ensure you're using snapshot version from GitHub, not the local .tgz file

**Versjon conflicts:**
- Ensure consistent version usage: 2.2.0 in sushi-config.yaml, workflows, and package installation
- Use snapshot version: Download from https://raw.githubusercontent.com/HL7Norway/resources/main/snapshots/hl7.fhir.no.basis-2.2.0-snapshots.tgz