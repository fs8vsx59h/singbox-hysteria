#!/bin/bash
touch /etc/sing-box/fullchain.cer
touch /etc/sing-box/private.key
jq -r  '.gts.Certificates[3].certificate' /etc/traefik/acme.json | base64 -d > /etc/sing-box/fullchain.cer
echo "GET CERTIFICATE SUCCESS"
jq -r  '.gts.Certificates[3].key' /etc/traefik/acme.json | base64 -d > /etc/sing-box/private.key
echo "GET PRIVATE KEY SUCCESS"
sing-box run -c /etc/sing-box/config.json
