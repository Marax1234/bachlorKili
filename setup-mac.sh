#!/bin/zsh
# ============================================================
# Mac-Setup: Bachelorarbeit LaTeX-Projekt
# KSH München – Kilian Siebert
#
# Dieses Script installiert alles, was benötigt wird, damit
# das Projekt in VS Code mit LaTeX Workshop bei jedem Speichern
# automatisch neu gerendert wird.
#
# Voraussetzung: macOS mit Internetzugang
# Aufruf:  chmod +x setup-mac.sh && ./setup-mac.sh
# ============================================================

set -e

echo "=== Bachelorarbeit LaTeX – Mac Setup ==="
echo ""

# ----------------------------------------------------------
# 1. Homebrew (falls nicht vorhanden)
# ----------------------------------------------------------
if ! command -v brew &>/dev/null; then
    echo "→ Installiere Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Apple Silicon PATH
    if [[ -f /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
        echo '# Homebrew' >> ~/.zshrc
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
    fi
else
    echo "✓ Homebrew bereits installiert"
fi

# ----------------------------------------------------------
# 2. MacTeX (Full TeX Live Distribution mit LuaLaTeX + Biber)
# ----------------------------------------------------------
if ! command -v lualatex &>/dev/null; then
    echo "→ Installiere MacTeX (ca. 5 GB, dauert eine Weile)..."
    brew install --cask mactex

    # TeX Live Binaries zum PATH hinzufügen
    TEXLIVE_BIN="/Library/TeX/texbin"
    if [[ -d "$TEXLIVE_BIN" ]] && ! echo "$PATH" | grep -q "$TEXLIVE_BIN"; then
        echo "" >> ~/.zshrc
        echo "# MacTeX / TeX Live" >> ~/.zshrc
        echo "export PATH=\"$TEXLIVE_BIN:\$PATH\"" >> ~/.zshrc
        export PATH="$TEXLIVE_BIN:$PATH"
    fi
else
    echo "✓ LuaLaTeX bereits installiert ($(lualatex --version | head -1))"
fi

# ----------------------------------------------------------
# 3. Prüfe benötigte Tools
# ----------------------------------------------------------
echo ""
echo "--- Prüfe benötigte Programme ---"

MISSING=()

for cmd in lualatex biber latexmk makeglossaries; do
    if command -v $cmd &>/dev/null; then
        echo "  ✓ $cmd"
    else
        echo "  ✗ $cmd FEHLT"
        MISSING+=($cmd)
    fi
done

if [[ ${#MISSING[@]} -gt 0 ]]; then
    echo ""
    echo "FEHLER: Folgende Programme fehlen: ${MISSING[*]}"
    echo "Bitte Terminal neu öffnen (PATH laden) oder MacTeX neu installieren."
    exit 1
fi

# ----------------------------------------------------------
# 4. Font: Carlito (metrisch kompatibel mit Calibri)
# ----------------------------------------------------------
if fc-list | grep -qi "carlito"; then
    echo "  ✓ Font 'Carlito' vorhanden"
else
    echo "→ Installiere Font 'Carlito'..."

    FONT_DIR="$HOME/Library/Fonts"
    mkdir -p "$FONT_DIR"

    CARLITO_URL="https://github.com/googlefonts/carlito/raw/main/fonts/ttf"
    for variant in Carlito-Regular Carlito-Bold Carlito-Italic Carlito-BoldItalic; do
        if [[ ! -f "$FONT_DIR/${variant}.ttf" ]]; then
            curl -sL "$CARLITO_URL/${variant}.ttf" -o "$FONT_DIR/${variant}.ttf"
        fi
    done

    echo "  ✓ Carlito installiert nach $FONT_DIR"
fi

# ----------------------------------------------------------
# 5. VS Code + LaTeX Workshop Extension
# ----------------------------------------------------------
echo ""
if command -v code &>/dev/null; then
    echo "✓ VS Code CLI ('code') verfügbar"

    if code --list-extensions 2>/dev/null | grep -qi "james-yu.latex-workshop"; then
        echo "  ✓ LaTeX Workshop Extension installiert"
    else
        echo "→ Installiere LaTeX Workshop Extension..."
        code --install-extension James-Yu.latex-workshop
    fi
else
    echo "⚠ VS Code CLI 'code' nicht im PATH."
    echo "  → VS Code öffnen → Cmd+Shift+P → 'Shell Command: Install code in PATH'"
    echo "  → Danach dieses Script nochmals ausführen oder manuell installieren:"
    echo "     Extension: James-Yu.latex-workshop"
fi

# ----------------------------------------------------------
# 6. Erster Build (Test)
# ----------------------------------------------------------
echo ""
echo "--- Teste Build ---"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

if [[ -f main.tex ]] && [[ -f .latexmkrc ]]; then
    echo "→ Starte latexmk (erster Build)..."
    latexmk -pdf -lualatex -interaction=nonstopmode main.tex

    if [[ -f main.pdf ]]; then
        echo ""
        echo "✓ Build erfolgreich! main.pdf wurde erzeugt."
    else
        echo ""
        echo "⚠ Build eventuell fehlgeschlagen. Bitte main.log prüfen."
    fi
else
    echo "⚠ main.tex oder .latexmkrc nicht gefunden."
    echo "  Bitte Script aus dem Projektverzeichnis ausführen."
fi

# ----------------------------------------------------------
# 7. Zusammenfassung
# ----------------------------------------------------------
echo ""
echo "============================================================"
echo "  SETUP ABGESCHLOSSEN"
echo "============================================================"
echo ""
echo "  Workflow:"
echo "    1. Projekt in VS Code öffnen:  code ."
echo "    2. Eine .tex-Datei öffnen"
echo "    3. Speichern (Cmd+S) → Build startet automatisch"
echo "    4. PDF-Vorschau öffnet sich als Tab"
echo ""
echo "  Manueller Build (Terminal):"
echo "    latexmk"
echo ""
echo "  Aufräumen:"
echo "    latexmk -c          (temporäre Dateien löschen)"
echo "    latexmk -C          (alles inkl. PDF löschen)"
echo ""
echo "============================================================"
