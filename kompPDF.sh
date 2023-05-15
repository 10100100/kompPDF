#!/bin/bash

<< 'Kommentar'
    kompPDF - Komprimieren in Stapelverarbeitung für pdf Dateien
    Copyright (C) 2023  André Dittmann

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as
    published by the Free Software Foundation, either version 3 of the
    License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
Kommentar


<< 'Kommentar'
sudo apt install ghostscript
sudo apt install rename
chmod u+x kompPDF.sh
cp kompPDF.sh /Verzeichnis/mit/pdf-Dateien/
Kommentar

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#info +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


echo "+++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+++++++++++---------kompPDF----------++++++++++++"
echo "+    pdf Komprimieren in Stapelverarbeitung     +"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+Script in das Verzeichnis legen der .pdf Datei.+"
echo "+Es findet alle .pdf Komprimiert sie und löscht +"
echo "+die größere Datei. Kann nicht .jpg oder andere.+"
echo "+Achtung alle Leerzeichen im Dateinamen werden  +"
echo "+mit Bindestrich oder wahlweise Unterstrich     +"
echo "+ersetzt und von .PDF in .pdf umbenannt.        +"
echo "+                     +++                       +"
echo "+         Danke an die Entwickler von:          +"
echo "+         GhostScript, rename und BASH          +"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++"
sleep 7

echo ""
echo "+++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+ Optionen:                                     +"
echo "+ -a Komplette GhostScript Ausgabe              +"
echo "+ -u Dateinamen mit Unterstrich trennen         +"
echo "+ -f Vor dem Löschen nicht fragen               +"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++"
echo ""
sleep 7


#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#info +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#Optionen abfragen ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


while [ -n "$1" ]; do 
	case "$1" in
	-a) echo "-a Option komplette GhostScript Ausgabe"; ausgabe=true ;; # komplette Ausgabe

	-u) echo "-u Option Trennung mit Unterstrich gewählt"; bindest=true ;; # Unterstrich

	-f) echo "-f Option keine Lösch-Abfrage gewählt"; fragen=true ;; # Lösch-Anfrage

	*) echo "Option $1 ist nicht bekannt" ;; # Wenn eine andere Option angegeben wird
	esac
	shift
done
sleep 3


#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#Optionen abfragen ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#Prüfen ob es überhaupt die benötigten Programme gibt +++++++++++++++++++++++++++++++++++++++++++++++++
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


installGS=$(which 'ghostscript')
if test -z "$installGS"
then
      echo "Bitte installieren Sie erst GhostScript."
      echo "Dafür eingeben: apt install ghostscript"
      sleep 10
      exit 0
fi

installRE=$(which 'rename')
if test -z "$installRE"
then
      echo "Bitte installieren Sie erst rename."
      echo "Dafür eingeben: apt install rename"
      sleep 10
      exit 0
fi


#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#Prüfen ob es überhaupt die benötigten Programme gibt +++++++++++++++++++++++++++++++++++++++++++++++++
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#Prüfen ob es überhaupt .pdf Dateien gibt +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


#Aktuelles Verzeichnis
verzeich=$(pwd)
#Alle .PDF Dateien in .pdf umbennen
grossG=$(find $verzeich -maxdepth 1 -type f -name '*.PDF')
if test -n "$grossG"
then
      echo "Alle .PDF werden in .pdf Dateien umbenannt."
      $(rename 's/.PDF/.pdf/g' $verzeich/*.PDF)
fi

#Bevor automatisch Dateien gelöscht werden prüfen ob die gewünschten Dateien da sind 
hier=$(find $verzeich -maxdepth 1 -type f -name '*.pdf')
#Testen ob empty 
if test -n "$hier"
then
      echo "Es sind .pdf Dateien vorhanden."


#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#Prüfen ob es überhaupt .pdf Dateien gibt -------------------------------------------------------------
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#Alle .pdf Leerzeichen in Bindestriche ändern +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


if [[ $bindest = "true" ]]; then
$(rename 's/   /_/g' $verzeich/*.pdf)
$(rename 's/  /_/g' $verzeich/*.pdf)
$(rename 's/ /_/g' $verzeich/*.pdf)
else
$(rename 's/   /-/g' $verzeich/*.pdf)
$(rename 's/  /-/g' $verzeich/*.pdf)
$(rename 's/ /-/g' $verzeich/*.pdf)
fi


#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#Alle .pdf Leerzeichen in Bindestriche ändern +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#Alle .pdf Komprimieren +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


<< 'Kommentar'
Alle pdfs komprimieren zu dateiname-c.pdf
Das mit dem besten tool dafür ghostscript(gs)
Das Problem ist das man in der Shell jedes einzeln angeben muss und das zweimal
Kommentar

echo "Komprimieren mit GhostSript läuft:"

#Drehbalken vorbereiten
k=1
sp="/-\|"


#Schleife aller .pdf Dateien für ghostscript
for i in *.pdf 
do 

    #Komplette Ausgabe von ghostscript anzeigen oder nicht 
    if [[ $ausgabe = "true" ]]; then
    gs -dNOPAUSE -dBATCH -sDEVICE="pdfwrite" -dCompatibilityLevel="1.4" -dPDFSETTINGS="/ebook" -sOutputFile="${i%.*}"-c.pdf "${i%.*}".pdf
    else
    #Drehbalken anzeigen |
    printf "\b${sp:k++%${#sp}:1}"
    #ghostscript starten mit i array aller .pdf Dateien
    $(gs -dNOPAUSE -dBATCH -sDEVICE="pdfwrite" -dCompatibilityLevel="1.4" -dPDFSETTINGS="/ebook" -sOutputFile="${i%.*}"-c.pdf "${i%.*}".pdf > /dev/null)
    fi

    #Wir überprüfen ob es die -c.pdf Datei auch gibt damit wir es weiter vergleichen können
    hierC=$(find $verzeich -maxdepth 1 -type f -name "${i%.*}"-c.pdf)
    if test -n "$hierC"
    then
      c+=(${i%.*}-c.pdf ${i%.*}.pdf) 
    else
      echo "!!!Fehler - Die Datei ${i%.*}.pdf konnte nicht komprimiert/geöffnet werden."
      echo "Bitte diese Datei manuell prüfen."
    fi
done


#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#Alle .pdf Komprimieren +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#jetzt die größere Datei finden +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


#Array erstellen mit allen .pdf und -c.pdf Dateien im aktuellen Ordner
array=("${c[@]}")

#Leeren array anlegen
picname=()

#for Schleife die den Array ausliest 
for element in $(seq 0 2 $((${#array[@]} - 1))	)
do


   #zähler $o++ 
   o=`expr $o + 1`
   echo ""
   echo "$o ++++++++++++++++++++++++++"
           
   #du -b holt Dateigröße mit awk $1 nimm das erste Ergebnis von den beiden die Größe
   erstesE=$(du -b "${array[$element]}" | awk '{print $1}')
   zweitesE=$(du -b "${array[`expr $element + 1`]}" | awk '{print $1}')
   echo "$erstesE byte komprimierte -c.pdf"
   echo "$zweitesE byte original .pdf"

	#Prüfen ob Dateigrößen gleich sind  
	if [[ $erstesE -eq $zweitesE ]]; then
	echo "!!! Fehler - Dateien gleichgroß"
	fi
   	
   	#Nimm das jeweils kleiner oder größer 
   	if [[ $erstesE -lt $zweitesE ]]; then 
   	echo "${array[$element]} kleiner!" && picname+=(${array[$element+1]}) 
   	else 
   	echo "${array[$element]} größer!" && picname+=(${array[$element]})    
   	fi    
done


#Gib die gesammelten Dateinamen aus
echo "----------------------------"
echo "Es gibt insgesamt ${#picname[*]} PDF Dateien"
echo "${picname[@]}" 
echo "----------------------------"


#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#jetzt die größere Datei finden +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#Die größere Datei löschen ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


echo "Größere Datei entfernen?"
#Schleife zum Löschen von unnötiger Dateien
for elementLoeschen in $(seq 0 $((${#picname[@]} - 1)))
do
	if [[ $fragen = "true" ]]
	then
	#Vor dem Löschen nicht fragen
	rm ${picname[$elementLoeschen]}
	echo "${picname[$elementLoeschen]} wird gelöscht!"
	else
	#Vor dem Löschen fragen
	rm -i ${picname[$elementLoeschen]}
	fi
done


#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#Die größere Datei löschen ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#Prüfen ob es überhaupt .pdf Dateien gibt -------------------------------------------------------------
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


else
	echo ""
	echo "+++++++++++++++++++++++++++++++++++++++++++++++++"
	echo "+Es sind keine .pdf Dateien vorhanden.          +" 
	echo "+Auf Verzeichnis: $verzeich                      "
	echo "+++++++++++++++++++++++++++++++++++++++++++++++++"
	
fi


#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#Prüfen ob es überhaupt .pdf Dateien gibt +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


exit 0
