# !/bin/bash

data_dir=/data

rclone_conf_dir="/config/rclone"
rclone_conf_file="$rclone_conf_dir/rclone.conf"
clouds_conf_dir=$(pwd)/config

mkdir -p $rclone_conf_dir
touch $rclone_conf_file

for file in $clouds_conf_dir/*.conf; do
  cat $file >> $rclone_conf_file
  filename=${file##*/}
  drive_name=${filename%.*}
  if [[ ! -d "/data/$drive_name" ]]; then
    echo "Create directory for drive $drive_name: $data_dir/$drive_name"
    mkdir -p /data/$drive_name
  fi
  echo "Mount drive $drive_name at $data_dir/$drive_name"
  rclone mount --daemon $drive_name: $data_dir/$drive_name
done

cd $data_dir
exec "$@"