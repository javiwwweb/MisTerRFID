# MisTerRFID
Enables RFID card launching of games for MiSTer FPGA. Launches games without any menu being display using the MiSTer Game Launcher files (MGL) method. Must use a version of MiSTer from Feb 24, 2022 or after to support this method of launching. I have confirmed this working with all Arcade and NeoGeo cores.

## Hardware Needed
- Arduino Nano V3.0 
- RC522 RFID Card Reader Module Board (3.3V)
- Mi-fare door access cards
- MiSTer FPGA with the extra USB ports board.

## Arduino Hardware Setup
| RC522 Module Pin | Arduino Pin|
|---|---|
|RST|D9|
|SDA|D10|
|MOSI|D11|
|MISO|D12|
|SCK|D13|
|VCC|3.3V|
|GRD|GRD|

Write the snesrfid.ino file to your Arduino. On your computer, attach the serial monitor to your Arduino and you should see it repeating `. rfid_process.sh noscan` about every second. As soon as your scan a RFID card, it should output `. rfid_process.sh 12345678`. The number is that card's unique ID. The reader will not scan the same card two times in a row. Make note of the card's unique id.

## MiSTer Setup
Copy the files to your MiSTer SD card based on the structure of this repo. Edit case statement of the "rfid_process.sh" script to associate your RFID card UIDs with the roms files on your MiSTer. (Sample cores and UID's are provided in the file)

## Use
After editing the rfid_process.sh script, turn off your MiSTer. Plug your Arduino into an available USB port on your USB board module and turn on your MiSTer. Depending on how many scripts you have running, it can take up to 30 seconds from first turning on the power to the RFID reader becoming available. Once the RFID reader is available, you can scan your RFID card to launch any core.

NOte: This can be combined with MisTer.ini option bootcore= to automatically launch an arcade core (MRA file) upon starting up your MisTer. The rfid_process.sh will run in the background waiting for a card to be presented.  

### Disclaimer
I'm not a Linux or a hardware guy -- there are probably many better approaches to the ones I have taken.

