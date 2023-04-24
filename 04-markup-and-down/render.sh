#!/bin/sh
# Dies ist ein Shell-Script, das alle Konvertierungen, die in Lektion.md beschrieben werden, nacheinander durchführt.

# Erzeugen eines einfachen PDFs:
pandoc Lektion.md -o lektion.pdf
# Erzeugen eines PDFs mit Inhaltsverzeichnis:
pandoc Lektion.md -o lektion-toc.pdf --toc
# Erzeugen eines PDFs mit Inhaltsverzeichnis und Designvorlage:
pandoc Lektion.md -o lektion-eisvogel.pdf --toc --template eisvogel -Mtitlepage -Mtoc-own-page
# Erzeugen einer HTML-Seite:
pandoc Lektion.md -s -o lektion.html
# Installieren der genutzten Templates in `~/.pandoc/templates`
#curl 'https://raw.githubusercontent.com/ryangrose/easy-pandoc-templates/master/copy_templates.sh' | bash
# Erzeugen einer HTML-Seite mit Designvorlage:
pandoc Lektion.md -s -o lektion-easy.html --template easy_template --toc
# Als epub E-Book rendern:
pandoc Lektion.md -o lektion.epub --toc
# Als Open Document Text (Office) rendern:
pandoc Lektion.md -o lektion.odt
# Als Mediawiki Wikitext (Wikipedia) rendern:
pandoc Lektion.md -o lektion.wiki -t mediawiki
