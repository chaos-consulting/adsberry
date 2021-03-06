# ADS-B mit dem Raspberry Pi - Chaosconsulting Style

Diese Anleitung ist aufgeteilt in vier Abschnitte:
* build.md - Eine Bauanleitung, die den Zusammenbau der benötigten Hardware erklärt
* install.md - Eine Installationsanleitung für das Betriebssystem und Dump1090 sowie die Einrichtung eines Webservers um die Flugzeuge lokal beobachten zu können.
* api.md - Eine Erklärung wie man die Daten nun in die große Karte https://adsb.chaos-consulting.de einspeisen kann, dis sollte mit jedem Dump1090 Setup und eventuellen Forks davon funktionieren.
* mlat.md - Mit MLAT lassen sich die Positionen von Flugzeugen bestimmen, die selbst keine Positionsdaten aussenden

Vorraussetzung sind Linux Grundkenntnisse, ein Linux Computer mit SD Kartenleser und Lötkenntnisse.

=========================================================================================

This how-to is devided into four parts:
* build.md - This part shows you how to build the hardware setup for an ADS-B reciever station.
* install.md - In this part you learn how to install all the necessary software packages on your receiver box an how to watch planes locally
* api.md - You want to participate in the big map on https://adsb.chaos-consulting.de then this is for you, even if you use another reciever setup using Dump1090 or one of its forks
* mlat.md - With mlat one can determine the positon of planes that do not send the position info on their own

To work through this tutorial easily you need basic linux skills, a pc with linux on it and sd card reader and be able to solder
