# kb-layout-switcher

This project includes both system-wide and user-session-based keyboard layout switching mechanisms using `systemd`, `udev`, and user services.

## Features

- Detect Intel Mac hardware and configure layout accordingly
- Use PC layout by default on non-Mac hardware
- Dynamically switch to Mac layout when Apple USB keyboard is plugged in
- Restore PC layout when Apple keyboard is removed
- GUI session layout updated live via user-level watcher

## Installation

- `make install_system` – Installs the systemd and udev components
- `make install_user` – Installs the user service for GUI layout switching
- `make install` – Installs both

## License

MIT
