#!/bin/bash

qload_rom()
{
    if [ "$LASTROM" != "$3" ]
    then	
	export LASTROM="$3"
	echo "$LASTROM"

        if [ ! -f /media/fat/Games/"$1"/"$2".mgl ]
            then                
                echo "<mistergamedescription><rbf>_console/"$1"</rbf><file delay=\"2\" type=\"f\" index=\"0\" path=\"../../games/"$1"/"$2"\"/></mistergamedescription>" > "/media/fat/Games/"$1"/"$2".mgl"
        fi
        echo "load_core /media/fat/Games/"$1"/"$2".mgl" > /dev/MiSTer_cmd
	
    fi    
}

unset gamefound
while read -r line
do
	#echo "$line"
	rfid=`echo "$line" | cut -f1`
	game=`echo "$line" | cut -f2`
	#echo "rfid=$rfid game=$game"
	if [ "x$rfid" == "x$1" ]
	then
		#echo "RFID $rfid found in $line"
		gamefound=$game
		break
	fi
done </media/fat/Scripts/games_rfid.conf

if [ "x$gamefound" == "x" ]
then
	echo "RFID tag not found into config file..."
	return
fi

echo "Running: $gamefound"
eval $gamefound

