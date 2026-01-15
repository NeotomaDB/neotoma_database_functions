#!/bin/bash
export TBLS_VERSION=1.85.2
curl -o tbls.deb -L https://github.com/k1LoW/tbls/releases/download/v$TBLS_VERSION/tbls_$TBLS_VERSION-1_amd64.deb
dpkg -i tbls.deb
rm tbls.deb