#!/bin/bash

mkdir -p tmp
mount|grep -q $(pwd)/tmp || sudo mount -t tmpfs -o mode=01777,size=20m tmpfs tmp
cp attack_kryptologik.py ../../deadpool_dfa*.py tmp
cp ../../../JeanGrey/phoenixAES/phoenixAES/__init__.py tmp/phoenixAES.py
cp ../target/DemoKey_table_encrypt.c tmp
cp ../target/DemoKey_table.bin tmp/DemoKey_table.bin.gold
cd tmp
ulimit -c 0
gcc -o DemoKey_table_encrypt DemoKey_table_encrypt.c
./attack_kryptologik.py
