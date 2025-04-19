install: install_system install_user

install_system:
	install -m 755 system/scripts/kb-set.sh /usr/local/bin/kb-set.sh
	install -m 755 system/scripts/hw-intelmac-detect.sh /usr/local/bin/hw-intelmac-detect.sh
	install -m 755 system/scripts/kb-appleusb-toggle.sh /usr/local/bin/kb-appleusb-toggle.sh
	install -m 644 system/systemd/*.service /etc/systemd/system/
	install -m 644 system/udev/*.rules /etc/udev/rules.d/
	systemctl daemon-reexec

install_user:
	mkdir -p $$HOME/.local/bin
	install -m 755 user/scripts/kb-layout-watcher.sh $$HOME/.local/bin/
	mkdir -p $$HOME/.config/systemd/user
	install -m 644 user/systemd/kb-layout-watcher.service $$HOME/.config/systemd/user/
	systemctl --user daemon-reexec
