install:
	install -m 755 scripts/kb-set.sh /usr/local/bin/kb-set.sh
	install -m 755 scripts/hw-intelmac-detect.sh /usr/local/bin/hw-intelmac-detect.sh
	install -m 755 scripts/kb-appleusb-toggle.sh /usr/local/bin/kb-appleusb-toggle.sh
	install -m 644 systemd/*.service /etc/systemd/system/
	install -m 644 udev/*.rules /etc/udev/rules.d/
	systemctl daemon-reexec
