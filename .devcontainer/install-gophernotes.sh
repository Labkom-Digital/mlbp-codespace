#!/bin/bash
go install github.com/gopherdata/gophernotes@v0.7.5
mkdir -p /home/vscode/.local/share/jupyter/kernels/gophernotes
cd /home/vscode/.local/share/jupyter/kernels/gophernotes
cp "$(go env GOPATH)"/pkg/mod/github.com/gopherdata/gophernotes@v0.7.5/kernel/*  "."
chmod +w ./kernel.json # in case copied kernel.json has no write permission
sed "s|gophernotes|$(go env GOPATH)/bin/gophernotes|" < kernel.json.in > kernel.json