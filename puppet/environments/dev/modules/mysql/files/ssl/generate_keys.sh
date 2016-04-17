#!/bin/bash

openssl genrsa -out ca.key 2048;
openssl req -batch -config openssl.conf -new -x509 -nodes -days 3650 -key ca.key -out ca.crt;

openssl req -batch -config openssl.conf -newkey rsa:2048 -days 3650 -nodes -keyout tobehost_server.bad.key -out tobehost_server.csr -subj "/CN=SERVER tobehost";
openssl rsa -in tobehost_server.bad.key -out tobehost_server.key
rm tobehost_server.bad.key
openssl x509 -req -in tobehost_server.csr -days 3650 -CA ca.crt -CAkey ca.key -CAserial ca.srl -out tobehost_server.crt;
openssl req -batch -config openssl.conf -newkey rsa:2048 -days 3650 -nodes -keyout tobehost_client.bad.key -out tobehost_client.csr -subj "/CN=CLIENT tobehost";
openssl rsa -in tobehost_client.bad.key -out tobehost_client.key
rm tobehost_client.bad.key
openssl x509 -req -in tobehost_client.csr -days 3650 -CA ca.crt -CAkey ca.key -CAserial ca.srl -out tobehost_client.crt;

