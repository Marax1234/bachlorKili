# Zitier-Anleitung (KSH-Stil)

Referenz fuer konsistente `.bib`-Eintraege und Zitation im Text.

---

## 1. Monografie (Buch)

**Ausgabe im Literaturverzeichnis:**
> Kessl, Fabian; Reutlinger, Christian (2010): Sozialraum. Eine Einfuehrung, 2. Auflage, Wiesbaden, VS Verlag fuer Sozialwissenschaften.

**Bib-Eintrag:**
```bibtex
@book{kessl2010,
  author    = {Kessl, Fabian and Reutlinger, Christian},
  title     = {Sozialraum. Eine Einführung},
  year      = {2010},
  edition   = {2},
  publisher = {VS Verlag für Sozialwissenschaften},
  address   = {Wiesbaden},
}
```

**Zitation im Text:**
```latex
% Indirektes Zitat (sinngemäß):
\parencite[vgl.][12]{kessl2010}          % → (vgl. Kessl/Reutlinger 2010, S. 12)
\parencite[vgl.][12\psq]{kessl2010}      % → (vgl. Kessl/Reutlinger 2010, S. 12 f.)
\parencite[vgl.][12\psqq]{kessl2010}     % → (vgl. Kessl/Reutlinger 2010, S. 12 ff.)

% Direktes Zitat (wörtlich):
\parencite[23]{kessl2010}                % → (Kessl/Reutlinger 2010, S. 23)

% Autor im Fließtext:
\textcite[23]{kessl2010}                 % → Kessl und Reutlinger (2010, S. 23)
```

**Hinweise:**
- `edition` als Zahl angeben (wird automatisch zu "2. Auflage")
- Erste Auflage NICHT angeben
- `address` = Erscheinungsort
- Mehrere Autoren mit `and` trennen

---

## 2. E-Book mit DOI

**Ausgabe im Literaturverzeichnis:**
> Kessl, Fabian; Reutlinger, Christian (2010): Sozialraum. Eine Einfuehrung [E-Book], 2. Auflage, Wiesbaden, VS Verlag fuer Sozialwissenschaften, DOI: 10.1007/978-3-531-92381-9.

**Bib-Eintrag:**
```bibtex
@book{kessl2010ebook,
  author    = {Kessl, Fabian and Reutlinger, Christian},
  title     = {Sozialraum. Eine Einführung [E-Book]},
  year      = {2010},
  edition   = {2},
  publisher = {VS Verlag für Sozialwissenschaften},
  address   = {Wiesbaden},
  doi       = {10.1007/978-3-531-92381-9},
}
```

**Hinweis:** `[E-Book]` manuell in den Titel schreiben.

---

## 3. Herausgeber-/Sammelband

**Ausgabe im Literaturverzeichnis:**
> Bommes, Michael; Tacke, Veronika (Hrsg.) (2011): Netzwerke in der funktional differenzierten Gesellschaft, Wiesbaden, VS Verlag fuer Sozialwissenschaften.

**Bib-Eintrag:**
```bibtex
@book{bommes2011,
  editor    = {Bommes, Michael and Tacke, Veronika},
  title     = {Netzwerke in der funktional differenzierten Gesellschaft},
  year      = {2011},
  publisher = {VS Verlag für Sozialwissenschaften},
  address   = {Wiesbaden},
}
```

**Hinweise:**
- `editor` statt `author` verwenden
- Typ bleibt `@book` (NICHT `@collection`)
- `(Hrsg.)` wird automatisch ergaenzt

---

## 4. Beitrag aus Sammelband (incollection)

**Ausgabe im Literaturverzeichnis:**
> Bommes, Michael; Tacke, Veronika (2011): Das Allgemeine und das Besondere des Netzwerkes. In: Bommes, Michael; Tacke, Veronika (Hrsg.): Netzwerke in der funktional differenzierten Gesellschaft, Wiesbaden, VS Verlag fuer Sozialwissenschaften, 25-50.

**Bib-Eintrag:**
```bibtex
@incollection{bommes2011a,
  author    = {Bommes, Michael and Tacke, Veronika},
  title     = {Das Allgemeine und das Besondere des Netzwerkes},
  year      = {2011},
  booktitle = {Netzwerke in der funktional differenzierten Gesellschaft},
  editor    = {Bommes, Michael and Tacke, Veronika},
  publisher = {VS Verlag für Sozialwissenschaften},
  address   = {Wiesbaden},
  pages     = {25--50},
}
```

**Hinweise:**
- `author` = Autor des Beitrags
- `editor` = Herausgeber des Sammelbands
- `booktitle` = Titel des Sammelbands
- `pages` mit doppeltem Minus: `25--50`
- Sowohl der Beitrag als auch der Sammelband selbst ins Literaturverzeichnis

---

## 5. Fachzeitschrift (article)

**Ausgabe im Literaturverzeichnis:**
> Lenk, Hans (1996): Philosophieren als kreatives Interpretieren. In: Zeitschrift fuer philosophische Forschung 50 (4), 131-152.

**Bib-Eintrag:**
```bibtex
@article{lenk1996,
  author       = {Lenk, Hans},
  title        = {Philosophieren als kreatives Interpretieren},
  year         = {1996},
  journaltitle = {Zeitschrift für philosophische Forschung},
  volume       = {50},
  number       = {4},
  pages        = {131--152},
}
```

**Mit DOI:**
```bibtex
@article{lenk1996doi,
  author       = {Lenk, Hans},
  title        = {Philosophieren als kreatives Interpretieren},
  year         = {1996},
  journaltitle = {Zeitschrift für philosophische Forschung},
  volume       = {50},
  number       = {4},
  pages        = {131--152},
  doi          = {10.1242/jcs.075200},
}
```

**Hinweise:**
- `journaltitle` (NICHT `journal`) fuer biblatex
- `volume` = Jahrgang
- `number` = Heftnummer

---

## 6. Zeitungsartikel

**Ausgabe im Literaturverzeichnis:**
> Geppert, Dominik (2013): Der Euro als Besserungsanstalt. In: Sueddeutsche Zeitung, Muenchen, 04.10.2013, 14.

**Bib-Eintrag:**
```bibtex
@article{geppert2013,
  author       = {Geppert, Dominik},
  title        = {Der Euro als Besserungsanstalt},
  year         = {2013},
  journaltitle = {Süddeutsche Zeitung},
  note         = {München, 04.10.2013},
  pages        = {14},
}
```

**Online-Zeitungsartikel ohne Autor:**
```bibtex
@article{spiegel2024,
  author       = {{Der Spiegel (Hrsg.)}},
  title        = {Landtagswahl in Brandenburg. AfD gewinnt bei jungen Wählern, Grüne verlieren},
  year         = {2024},
  journaltitle = {Der Spiegel},
  note         = {online, 22.09.2024},
  url          = {https://www.spiegel.de/politik/...},
  urldate      = {2024-09-22},
}
```

**Hinweise:**
- Ort und Datum der Zeitung in `note` schreiben
- Bei Online-Zeitungen: `note = {online, DD.MM.YYYY}`
- Zeitungsnamen als Institution inkl. (Hrsg.) in eine doppelte Klammer: `{{Der Spiegel (Hrsg.)}}`

---

## 7. Internetdokument mit Autor

**Ausgabe im Literaturverzeichnis:**
> Kirchhoff, Sabine (1999): Schreibwerkstatt. Von Schreibproblemen zu Schreibperspektiven. URL: http://... (zuletzt geprueft am 12.09.2013).

**Bib-Eintrag:**
```bibtex
@online{kirchhoff1999,
  author  = {Kirchhoff, Sabine},
  title   = {Schreibwerkstatt. Von Schreibproblemen zu Schreibperspektiven},
  year    = {1999},
  url     = {http://www.hdz.uni-dortmund.de/publik/Rundbrf/skirchh.htm},
  urldate = {2013-09-12},
}
```

**Hinweise:**
- `urldate` im ISO-Format: `YYYY-MM-DD` (wird automatisch zu `DD.MM.YYYY`)
- `year` = Erscheinungsjahr des Dokuments (wenn bekannt)

---

## 8. Internetdokument von Institution/Organisation

**Ausgabe im Literaturverzeichnis:**
> Landratsamt Bad Toelz-Wolfratshausen (Hrsg.) (2012): Seniorenplanung...

**Bib-Eintrag:**
```bibtex
@online{landratsamt2012,
  author  = {{Landratsamt Bad Tölz-Wolfratshausen (Hrsg.)}},
  title   = {Seniorenplanung. Das Seniorenpolitische Gesamtkonzept des Landkreises},
  year    = {2012},
  url     = {http://www.lra-toelz.de/...},
  urldate = {2013-03-20},
}
```

**Homepage ohne Jahr:**
```bibtex
@online{caritas,
  author  = {{Deutscher Caritasverband e.V. (Hrsg.)}},
  title   = {Caritas in Deutschland. Wohlfahrtsverband der Katholischen Kirche},
  year    = {o.\,J.},
  url     = {http://www.caritas.de},
  urldate = {2015-03-07},
}
```

**Hinweise:**
- Gesamter Name inkl. `(Hrsg.)` in EINE doppelte Klammer: `{{Name (Hrsg.)}}`
- Dadurch wird der ganze String als ein "Nachname" behandelt und korrekt ausgegeben
- Kein Jahr bekannt: `year = {o.\,J.}` ergibt `(o. J.)`

---

## 9. Lexikonartikel

**Bib-Eintrag:**
```bibtex
@incollection{ansen2022,
  author    = {Ansen, Harald},
  title     = {Anamnese},
  year      = {2022},
  booktitle = {Fachlexikon der Sozialen Arbeit},
  editor    = {{Deutscher Verein für öffentliche und private Fürsorge e.V.}},
  edition   = {9},
  address   = {Baden-Baden},
  pages     = {32},
}
```

---

## 10. Vortrag

**Bib-Eintrag:**
```bibtex
@misc{simeth2011,
  author = {Simeth, Angelika},
  title  = {Neue Chancen durch Freiwilligenmanagement},
  year   = {2011},
  note   = {Vertreterin der Sozialreferentin, Sozialreferat München, Vortrag am 10.12.2011, München},
}
```

---

## 11. Telefonat

**Bib-Eintrag:**
```bibtex
@misc{simeth2011a,
  author = {Simeth, Angelika},
  title  = {Auswirkung der Wirtschaftskrise auf die Soziale Arbeit in München},
  year   = {2011},
  note   = {Vertreterin der Sozialreferentin, Sozialreferat München, Telefonat vom 09.07.2011, München},
}
```

---

## 12. Video aus dem Internet (YouTube etc.)

**Bib-Eintrag:**
```bibtex
@online{zdfheute2020,
  author  = {{ZDFheute Nachrichten}},
  title   = {Wer hat die Meinungsmacht? Rezo zu Gast bei Precht [YouTube]},
  year    = {2020},
  url     = {https://youtu.be/zxnNZ09qaL4},
  urldate = {2020-10-20},
}
```

---

## 13. Podcast

**Bib-Eintrag:**
```bibtex
@online{lanz2024,
  author  = {Lanz, Markus and Precht, Richard David},
  title   = {Von Kafka bis KI, Ausgabe 153 [Podcast]},
  year    = {2024},
  url     = {https://podcasts.apple.com/de/podcast/...},
  urldate = {2024-09-01},
}
```

**Hinweis:** `[Podcast]`, `[YouTube]`, `[Webinar]`, `[Film]` manuell an den Titel anhaengen.

---

## 14. Social Media

**Bib-Eintrag:**
```bibtex
@online{dgsa2021,
  author  = {{DGSA (Hrsg.) [@dieDGSA]}},
  title   = {Diskurse um Soziale Gerechtigkeit und Klimagerechtigkeit hängen untrennbar zusammen [Tweet]},
  year    = {2021},
  url     = {https://twitter.com/dieDGSA/status/1440591078533459977},
  urldate = {2024-09-10},
}
```

**Hinweis:** Gesamter String (Name + Hrsg. + Benutzername) in eine doppelte Klammer: `{{DGSA (Hrsg.) [@dieDGSA]}}`

---

## Kurzuebersicht: Zitation im Text

| Situation | LaTeX-Befehl | Ergebnis |
|-----------|-------------|----------|
| Indirektes Zitat | `\parencite[vgl.][14]{mueller2020}` | (vgl. Mueller 2020, S. 14) |
| Indirektes, folgende Seite | `\parencite[vgl.][14\psq]{mueller2020}` | (vgl. Mueller 2020, S. 14 f.) |
| Indirektes, mehrere Seiten | `\parencite[vgl.][14\psqq]{mueller2020}` | (vgl. Mueller 2020, S. 14 ff.) |
| Direktes Zitat | `\parencite[26]{bonhoeffer1994}` | (Bonhoeffer 1994, S. 26) |
| Autor im Text (indirekt) | `\textcite[vgl.][42]{bonhoeffer1994}` | vgl. Bonhoeffer (1994, S. 42) |
| Autor im Text (direkt) | `\textcite[42]{bonhoeffer1994}` | Bonhoeffer (1994, S. 42) |
| Ohne Seitenangabe | `\parencite[vgl.][]{schmidt2019}` | (vgl. Schmidt 2019) |
| Mehrere Quellen | `\parencite{mueller2020,thiersch2014}` | (Mueller 2020; Thiersch 2014) |
| Sekundaerzitat | `\parencite[642, zitiert nach][351]{schaeffer2012}` | (...642, zitiert nach Schaeffer 2012, S. 351) |

---

## Checkliste vor Abgabe

- [ ] Jeder `\parencite` fuer indirekte Zitate beginnt mit `[vgl.]`
- [ ] Jeder direkte Zitattext steht in `\enquote{...}`
- [ ] Alle zitierten Werke haben einen Eintrag in `bibliography.bib`
- [ ] Keine Eintraege in `.bib`, die nicht im Text zitiert werden
- [ ] `urldate` bei allen Online-Quellen vorhanden
- [ ] Institutionen in doppelten Klammern `{{...}}`
- [ ] Mehrere Werke desselben Autors im selben Jahr: Key mit a/b suffixen (z.B. `bommes2011a`, `bommes2011b`)
- [ ] `journaltitle` (nicht `journal`) fuer Zeitschriften
- [ ] `pages` mit `--` (Doppelminus) fuer Seitenbereiche
- [ ] Gesetzestexte werden NUR im Text zitiert (kein Bib-Eintrag): `(§ 23 Abs. 1 SGB V)`
