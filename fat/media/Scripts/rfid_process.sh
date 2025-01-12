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

case "$1" in 
   "2208192798") echo load_core /media/fat/_Arcade/'Robocop (World revision 4).mra' > /dev/MiSTer_cmd;;
   "1944463134") echo load_core /media/fat/_Arcade/'Final Fight -World, set 1-.mra' > /dev/MiSTer_cmd;;
   "2212386078") echo load_core /media/fat/_Arcade/'Ghosts'\''n Goblins (JT).mra' > /dev/MiSTer_cmd;;
   "3841642020") echo load_core /media/fat/_Arcade/'Double Dragon.mra' > /dev/MiSTer_cmd;;
   "2788154149") echo load_core /media/fat/_Arcade/'Double Dragon II - The Revenge.mra' > /dev/MiSTer_cmd;;
   "2785325093") echo load_core /media/fat/_Arcade/'Kung-Fu Master.mra' > /dev/MiSTer_cmd;;
   "2532548645") echo load_core /media/fat/_Arcade/'Shinobi (Set 6, World, S16A) [No Protection].mra' > /dev/MiSTer_cmd;;
   "3571898404") echo load_core /media/fat/_Arcade/'R-Type (World).mra' > /dev/MiSTer_cmd;;
   "3836830500") echo load_core /media/fat/_Arcade/'Vigilante (World, Rev E).mra' > /dev/MiSTer_cmd;;
   "4095029796") echo load_core /media/fat/_Arcade/'Bad Dudes vs. Dragonninja (US revision 1).mra' > /dev/MiSTer_cmd;;
   "4100998436") echo load_core /media/fat/_Arcade/"Ghouls'n Ghosts -World-.mra" > /dev/MiSTer_cmd;;
   "4095293732") echo load_core /media/fat/_Arcade/'Rush'\''n Attack (US).mra' > /dev/MiSTer_cmd;;
   "4097148196") echo load_core /media/fat/_Arcade/'Altered Beast (set 8) (8751 317-0078).mra' > /dev/MiSTer_cmd;;
   "3841431588") echo load_core /media/fat/_Arcade/'Golden Axe (set 6, US) (8751 317-123A).mra' > /dev/MiSTer_cmd;;
   "3570877988") echo load_core /media/fat/_Arcade/"Street Fighter II'  Hyper Fighting -World 921209-.mra" > /dev/MiSTer_cmd;;
   "2793426725") echo load_core /media/fat/_Arcade/'Rastan (World Rev 1).mra' > /dev/MiSTer_cmd;;
   "2790045733") qload_rom NEOGEO mslugx "$1";;   
   "3837547300") qload_rom NEOGEO samsho2 "$1";;  
esac
