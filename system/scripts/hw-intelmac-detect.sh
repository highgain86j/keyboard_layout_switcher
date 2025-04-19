#!/bin/bash
if grep -qi "Apple" /sys/class/dmi/id/sys_vendor; then
	echo "[hw-intelmac] Intel Mac detected."
	exit 0
else
	echo "[hw-intelmac] Not an Intel Mac. Exiting."
	exit 1
fi
