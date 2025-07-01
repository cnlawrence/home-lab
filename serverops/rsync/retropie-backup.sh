ssh pi@192.168.0.162 'find /home/pi/RetroPie/roms/ -type f \( -name "*.srm" -o -name "*.state" -o -name "*.sav" -o -name "*.nvram" -o -name "*.ss" -o -name "*.eep" -o -name "*.zip" -o -name "*.dat" -o -name "*.dsv" -o -name "*.nv" -o -name "*.mem" -o -name "*.cfg" $(for i in {0..9}; do echo -o -name "*.st$i"; done) \) | while read -r file; do
  rsync -anv --dry-run "$file" pi@192.168.0.162:/home/pi clawrence@192.168.0.203:/samba/backups/retropie/savefiles/
done'

ssh pi@192.168.0.162 'find /home/pi/RetroPie/roms/ -type f \( -name "*.srm" -o -name "*.state" -o -name "*.sav" -o -name "*.nvram" -o -name "*.ss" -o -name "*.eep" -o -name "*.zip" -o -name "*.dat" -o -name "*.dsv" -o -name "*.nv" -o -name "*.mem" -o -name "*.cfg" $(for i in {0..9}; do echo -o -name "*.st$i"; done) \)' > file_list.txt

rsync -anv --files-from=file_list.txt pi@192.168.0.162:/home/pi /mnt/c/temp/rsync-retropie
