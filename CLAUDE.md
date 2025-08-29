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

# Install Norwegian base profiles
npm --registry https://packages.simplifier.net install hl7.fhir.no.basis@2.1.1
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

The project follows Norwegian healthcare data standards and integrates with FEST (Norwegian drug database) identifiers.