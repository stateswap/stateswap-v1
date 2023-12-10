#!/bin/sh

rm -rf build
truffle test $1
echo "Press any key to continue..."
 
# -s: Do not echo input coming from a terminal
# -n 1: Read one character
read -s -n 1