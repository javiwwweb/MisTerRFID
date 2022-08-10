# MisTerRFID
Enables RFID card launching of games for MiSTer FPGA. Launches games without any menu being display using the MiSTer Game Launcher files (MGL) method. Must use a version of MiSTer from Feb 24, 2022 or after to support this method of launching. I have confirmed this working with all Arcade and Neo Geo cores.

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

The first step is to write the misterrfid.ino file to your Arduino. If you find out that that you would like to extend the distance the card is picked up,  You can adjust the receiver gain by editing the following line of the misterrfid.ino before writing it:

Line that needs to be edited : rfid.PCD_SetRegisterBitMask(rfid.RFCfgReg, (0x03<<4));

The HEX 0x03 control the gain. In my case that was the value that would penetrate the wooden bezel and the glass at the perfect distance. You may need to adjust this value set the receiver's gain to your desired level

 | Gain Values in HEX |
 |---|
 | 0x01 = 23 dB HEX |
 | 0x02 = 18 dB HEX | 
 | 0x03 = 23 dB HEX |
 | 0x04 = 33 dB HEX |
 | 0x05 = 38 dB HEX |
 | 0x06 = 43 dB HEX |
 | 0x07 = 48 dB HEX |

On your computer, attach the serial monitor to your Arduino and you should see it repeating `. rfid_process.sh noscan` about every second. As soon as your scan a RFID card, it should output `. rfid_process.sh 12345678`. The number is that card's unique ID. The reader will not scan the same card two times in a row. Make note of the card's unique id.

## MiSTer Setup
Copy the files to your MiSTer SD card based on the structure of this repo. Edit case statement of the "rfid_process.sh" script to associate your RFID card UIDs with the roms files on your MiSTer. (Sample cores and UID's are provided in the file)

## Use
After editing the rfid_process.sh script, turn off your MiSTer. Plug your Arduino into an available USB port on your USB board module and turn on your MiSTer. Depending on how many scripts you have running, it can take up to 30 seconds from first turning on the power to the RFID reader becoming available. Once the RFID reader is available, you can scan your RFID card to launch any core.

Note: This can be combined with MisTer.ini option bootcore= to automatically launch an arcade core (MRA file) upon starting up your MisTer. The rfid_process.sh will run in the background waiting for a card to be presented.  

### Disclaimer
I'm not a Programmer, but the code works for me.

### THANK YOU
A word of Thanks to illusion-pasture-program from all of this code. I just adapted it to work inside an Arcade cabinet to my liking! 
