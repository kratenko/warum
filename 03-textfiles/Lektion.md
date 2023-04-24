# Textdateien

*2023-04-20*

* Was ist eine reine Textdatei? 
* Was unterscheidet sie von einer anderen (binären) Datei?
* Was sind die Vorteile von reinen Textdateien?

# Recap
* Was ist ein Byte? Richtig: 8 Bits
* Ein Bit ist die kleinste mögliche Informationseinheit. Eine Entscheidung. An oder Aus, 1 oder 0, Hopp oder Top, Leben oder Tod
* Ein Byte bedeutet zunächst nichts. Es kann 256 verschiedene Zustände annehmen.
* Im Zusammenhang (Context) bekommt ein Byte Bedeutung, z.B. eine Zahl oder ein Zeichen.

# Notizen
* Wenn du im Browser eine Seite aufrufst, dann wird im Hintergrund eine Datei 
* Quelltext in Internetseiten zeigen: `Strg-U` oder Rechtsclick, "Seitenquelltext zeigen"

# Kernpunkte
* Eine Datei ist eine Liste von 0 oder mehr Bytes hintereinander in einer festen Reihenfolge.
* Bytes als Zeichen interpretiert -> Textdatei.
* Textdateien sind sehr universell, können quasi auf jedem System seit den 80ern verstanden werden.
* *Der* Standard ist [ASCII][ascii]. Buchstaben, Ziffern, ein paar Sonderzeichen (insgesamt 128 Zeichen).
* Heute kann man auch andere Sprachen und Emojis direkt in Textdateien schreiben
  (dank [Unicode][unicode]). Aber Syntax bleibt (meist) ASCII.

# Referenzen
* https://de.wikipedia.org/wiki/American_Standard_Code_for_Information_Interchange &ndash; ASCII
* https://blog.fefe.de &ndash; bekannte Seite mit technisch minimalistischem Ansatz

[ascii]: https://de.wikipedia.org/wiki/American_Standard_Code_for_Information_Interchange
[unicode]: https://de.wikipedia.org/wiki/Unicode
