#!/usr/bin/env sh
set -e

container_ids="$(docker ps -q)"

if [ -z "$container_ids" ];then
  echo "No container found!"
  exit 1
fi

echo "Cleaner was started!"
for container_id in $container_ids
do
  log_file="$(docker inspect --format='{{.LogPath}}' "$container_id")"
  truncate -s 0 "$log_file"
done

echo "Cleaning was successfully finished!"
