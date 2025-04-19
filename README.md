# kb-layout-switcher

A modular keyboard layout switching system using systemd and udev. Supports dynamic layout changes based on:

- Intel Mac hardware detection
- Standard PC fallback
- Apple USB keyboard hotplug on PC

## Usage

Enable the systemd units after installing:

```bash
sudo systemctl daemon-reexec
sudo systemctl enable hw-IntelMac.service kb-PC.service kb-Mac.service
```

Place the udev rule in `/etc/udev/rules.d/`.

## License

MIT
