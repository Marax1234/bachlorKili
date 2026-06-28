# Bachelorarbeit – LaTeX-Projekt

**Autor:** Kilian Siebert  
**Hochschule:** KSH München, Campus Benediktbeuern  
**Studiengang:** Soziale Arbeit (B.A.)

---

## Voraussetzungen

| Tool | Zweck |
|------|-------|
| MacTeX | TeX-Distribution (enthält LuaLaTeX, Biber, latexmk, makeglossaries) |
| VS Code | Editor |
| LaTeX Workshop | VS Code Extension – automatischer Build beim Speichern |
| Carlito Font | Schriftart (metrisch kompatibel mit Calibri) |

---

## Automatisches Setup (empfohlen)

```bash
git clone <repo-url>
cd bachlorKili
chmod +x setup-mac.sh
./setup-mac.sh
```

Das Script installiert alle Abhängigkeiten und führt einen Test-Build durch.

---

## Manuelles Setup (Schritt für Schritt)

### 1. Homebrew installieren

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Apple Silicon – nach der Installation:

```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
source ~/.zshrc
```

### 2. MacTeX installieren

```bash
brew install --cask mactex
```

> Ca. 5 GB Download. Enthält LuaLaTeX, Biber, latexmk, makeglossaries und alle benötigten LaTeX-Pakete.

Nach der Installation Terminal neu öffnen, damit `/Library/TeX/texbin` im PATH liegt.

Prüfen:

```bash
lualatex --version
biber --version
latexmk --version
makeglossaries --version
```

### 3. Carlito Font installieren

```bash
mkdir -p ~/Library/Fonts
cd ~/Library/Fonts

curl -sLO https://github.com/googlefonts/carlito/raw/main/fonts/ttf/Carlito-Regular.ttf
curl -sLO https://github.com/googlefonts/carlito/raw/main/fonts/ttf/Carlito-Bold.ttf
curl -sLO https://github.com/googlefonts/carlito/raw/main/fonts/ttf/Carlito-Italic.ttf
curl -sLO https://github.com/googlefonts/carlito/raw/main/fonts/ttf/Carlito-BoldItalic.ttf
```

Prüfen:

```bash
fc-list | grep -i carlito
```

### 4. VS Code + Extension

1. [VS Code herunterladen](https://code.visualstudio.com/) und installieren
2. VS Code öffnen → `Cmd+Shift+P` → **Shell Command: Install 'code' command in PATH**
3. Extension installieren:

```bash
code --install-extension James-Yu.latex-workshop
```

---

## Projekt öffnen & arbeiten

```bash
cd bachlorKili
code .
```

### Workflow

1. Eine beliebige `.tex`-Datei öffnen
2. Bearbeiten und mit **Cmd+S** speichern
3. Der Build startet automatisch (Statusleiste unten zeigt Fortschritt)
4. PDF-Vorschau öffnet sich als Tab in VS Code

### Build-Rezept (wird automatisch ausgeführt)

```
LuaLaTeX → Biber → makeglossaries → LuaLaTeX → LuaLaTeX
```

Dies stellt sicher, dass Literaturverzeichnis, Abkürzungsverzeichnis und alle Querverweise korrekt aufgelöst werden.

---

## Terminal-Befehle

| Befehl | Beschreibung |
|--------|--------------|
| `latexmk` | Vollständiger Build (nutzt `.latexmkrc`) |
| `latexmk -pvc` | Continuous-Build (beobachtet Dateiänderungen) |
| `latexmk -c` | Temporäre Dateien löschen |
| `latexmk -C` | Alles löschen (inkl. PDF) |

---

## Projektstruktur

```
bachlorKili/
├── main.tex                 ← Hauptdatei (hier wird kompiliert)
├── preamble.tex             ← Pakete, Layout, Bibliographie-Stil
├── acronyms.tex             ← Abkürzungsverzeichnis
├── bibliography.bib         ← Literaturquellen
├── chapters/
│   ├── 00_titlepage.tex
│   ├── 01_summary.tex
│   ├── 02_vorwort.tex
│   ├── 03_einleitung.tex
│   ├── 04_hauptteil.tex
│   ├── 05_fazit.tex
│   ├── 06_anhang.tex
│   └── 07_erklaerung.tex
├── logos/                   ← Logos/Bilder für Titelseite
├── .latexmkrc               ← latexmk-Konfiguration
├── .vscode/settings.json    ← VS Code LaTeX Workshop Config
└── setup-mac.sh             ← Automatisches Setup-Script
```

---

## Troubleshooting

### Build schlägt fehl

```bash
# Log prüfen:
cat main.log | grep -i "error"

# Temporäre Dateien löschen und neu bauen:
latexmk -C && latexmk
```

### Font nicht gefunden

```
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Font "Carlito" not found.
```

→ Carlito-Fonts erneut installieren (siehe Schritt 3) und `fc-cache -fv` ausführen.

### Biber-Fehler

```
ERROR - Cannot find 'main.bcf'
```

→ Einmal `lualatex main.tex` manuell ausführen, dann `biber main`, dann nochmal `lualatex main.tex`.

### LaTeX Workshop baut nicht automatisch

1. `Cmd+Shift+P` → **LaTeX Workshop: View LaTeX Compiler Log**
2. Prüfen ob das richtige Rezept gewählt ist (Statusleiste unten links)
3. Sicherstellen, dass `latex-workshop.latex.autoBuild.run` auf `"onSave"` steht (ist in `.vscode/settings.json` bereits gesetzt)
