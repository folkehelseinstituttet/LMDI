#!/bin/bash

# ================================================================================
# LMDI Implementation Guide - Lokal Build Script (Bash for WSL2)
# ================================================================================
# Dette scriptet bygger LMDI IG lokalt med HL7 IG Publisher
# Krever: Java 11+, Node.js, npm
# 
# Mappestruktur:
#   /rot-mappe (der scriptet ligger)
#     ├── byggig.sh (dette scriptet)
#     ├── publisher/ (IG Publisher lagres her - ikke i git)
#     ├── LMDI/ (IG kildekode)
#     └── no-basis-2.2.2.tgz
#
# Bruk:
#   ./byggig.sh           - Viser meny
#   ./byggig.sh build     - Bygger direkte
#   ./byggig.sh clean     - Renser output
#   ./byggig.sh update    - Oppdaterer publisher og bygger
# ================================================================================

# Finn scriptets plassering
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Konfigurasjon
IG_DIR="${SCRIPT_DIR}/LMDI"
PUBLISHER_DIR="${SCRIPT_DIR}/publisher"
PUBLISHER_JAR="${PUBLISHER_DIR}/publisher.jar"
NO_BASIS_VERSION="2.2.2"
NO_BASIS_FILE="${SCRIPT_DIR}/no-basis-${NO_BASIS_VERSION}.tgz"
PUBLISHER_URL="https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar"
NO_BASIS_URL="https://raw.githubusercontent.com/HL7Norway/resources/main/snapshots/hl7.fhir.no.basis-${NO_BASIS_VERSION}-snapshots.tgz"

# OPTIMALISERING: Bruk alltid Linux filesystem for raskere I/O (2-10x speedup)
if [[ -n "$WSL_DISTRO_NAME" ]]; then
    # WSL2 - bruk Linux filesystem for maksimal ytelse
    WIN_USER=$(cmd.exe /c "echo %USERNAME%" 2>/dev/null | tr -d '\r')
    FHIR_CACHE="${HOME}/.fhir/packages"  # Linux-side cache
    echo "🐧 WSL2 optimalisert - bruker Linux filesystem for cache"
else
    # Native Linux
    FHIR_CACHE="${HOME}/.fhir/packages"
fi

# IG Publisher input-cache (inne i LMDI for kompatibilitet)
IG_INPUT_CACHE="${IG_DIR}/input-cache"

# Java heap size og WSL2-optimaliserte innstillinger
JAVA_HEAP="4g"
JAVA_OPTS="-Xmx${JAVA_HEAP} -Xms2g -XX:+UseG1GC -XX:+UseStringDeduplication -XX:+OptimizeStringConcat -XX:MaxGCPauseMillis=200 -Djava.awt.headless=true -Dfile.encoding=UTF-8"

# WSL2 temp directory for raskere I/O
IG_TEMP_DIR="/tmp/ig-build-$$"

# Farger for output
RED=$'\e[0;31m'
GREEN=$'\e[0;32m'
YELLOW=$'\e[1;33m'
BLUE=$'\e[0;36m'
MAGENTA=$'\e[0;35m'
NC=$'\e[0m'  # No Color

print_color() {
  # %b gjør at backslash-escapes tolkes hvis de finnes
  printf '%b\n' "${1}${2}${NC}"
}


# ================================================================================
# Hjelpefunksjoner
# ================================================================================

print_color() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}"
}

print_header() {
    print_color "$BLUE" "================================================================================"
    print_color "$BLUE" "  LMDI Implementation Guide - Build System (Bash for WSL2)"
    print_color "$BLUE" "================================================================================"
    echo ""
}

check_ig_structure() {
    if [[ ! -f "$IG_DIR/ig.ini" ]] && [[ ! -f "$IG_DIR/sushi-config.yaml" ]]; then
        print_color "$RED" "FEIL: Kan ikke finne IG filer!"
        echo "Forventet å finne ig.ini eller sushi-config.yaml i: ${IG_DIR}"
        echo ""
        echo "Sjekk at scriptet ligger i samme mappe som IG-filene:"
        echo "  ${SCRIPT_DIR}/"
        echo "    ├── byggig.sh (dette scriptet)"
        echo "    ├── ig.ini"
        echo "    ├── sushi-config.yaml"
        echo "    └── input/"
        return 1
    fi
    return 0
}

check_command() {
    local cmd=$1
    local name=$2
    local url=$3
    
    if command -v "$cmd" &> /dev/null; then
        local version=$($cmd --version 2>&1 | head -n1)
        print_color "$GREEN" "[✓] ${name} er installert"
        echo "    Version: ${version}"
        return 0
    else
        print_color "$RED" "[X] ${name} er ikke installert eller ikke i PATH"
        [[ -n "$url" ]] && echo "    Last ned fra: ${url}"
        return 1
    fi
}

check_java() {
    if command -v java &> /dev/null; then
        local version=$(java -version 2>&1 | head -n1)
        print_color "$GREEN" "[✓] Java er installert"
        echo "    Version: ${version}"
        return 0
    else
        print_color "$RED" "[X] Java er ikke installert"
        echo "    For WSL2 Ubuntu/Debian: sudo apt-get install openjdk-17-jdk"
        echo "    For WSL2 med SDKMAN: sdk install java 17.0.9-tem"
        return 1
    fi
}

# ================================================================================
# Installasjons-funksjoner
# ================================================================================

download_publisher() {
    local force_update=${1:-false}
    
    if [[ -f "$PUBLISHER_JAR" ]] && [[ "$force_update" == "false" ]]; then
        print_color "$GREEN" "Publisher allerede installert"
        return 0
    fi
    
    print_color "$YELLOW" "Laster ned siste versjon av IG Publisher..."
    
    # Opprett publisher directory hvis den ikke finnes
    if [[ ! -d "$PUBLISHER_DIR" ]]; then
        echo "Oppretter publisher mappe..."
        mkdir -p "$PUBLISHER_DIR"
    fi
    
    # Slett gammel publisher hvis den finnes
    [[ -f "$PUBLISHER_JAR" ]] && rm "$PUBLISHER_JAR"
    
    # Last ned ny publisher
    echo "Laster ned fra: ${PUBLISHER_URL}"
    echo "Til: ${PUBLISHER_JAR}"
    
    if command -v wget &> /dev/null; then
        wget -q -O "$PUBLISHER_JAR" "$PUBLISHER_URL"
    elif command -v curl &> /dev/null; then
        curl -L -o "$PUBLISHER_JAR" "$PUBLISHER_URL"
    else
        print_color "$RED" "Verken wget eller curl er installert!"
        echo "Installer med: sudo apt-get install wget"
        return 1
    fi
    
    if [[ ! -f "$PUBLISHER_JAR" ]]; then
        print_color "$RED" "Feil ved nedlasting av publisher!"
        return 1
    fi
    
    print_color "$GREEN" "Publisher lastet ned!"
    
    # Kopier også til LMDI/input-cache for kompatibilitet
    if [[ ! -d "$IG_INPUT_CACHE" ]]; then
        mkdir -p "$IG_INPUT_CACHE"
    fi
    echo "Kopierer publisher til input-cache for kompatibilitet..."
    cp "$PUBLISHER_JAR" "${IG_INPUT_CACHE}/publisher.jar"
    
    print_color "$GREEN" "Publisher klar!"
    return 0
}

install_nobasis() {
    local silent=${1:-false}
    
    [[ "$silent" == "false" ]] && print_color "$BLUE" "Installerer no-basis pakke..."
    
    cd "$SCRIPT_DIR" || return 1
    
    # Sjekk om lokal fil finnes
    local nobasis_file=""
    if [[ -f "$NO_BASIS_FILE" ]]; then
        print_color "$GREEN" "Bruker lokal no-basis fil"
        nobasis_file="$NO_BASIS_FILE"
    else
        print_color "$YELLOW" "Laster ned no-basis fra GitHub..."
        nobasis_file="hl7.fhir.no.basis-${NO_BASIS_VERSION}-snapshots.tgz"
        
        if command -v wget &> /dev/null; then
            wget -q -O "$nobasis_file" "$NO_BASIS_URL"
        elif command -v curl &> /dev/null; then
            curl -L -o "$nobasis_file" "$NO_BASIS_URL"
        else
            print_color "$RED" "Kan ikke laste ned - installer wget eller curl"
            return 1
        fi
    fi
    
    # Installer FHIR R4 Core først
    if [[ ! -d "node_modules/hl7.fhir.r4.core" ]]; then
        echo "Installerer FHIR R4 Core..."
        npm --registry https://packages.simplifier.net install hl7.fhir.r4.core@4.0.1
    fi
    
    # Installer no-basis med npm
    echo "Installerer no-basis med npm..."
    npm install "$nobasis_file"
    
    if [[ $? -ne 0 ]]; then
        print_color "$RED" "Feil ved npm install av no-basis!"
        return 1
    fi
    
    # Kopier til FHIR cache
    echo "Kopierer til FHIR package cache..."
    local cache_dir="${FHIR_CACHE}/hl7.fhir.no.basis#${NO_BASIS_VERSION}/package"
    
    mkdir -p "$cache_dir"
    cp -r node_modules/hl7.fhir.no.basis/* "$cache_dir/"
    
    print_color "$GREEN" "no-basis installert!"
    return 0
}

ensure_nobasis() {
    local cache_dir="${FHIR_CACHE}/hl7.fhir.no.basis#${NO_BASIS_VERSION}/package"
    
    if [[ ! -f "${cache_dir}/package.json" ]]; then
        print_color "$YELLOW" "no-basis ikke funnet i cache. Installerer..."
        install_nobasis true
        return $?
    fi
    return 0
}

# ================================================================================
# Build-funksjoner
# ================================================================================

run_sushi() {
    print_color "$BLUE" "Kjører SUSHI..."
    
    cd "$IG_DIR" || return 1
    
    # Sjekk om SUSHI er installert
    if ! command -v sushi &> /dev/null; then
        print_color "$YELLOW" "SUSHI ikke installert. Installerer..."
        npm install -g fsh-sushi
    fi
    
    # Kjør SUSHI
    echo "Kompilerer FSH filer..."
    sushi .
    
    local exit_code=$?
    if [[ $exit_code -ne 0 ]]; then
        print_color "$RED" "SUSHI feilet!"
        return 1
    fi
    
    print_color "$GREEN" "SUSHI kompilering fullført!"
    return 0
}

run_publisher() {
    print_color "$BLUE" "Kjører optimalisert IG Publisher..."
    
    cd "$IG_DIR" || return 1
    
    # WSL2 optimalisering - bruk Linux temp directory
    export TMPDIR="$IG_TEMP_DIR"
    mkdir -p "$TMPDIR"
    
    # Cleanup function
    cleanup_temp() {
        [[ -d "$TMPDIR" ]] && rm -rf "$TMPDIR"
    }
    trap cleanup_temp EXIT
    
    echo "Starter optimalisert publisher..."
    echo "Publisher: ${PUBLISHER_JAR}"
    echo "Java opts: ${JAVA_OPTS}"
    echo "Temp dir: ${TMPDIR}"
    echo "Cache: ${FHIR_CACHE}"
    
    start_time=$(date +%s)
    
    java $JAVA_OPTS -jar "$PUBLISHER_JAR" publisher -ig ig.ini -no-sushi -watch-mode off -debug false
    
    local exit_code=$?
    end_time=$(date +%s)
    duration=$((end_time - start_time))
    
    cleanup_temp
    
    if [[ $exit_code -ne 0 ]]; then
        print_color "$RED" "IG Publisher feilet!"
        return 1
    fi
    
    print_color "$GREEN" "IG build fullført på ${duration} sekunder!"
    echo ""
    print_color "$BLUE" "Output tilgjengelig i: ${IG_DIR}/output"
    print_color "$BLUE" "Åpne i nettleser: file://${IG_DIR}/output/index.html"
    
    # For WSL2, tilby å åpne i Windows nettleser
    if [[ -n "$WSL_DISTRO_NAME" ]]; then
        echo ""
        read -p "Vil du åpne IG i Windows nettleser? (j/n): " open_browser
        if [[ "$open_browser" == "j" ]]; then
            # Konverter WSL path til Windows path
            local win_path=$(wslpath -w "${IG_DIR}/output/index.html")
            cmd.exe /c start "$win_path" 2>/dev/null
        fi
    fi
    
    return 0
}

# ================================================================================
# Hovedfunksjoner
# ================================================================================

check_dependencies() {
    print_color "$BLUE" "Sjekker system dependencies..."
    echo ""
    
    local all_ok=true
    
    # Sjekk Java
    check_java || all_ok=false
    
    # Sjekk Node.js
    check_command "node" "Node.js" "https://nodejs.org/" || all_ok=false
    
    # Sjekk npm
    check_command "npm" "npm" "" || all_ok=false
    
    # Sjekk SUSHI
    if command -v sushi &> /dev/null; then
        local version=$(sushi --version 2>&1)
        print_color "$GREEN" "[✓] SUSHI er installert"
        echo "    Version: ${version}"
    else
        print_color "$YELLOW" "[!] SUSHI er ikke installert"
        echo "    Installer med: npm install -g fsh-sushi"
    fi
    
    # Sjekk publisher
    if [[ -f "$PUBLISHER_JAR" ]]; then
        print_color "$GREEN" "[✓] IG Publisher er installert"
        echo "    Plassering: ${PUBLISHER_JAR}"
    else
        print_color "$YELLOW" "[!] IG Publisher ikke funnet"
        echo "    Vil lastes ned automatisk ved bygging"
    fi
    
    # Sjekk no-basis
    if [[ -f "$NO_BASIS_FILE" ]]; then
        print_color "$GREEN" "[✓] no-basis pakke funnet lokalt"
        echo "    Fil: ${NO_BASIS_FILE}"
    else
        print_color "$YELLOW" "[!] no-basis pakke ikke funnet lokalt"
        echo "    Vil lastes ned ved behov"
    fi
    
    # WSL2 spesifikk info
    if [[ -n "$WSL_DISTRO_NAME" ]]; then
        echo ""
        print_color "$MAGENTA" "WSL2 Informasjon:"
        echo "  Distro: ${WSL_DISTRO_NAME}"
        echo "  FHIR Cache: ${FHIR_CACHE}"
        echo "  Windows bruker: ${WIN_USER}"
    fi
    
    echo ""
    if [[ "$all_ok" == "false" ]]; then
        print_color "$RED" "Noen dependencies mangler. Fiks disse før du bygger."
        return 1
    else
        print_color "$GREEN" "Alle dependencies er OK!"
        return 0
    fi
}

build_ig() {
    local update_publisher=${1:-false}
    
    print_color "$BLUE" "Starter optimalisert IG build..."
    echo ""
    
    # Sjekk og last ned publisher hvis nødvendig
    if [[ ! -f "$PUBLISHER_JAR" ]] || [[ "$update_publisher" == "true" ]]; then
        download_publisher "$update_publisher" || return 1
    fi
    
    # Parallell operasjoner for raskere oppstart
    print_color "$YELLOW" "Forbereder dependencies parallelt..."
    (
        ensure_nobasis
    ) &
    nobasis_pid=$!
    
    (
        run_sushi
    ) &
    sushi_pid=$!
    
    # Vent på begge prosesser
    wait $nobasis_pid || return 1
    wait $sushi_pid || return 1
    
    print_color "$GREEN" "Forarbeid fullført - starter publisher..."
    run_publisher || return 1
    
    return 0
}

clean_output() {
    print_color "$YELLOW" "Renser cache og output..."
    echo ""
    
    echo "Sletter følgende:"
    echo "  - ${IG_DIR}/output"
    echo "  - ${IG_DIR}/temp"
    echo "  - ${IG_DIR}/template"
    echo "  - ${IG_DIR}/fsh-generated"
    echo ""
    
    read -p "Er du sikker? (j/n): " confirm
    if [[ "$confirm" != "j" ]]; then
        echo "Avbryter..."
        return 0
    fi
    
    [[ -d "${IG_DIR}/output" ]] && rm -rf "${IG_DIR}/output"
    [[ -d "${IG_DIR}/temp" ]] && rm -rf "${IG_DIR}/temp"
    [[ -d "${IG_DIR}/template" ]] && rm -rf "${IG_DIR}/template"
    [[ -d "${IG_DIR}/fsh-generated" ]] && rm -rf "${IG_DIR}/fsh-generated"
    
    print_color "$GREEN" "Rensing fullført!"
    return 0
}

show_menu() {
    while true; do
        clear
        print_header
        echo "  Script: ${SCRIPT_DIR}"
        echo "  IG:     ${IG_DIR}"
        echo ""
        echo "  Velg en opsjon:"
        echo ""
        echo "  ${BLUE}1.${NC} Bygg IG ${GREEN}(anbefalt)${NC}"
        echo "  ${BLUE}2.${NC} Bygg IG med oppdatert publisher"
        echo "  ${BLUE}3.${NC} Installer/oppdater no-basis pakke"
        echo "  ${BLUE}4.${NC} Rens cache og output"
        echo "  ${BLUE}5.${NC} Kjør bare SUSHI"
        echo "  ${BLUE}6.${NC} Sjekk dependencies"
        echo "  ${BLUE}7.${NC} Åpne output i nettleser"
        echo "  ${BLUE}8.${NC} Avslutt"
        echo ""
        read -p "Skriv inn valg (1-8): " choice
        
        case $choice in
            1)
                build_ig false
                read -p "Trykk Enter for å fortsette..."
                ;;
            2)
                build_ig true
                read -p "Trykk Enter for å fortsette..."
                ;;
            3)
                install_nobasis false
                read -p "Trykk Enter for å fortsette..."
                ;;
            4)
                clean_output
                read -p "Trykk Enter for å fortsette..."
                ;;
            5)
                ensure_nobasis && run_sushi
                read -p "Trykk Enter for å fortsette..."
                ;;
            6)
                check_dependencies
                read -p "Trykk Enter for å fortsette..."
                ;;
            7)
                if [[ -f "${IG_DIR}/output/index.html" ]]; then
                    if [[ -n "$WSL_DISTRO_NAME" ]]; then
                        local win_path=$(wslpath -w "${IG_DIR}/output/index.html")
                        cmd.exe /c start "$win_path" 2>/dev/null
                        print_color "$GREEN" "Åpner i Windows nettleser..."
                    else
                        xdg-open "${IG_DIR}/output/index.html" 2>/dev/null || \
                        print_color "$YELLOW" "Kunne ikke åpne nettleser automatisk"
                    fi
                else
                    print_color "$RED" "Output finnes ikke! Kjør bygg først."
                fi
                read -p "Trykk Enter for å fortsette..."
                ;;
            8)
                print_color "$BLUE" "Ha en fin dag!"
                exit 0
                ;;
            *)
                print_color "$RED" "Ugyldig valg. Prøv igjen."
                sleep 1
                ;;
        esac
    done
}

# ================================================================================
# Main
# ================================================================================

main() {
    # Sjekk at IG struktur er OK
    check_ig_structure || exit 1
    
    # Håndter command line argumenter
    case "${1:-}" in
        build)
            build_ig false
            ;;
        update)
            build_ig true
            ;;
        clean)
            clean_output
            ;;
        deps|dependencies)
            check_dependencies
            ;;
        sushi)
            ensure_nobasis && run_sushi
            ;;
        help|--help|-h)
            echo "Bruk: $0 [kommando]"
            echo ""
            echo "Kommandoer:"
            echo "  build      - Bygg IG"
            echo "  update     - Oppdater publisher og bygg"
            echo "  clean      - Rens output"
            echo "  deps       - Sjekk dependencies"
            echo "  sushi      - Kjør bare SUSHI"
            echo "  help       - Vis denne hjelpeteksten"
            echo ""
            echo "Uten argumenter vises interaktiv meny"
            ;;
        *)
            show_menu
            ;;
    esac
}

# Kjør main
main "$@"
