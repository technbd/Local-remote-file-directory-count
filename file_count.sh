host192_file_count=$(find /test -type f | wc -l)
#host191_file_count=$(ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null zabbix@192.168.10.191 "find /test -type f | wc -l")
#host190_file_count=$(ssh root@192.168.10.190 "find /test -type f | wc -l")
host190_file_count=$(ssh zabbix@192.168.10.190 "find /test -type f | wc -l")

echo "Host-192 file count: $host192_file_count"
echo "Host-190 file count: $host190_file_count"

if [ -z "$host190_file_count" ]; then
  echo "Error: Unable to retrieve file count from Host-190."
  exit 1
fi



#Subtract counts
difference=$((host192_file_count - host190_file_count))

if [ "$difference" -eq 0 ]; then
  echo "File counts match."
else
  echo "File counts differ by $difference."
fi



