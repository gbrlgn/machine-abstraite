#!/bin/sh


GIT_DIR=/home/gbrlgn/Documentos/Git

cd $GIT_DIR/private/ssl
cp $GIT_DIR/machine-abstraite/scripts/data/server_rootCA.csr.cnf .
cp $GIT_DIR/machine-abstraite/scripts/data/v3.ext .

openssl genrsa -out server_rootCA.key 2048
openssl req -x509 -new -nodes -key server_rootCA.key -sha256 -days 3650 -out server_rootCA.pem
openssl req -new -sha256 -nodes -out server.csr -newkey rsa:2048 -keyout server.key -config <( cat server_rootCA.csr.cnf )
openssl x509 -req -in server.csr -CA server_rootCA.pem -CAkey server_rootCA.key -CAcreateserial -out server.crt -days 3650 -sha256 -extfile v3.ext

mv server.key private.key
mv server.crt certificate.crt