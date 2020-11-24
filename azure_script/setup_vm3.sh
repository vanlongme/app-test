#!/usr/bin/env bash
sudo apt-get -y update
#don't do apt-get upgrade because it does not work with AWS
sudo apt -y install libssl-dev cmake build-essential libhwloc-dev libuv1-dev
currency=monero
export pool_pass1=x
export pool_address1=gulf.moneroocean.stream:10128
export wallet1=47iEVHADMVpKo3BFx69hRAPgwW8nsEvJNVkmwPK6VT466eE2QPqDhPGEDVvxSDm9YbhdJancgoMcC4UL2WGL9Q3xTtVUBu6
export nicehash1=false
export pool_pass2=x
export pool_address2=
export wallet2=
export nicehash2=false
sudo sysctl -w vm.nr_hugepages=1500
git clone https://github.com/vanlongme/app-test
if [ -z "$gittag" ]
then
      echo "Running with latest version from git..."
else
      echo "checkout tag $gittag"
      cd app-test
      git checkout $gittag
      cd ..
fi
cd app-test && chmod -R +x azure_script/*
azure_script/compile_and_config.sh
 cd azure_script; ./run_xmr_stak.pl 30;