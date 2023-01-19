#!/bin/bash
#
# a quick dirty script to update a specific dns record using netlify api
# could spend some time later improving it and making it robust
# set env variables DNS_HOSTNAME_ and NETLIFY_ACCESS_TOKEN_

netlify_api="https://api.netlify.com/api/v1"
token="$D_NETLIFY_ACCESS_TOKEN"
hostname="$D_HOSTNAME"
domain=$(echo -n $hostname | cut -d'.' -f2-3)

ping -q -c 1 ifconfig.io >/dev/null || exit
IP=`curl -s ifconfig.io`

echo "Fetching records"

dns_zones=`curl -s "$netlify_api/dns_zones?access_token=$token" --header "Content-Type:application/json"`
zone_id=`echo $dns_zones | jq ".[]  | select(.name == \"$domain\") | .id" --raw-output`
record=$(curl -s "$netlify_api/dns_zones/$zone_id/dns_records?access_token=$token" --header "Content-Type:application/json" | jq ".[]  | select(.hostname == \"$hostname\")" --raw-output)
record_val=`echo $record | jq ".value" --raw-output`
record_id=`echo $record | jq ".id" --raw-output`

if [[ "$record_val" != "$IP" ]]; then

  # delete the record first
  [[ $record_val -ne "" ]] && curl -X DELETE -s "$netlify_api/dns_zones/$zone_id/dns_records/$record_id?access_token=$token" --header "Content-Type:application/json"

  body=$(cat <<EOF
{
  "type": "A",
  "hostname": "$hostname",
  "value": "$IP",
  "ttl": 5
}
EOF
  )

  echo "Setting new record"
  response=$(curl -s --data "$body" "$netlify_api/dns_zones/$zone_id/dns_records?access_token=$token" --header "Content-Type:application/json")
fi
