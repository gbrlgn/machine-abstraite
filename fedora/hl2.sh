#!/bin/bash

cd /home/dancer/.config

ausearch -c 'hl2_linux' --raw | audit2allow -M hl2linux

semodule -X 300 -i hl2linux.pp
