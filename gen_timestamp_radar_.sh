#!/bin/bash
__conda_setup="$('/home/ee904/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ee904/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ee904/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ee904/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup

#echo " =====Start processing the data ====="
conda activate CBMOT

## Define the values of the arguments
cart_resolution=.17361
cart_pixel_width=1152
name="rain_2_0"
path="/media/ee904/Data_stored/radiate/data/radiate/"
directory="radar_cart_0.7361_2001_timestamped"
folders=("city_1_1" "city_1_0" "city_5_0")
## Call the script and pass the arguments to it
for folder_name in "${folders[@]}"; do
	python src/pw_ndt_radar_scan_matching/script/radiate_polar_to_cart_png.py --cart_resolution $cart_resolution --cart_pixel_width $cart_pixel_width --path $path --directory $directory --folder_name $folder_name
done
conda deactivate 
