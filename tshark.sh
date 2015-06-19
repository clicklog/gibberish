#!/bin/sh

. ./tshark.proto
proto="$1"
shift

# you can add to print payload: -e text
# decode-as: -d tcp.port=5439,pgsql

eval target=\"\$$proto\"
sudo tshark -i eth0 -T fields -E separator='|' \
	-e frame.time_relative \
	-e frame.len \
	-e ip.src \
	-e tcp.srcport \
	-e ip.dst \
	-e tcp.dstport \
	${target} $@
