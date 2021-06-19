# Bauanleitung - How to Build an ADS-Berry Pi
## Parts List
* Raspberry Pi B, B+ (versions 2 and 3 do work, but are known to instability in our setup because of higher power usage)
* (Micro) SD memory Card with at least 4GB
* Buck Boost Converter
* Passive PoE Splitter
* 30cm USB extension
* Micro USB cord
* rtl-sdr DVB-T dongle with 820T or 820T2 Tuner. Nowerdays it is likely that you get a Fitipower tuner, that ist unfortunately not working for ADS-B
* A Case which is Water Proof
* MCX -> SMA adapter (Only if your sdr dongle is outfitted with a mcx instead of a sma connector
* 1090MHz Bandpassfilter
* M16 wire grommit
* RJ45 grommit
* Antenna for 1090MHz [check our antenna guide](antennas/readme.md)
* Shrinktube
* Construction adhesive
* 24V Passive PoE power supply

## Tools
* Drill for the big holes for the grommits
* Soldering iron + solder
* Pliers
* Wirecutter
* PH2 Screwdriver or long Bit
* Multimeter
* small - screwdriver

## Prepare the box
* Open the box and drill two holes in in one of the small sides, witch enough space around to install both grommits
* This side will be our bottom
* Install the grommits

## Prepare the power
* Cut the barrel connector of the PoE splitter and expose the two wires of the splitter
* Solder the positive one (usually red) to the positive input terminal (+) of the Buck/Boost converter
* Solder the negative one (usually black) to the negative input terminal (-) of the convrter
* Connect the 24V PoE power source via an ethernet cable to the splitter
* Measure the output voltage of the converter with the multimeter set to DC Voltage
* Turn the potentiometer on the converter with a small slotted screwdriver until output ist 5V
* Disconnect the power source
* Cut the micro USB cord to leave about 20cm on the micro connectors side and expose the four wires.
* Cut the data lines D+ and D- usually green and white
* Solder the positive (usually red) and negative (usually black) wires to the positive (+) and negative (-) output terminals of the converter

## Put it all in the box
* Put raspberry in the box
* Connect micro USB for Regualator with 5V in of the Pi
* Connect input of PoE splitter to RJ45 Grommit from the inside
* Connect RJ45 output of the splitter to the Pi
* Connect the rtl-sdr dongle via the usb extension cable to the Pi
* Connect the bandpassfilter via the MCX adapter to the rtl-sdr dongle
* Feed the SMA to N cable with the SMA connector from the outside into the cable grommit in the bottom of the case and connect it to the output of the bandpassfilter
* Tighten up the grommit
* If you like you can secure the parts inside with a bit of construction adhesive but leave enough room to access the memory card slot anytime

## Close the box
* If you inserted your prepared memory card you can secure the boxes lid with the four screws and mount it on a place with clear line of sight for the antenna.
* You can feed data and power via a good quality RJ45 cat6e cable from up to 30m
* Connect the box to the passive PoE output of your injector or switch and connect the injector to your network

## Build the antenna
* [check our antenna guide](antennas/readme.md)

## Next steps
* [As you are done with the hardware side of the build  lets look into the software side](install.md)
