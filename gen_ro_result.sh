#!/bin/bash

save_dir=/media/ee904/Data_stored/radiate/data/radiate
search_dir=/media/ee904/Data_stored/radiate/data/radiate/radar_cart_0.7361_2001_timestamped
  # split the folder path with "/"
excluded_name=("city_1_3")  # add the scene not want to be processed in here

for entry in "$search_dir"/*
do
  IFS="/"
  array=($entry)
  if [[ ${excluded_name[@]} =~ ${array[-1]} ]]
  then 
    continue
  fi
  IFS=""
  echo Processing the ${array[-1]} 
   # it should return folder name only ex: city_1_0
  save_path=$save_dir/${array[-1]}
  roslaunch pw_ndt_radar_scan_matching radar_odometry.launch bag_name:=${array[-1]} save_dir:="$save_path"
done


