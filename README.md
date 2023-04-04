# kompPDF
pdf Komprimieren in Stapelverarbeitung

Mit diesem Tool kann man gleich mehrere PDF Datein mit ghostscript in der<br>
Shell komprimieren.<br>

Vorher ghostscript und rename installieren und kompPDF ausführbar machen.<br>
Das Script kompPDF.sh in das Verzeichns legen in dem die zum Komprieren<br>
gewünschten PDF Dateien liegen.<br>
Dann kompPDF.sh ausführen und er findet automatisch alle PDF Dateien und<br>
komprimiert sie auf die bestmögliche Größe. Das ist bei ghostscript die<br> 
Option EBOOK bei dieser sieht man noch alles sehr gut aber die Datei ist <br>
viel kleiner.<br><br>

Achtung:<br>
Es werden im PDF Dateinamen Leerzeichen durch Bindestriche oder nach Wunsch<br>
mit Option -u Unterstriche ersetzt!<br>
Mit der Option -f wird nicht nachgefragt ob die größeren PDF Dateien nach der<br>
Komprimierung automatisch gelöscht werden!<br>
Es kann keine JPG oder andere Formate komprimieren nur PDF.<br>

Optionen:<br>
-a Komplette GhostScript Ausgabe<br>
-u Dateinamen mit Unterstrich trennen<br>
-f Vor dem Löschen nicht fragen<br>  

Anleitung:<br>
sudo apt install ghostscript<br>
sudo apt install rename<br>
chmod u+x kompPDF.sh<br>
cp kompPDF.sh /Verzeichnis/mit/pdf-Dateien/<br>
cd /Verzeichnis/mit/pdf-Dateien/<br>
./kompPDF.sh<br>

Danke an die Entwickler von:<br>
GhostScript, rename und BASH 
