#!/bin/bash

# Initial testing - This is terrible and should be rewritten.  Possibly even written in haskell...
mkdir work
cd work || exit
git clone https://github.com/ekmett/lens/
cd lens || exit
stack init
