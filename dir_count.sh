host192_dir_count=$(find /test -type d | wc -l)
#host191_dir_count=$(ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null zabbix@192.168.10.191 "find /test -type f | wc -l")
#host190_dir_count=$(ssh root@192.168.10.190 "find /test -type d | wc -l")
host190_dir_count=$(ssh zabbix@192.168.10.190 "find /test -type d | wc -l")

echo "Host-192 Directory count: $host192_dir_count"
echo "Host-190 Directory count: $host190_dir_count"

if [ -z "$host190_dir_count" ]; then
  echo "Error: Unable to retrieve file count from Host-190."
  exit 1
fi


# Subtract counts
difference=$((host192_dir_count - host190_dir_count))

if [ "$difference" -eq 0 ]; then
  echo "Directory counts match."
else
  echo "Directory counts differ by $difference."
fi

