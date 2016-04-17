#!/bin/bash

# Uncomment if you don't have a CA yet
#openssl genrsa -out ca.key 2048;
#openssl req -batch -config openssl.conf -new -x509 -nodes -days 3650 -key ca.key -out ca.crt;

openssl x509 -req -in tobehost.net.csr -days 3650 -CA ca.crt -CAkey ca.key -CAcreateserial -CAserial ca.srl -out tobehost.net.crt;
openssl req -batch -config openssl.conf -newkey rsa:2048 -days 3650 -nodes -keyout tobehost.net.bad.key -out tobehost.net.csr -subj "/CN=SERVER tobehost.net";
openssl rsa -in tobehost.net.bad.key -out tobehost.net.key
rm tobehost.net.bad.key
openssl x509 -req -in tobehost.net.csr -days 3650 -CA ca.crt -CAkey ca.key -CAserial ca.srl -out tobehost.net.crt;

