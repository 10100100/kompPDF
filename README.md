# kompPDF
pdf Komprimieren in Stapelverarbeitung

Mit diesem Tool kann man gleich mehrere PDF Datein mit ghostscript komprimieren.

Vorher ghostscript und rename installieren und kompPDF ausführbar machen.
Das Script kompPDF.sh in das Verzeichns legen in dem die zum Komprieren
gewünschten PDF Dateien liegen.
Dann kompPDF.sh ausführen und er findet automatisch alle PDF Dateien und
komprimiert sie auf die bestmögliche Größe. Das ist bei ghostscript die 
Option EBOOK bei dieser sieht man noch alles sehr gut aber die Datei ist 
viel kleiner.

Achtung:
Es werden im PDF Dateinamen Leerzeichen durch Bindestriche oder nach Wunsch 
mit Option -u Unterstriche ersetzt!
Mit der Option -f wird nicht nachgefragt ob die größeren PDF Dateien nach der
Komprimierung automatisch gelöscht werden!
Es kann keine JPG oder andere Formate komprimieren nur PDF.

Optionen:
-a Komplette GhostScript Ausgabe<br>
-u Dateinamen mit Unterstrich trennen
-f Vor dem Löschen nicht fragen   

Anleitung:
sudo apt install ghostscript
sudo apt install rename
chmod u+x kompPDF.sh
cp kompPDF.sh /Verzeichnis/mit/pdf-Dateien/
cd /Verzeichnis/mit/pdf-Dateien/
./kompPDF.sh

Danke an die Entwickler von:
GhostScript, rename und BASH 
