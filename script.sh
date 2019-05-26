#!/bin/bash
# generate an RSA modulus with specific number of bits using openssl
# how to use it: $sh script.sh
# Author : K.Draziotis (2019)

openssl genrsa -out example.key 1024    # generate the RSA public key with modulus of specific number of bits
openssl rsa -in example.key -noout -modulus > hex.out 
awk -F '=' '{print $2}' hex.out > dec.out
sed -i '1s/^/ibase=16;\n/' dec.out
echo "Modulus RSA:\n";cat dec.out|bc;echo "\n";
cat dec.out|bc > rsa.out
rm example.key hex.out dec.out

# finally you've to run
# $time ./msieve -i rsa.out -t 4 -q
#TODO: remove "/" from rsa.txt	