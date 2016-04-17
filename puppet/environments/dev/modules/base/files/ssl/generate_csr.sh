#!/bin/bash

openssl genrsa -out tobehost.key 4096
openssl req -new -batch -config openssl.conf -key tobehost.key -out tobehost.csr

