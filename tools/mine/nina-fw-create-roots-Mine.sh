#!/bin/bash
echo '' > roots.pem.mine

while read -u 9 p; do
echo $p
HOST=${p%:*}
PORTNUMBER=${p#*:}
echo $HOST
echo $PORTNUMBER
#echo -n | openssl s_client -servername $HOST -connect $HOST:$PORTNUMBER </dev/null 2>/dev/null | openssl x509 $openssl_opts >> roots.pem
openssl s_client -showcerts -verify 5 -servername $HOST -connect $HOST:$PORTNUMBER </dev/null 2>/dev/null | awk '/BEGIN CERTIFICATE/,/END CERTIFICATE/{ if(/BEGIN CERTIFICATE/){a++}; out="cert"a".pem"; print >out}'
for cert in *.pem; do 
        openssl x509 -in $cert $openssl_opts >> roots.pem.mine
        rm $cert
done


done 9<sites.txt
