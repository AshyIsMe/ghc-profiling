#!/bin/bash

RESOLVER1="lts-6.5"
RESOLVER2="nightly-2016-06-30"

# Initial testing - This is terrible and should be rewritten.  Possibly even written in haskell...
mkdir work
cd work || exit
#lens is a bit too complex to start with... # git clone https://github.com/ekmett/lens/
git clone https://github.com/acid-state/acid-state
cd acid-state || exit

#Resolver1
stack init --resolver "$RESOLVER1" && stack setup && stack build
stack clean
#time stack build &> "$RESOLVER1-timing.txt"
{ time stack build ; } 2> "$RESOLVER1-timing.txt"
stack clean && rm stack.yaml

#Resolver2
stack init --resolver "$RESOLVER2" && stack setup && stack build
stack clean
#time stack build &> "$RESOLVER2-timing.txt"
{ time stack build ; } 2> "$RESOLVER2-timing.txt"

stack clean && rm stack.yaml

cp "$RESOLVER1-timing.txt" ../..
cp "$RESOLVER2-timing.txt" ../..

tail -n 3 *timing*
