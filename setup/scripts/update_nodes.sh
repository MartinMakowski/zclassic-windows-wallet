#!/bin/bash

wget -O nodes.html "https://c-cex.com/?id=ws&shownodes=zcl" 
python2 update_nodes.py
rm -f nodes.html
