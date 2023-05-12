---
title: Binärdateien und der Hexeditor
author: kratenko
date: 2023-05-11
lang: de
---
# Binärdateien

## Voraussetzungen
* Hexadezimalzahlen (Zahlensysteme)
* Was ist ein Byte?
* Was ist eine Datei
* Was ist eine reine Textdatei, und wieso ist das toll?

## Textdateien - binär
Hatte ich erwähnt, dass reine Textdateien toll sind? Die sind nämlich von gut, 
und das solltest du wissen, und ich hoffe, du verstehst, wieso: ich kann die 
Bytes der Dateien anschauen, und ich sehe, was darin ist:

[plain.txt](plain.txt)
~~~~
Dies ist auch wieder nur Text.

Buchstaben (groß und klein), Leerzeichen, Klammern, Punkt und Komma.
Ach ja, Zeilenumbrüche (New Lines) sind auch dabei (aber keine Carriage Returns).

~~~~

Natürlich sehe ich nicht die Bytes direkt, sondern ihre ASCII-Repräsentation
(stimmt nicht, das ist UTF-8, aber, you know...).

Um sich die Bytes einer Datei anzuschauen, nimmt man einen Hex-Viewer oder 
Hex-Editor. Als Beispiel nehme ich hier die Ausgabe des Tools `hexdump`, 
das unter Linux genau das an der Konsole machen kann:

~~~~
$ hexdump -C plain.txt 

00000000  44 69 65 73 20 69 73 74  20 61 75 63 68 20 77 69  |Dies ist auch wi|
00000010  65 64 65 72 20 6e 75 72  20 54 65 78 74 2e 0a 0a  |eder nur Text...|
00000020  42 75 63 68 73 74 61 62  65 6e 20 28 67 72 6f c3  |Buchstaben (gro.|
00000030  9f 20 75 6e 64 20 6b 6c  65 69 6e 29 2c 20 4c 65  |. und klein), Le|
00000040  65 72 7a 65 69 63 68 65  6e 2c 20 4b 6c 61 6d 6d  |erzeichen, Klamm|
00000050  65 72 6e 2c 20 50 75 6e  6b 74 20 75 6e 64 20 4b  |ern, Punkt und K|
00000060  6f 6d 6d 61 2e 0a 41 63  68 20 6a 61 2c 20 5a 65  |omma..Ach ja, Ze|
00000070  69 6c 65 6e 75 6d 62 72  c3 bc 63 68 65 20 28 4e  |ilenumbr..che (N|
00000080  65 77 20 4c 69 6e 65 73  29 20 73 69 6e 64 20 61  |ew Lines) sind a|
00000090  75 63 68 20 64 61 62 65  69 20 28 61 62 65 72 20  |uch dabei (aber |
000000a0  6b 65 69 6e 65 20 43 61  72 72 69 61 67 65 20 52  |keine Carriage R|
000000b0  65 74 75 72 6e 73 29 2e  0a                       |eturns)..|
000000b9
~~~~

Pro Zeile werden 16 Bytes angezeigt. Die erste Zahl ist die Position des ersten 
Bytes der Zeile als Hexzahl (wieso wohl als Hexzahl?): `00000000`.
Danach kommen die nächten 16 Bytes, in zwei 8er-Gruppen, dargestellt als Hexzahl 
(wieso wohl als Hex?): `44 69 65 73 20 69 73 74  20 61 75 63 68 20 77 69`.
Als Letztes (zwischen den Pipes: `|`) werden die gleichen 16 Bytes dargestellt, 
wenn es denn in ASCII (und dieses Mal wirklich ASCII) möglich ist. Undruckbare
Zeichen werden als Punkt `.` angezeigt. So geht das weiter, bis alle Bytes
der Datei angezeigt wurden. In der letzten Zeile steht die Größe der Datei in 
Bytes (als Hexzahl).

Die wichtigsten [ASCII][ascii]-Werte, für diese Ansicht:

* `0x41` - `0x7a` = `65` - `122` = `A` - `Z`
* `0x61` - `0x9a` = `97` - `154` = `a` - `z`
* `0x20` = `32` = ` `, `SP` (Leerzeichen, space)
* `0x0a` = `10` = `\n`, `LF`, ([Zeilenvorschub][line feed], line feed)
* `0x28` = `40` = `(`
* `0x29` = `41` = `)`
* `0x2c` = `44` = `,`, Komma
* `0x2e` = `46` = `.`, Punkt

Und jetzt die Bonusfrage: Warum sind dort Bytes mit Werten über `0x7f` = `127`?


# Binärdateien - binär

Was steht eigentlich in Dateien, die keine Textdateien sind? Tja, gute Frage. 
Bytes. Was die bedeuten, muss man halt wissen. Wir schauen uns mal ein 
Format an, das man recht leicht nachvollziehen kann.

## BMP

~~~~
$ hexdump -C facade-dots.bmp

00000000  42 4d 66 00 00 00 00 00  00 00 36 00 00 00 28 00  |BMf.......6...(.|
00000010  00 00 04 00 00 00 04 00  00 00 01 00 18 00 00 00  |................|
00000020  00 00 30 00 00 00 23 2e  00 00 23 2e 00 00 00 00  |..0...#...#.....|
00000030  00 00 00 00 00 00 fa ca  de 00 00 ff 00 ff 00 ff  |................|
00000040  00 00 ff ff 00 ff 00 ff  00 ff ff ff ff ff bf bf  |................|
00000050  bf 80 80 80 40 40 40 00  00 00 c7 1f 6e b8 64 45  |....@@@.....n.dE|
00000060  ff ff ff 45 8b b8                                 |...E..|
00000066
~~~~

Spannend für uns ist der Teil ab Byte 0x36:

~~~~
fa ca de 00 00 ff 00 ff  00 ff 00 00 ff ff 00 ff
00 ff 00 ff ff ff ff ff  bf bf bf 80 80 80 40 40
40 00 00 00 c7 1f 6e b8  64 45 ff ff ff 45 8b b8
~~~~

Das sind 3*16 = 48 Bytes. Wir ordnen sie mal etwas anders an:

~~~~
fa ca de  00 00 ff  00 ff 00  ff 00 00 
ff ff 00  ff 00 ff  00 ff ff  ff ff ff
bf bf bf  80 80 80  40 40 40  00 00 00
c7 1f 6e  b8 64 45  ff ff ff  45 8b b8
~~~~

![facade-dots-x64.png](facade-dots-x64.png)

https://www.pohlig.de/Unterricht/Inf2004/Kap27/27.3_Das_bmp_Format.htm


~~~~
+-----------------------+--------+
| File                  | Bytes  |
+-----------------------+--------+
| facade-dots.bmp       |    102 |
| facade-dots-meta.bmp  |    202 |
| facade-dots.png       |    627 |
| facade-dots-x64.bmp   | 196662 |
| facade-dots-x64.png   |   1244 |
| plain.txt             |    185 |
+-----------------------+--------+
~~~~


[ascii]: https://de.wikipedia.org/wiki/American_Standard_Code_for_Information_Interchange
[line feed]: https://de.wikipedia.org/wiki/Zeilenvorschub
