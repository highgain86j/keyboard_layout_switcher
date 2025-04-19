#!/bin/bash

if lsusb | grep -qi 'Apple.*Keyboard'; then
	echo "[kb-AppleUSB] Apple USB keyboard connected."
	systemctl stop kb-PC.service
	systemctl start kb-Mac.service
else
	echo "[kb-AppleUSB] Apple USB keyboard disconnected."
	systemctl stop kb-Mac.service
	systemctl start kb-PC.service
fi
