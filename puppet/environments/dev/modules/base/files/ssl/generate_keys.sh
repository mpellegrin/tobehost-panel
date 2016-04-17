#!/bin/bash

openssl req -batch -config openssl.conf -new -x509 -nodes -days 3650 -out tobehost.crt -keyout tobehost.key;

