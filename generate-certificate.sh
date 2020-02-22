#!/bin/sh
echo Generate CA key:
openssl ecparam -name prime256v1 -genkey -out ca.key

echo Generate CA certificate:
openssl req -new -x509 -days 365 -key ca.key -out ca.crt -subj "/C=FR/ST=31/L=Toulouse/O=Minitel/O=MinitelToolbox/CN=localhost"

echo Generate server key:
openssl ecparam -name prime256v1 -genkey -out server.key

echo Generate server signing request:
openssl req -new -key server.key -out server.csr -subj  "/C=US/ST=31/L=Toulouse/O=Minitel/O=MinitelToolbox/CN=localhost"

echo Self-sign server certificate:
openssl x509 -req -days 365 -in server.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out server.crt

echo Generate client key
openssl ecparam -name prime256v1 -genkey -out client.key

echo Generate client signing request:
openssl req -new -key client.key -out client.csr -subj  "/C=US/ST=31/L=Toulouse/O=Minitel/O=MinitelToolbox/CN=marc"

echo Self-sign client certificate:
openssl x509 -req -days 365 -in client.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out client.crt