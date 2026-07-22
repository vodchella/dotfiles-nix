```bash
sudo xbps-install -S greetd
sudo mkdir -p /var/cache/tuigreet
sudo chown _greeter:_greeter /var/cache/tuigreet

wget https://github.com/NotAShelf/tuigreet/releases/download/0.10.2/tuigreet-0.10.2-x86_64
sudo cp tuigreet-0.10.2-x86_64 /usr/local/bin/tuigreet
sudo chmod 755 /usr/local/bin/tuigreet

sudo ln -s /etc/sv/greetd /var/service
sudo sv up greetd
```

Write to `/etc/sudoers.d/tuigreet`:
```
_greeter ALL=(root) NOPASSWD: /usr/sbin/poweroff
_greeter ALL=(root) NOPASSWD: /usr/bin/poweroff
_greeter ALL=(root) NOPASSWD: /usr/sbin/reboot
_greeter ALL=(root) NOPASSWD: /usr/bin/reboot
```

```bash
sudo mkdir /etc/tuigreet
sudo cp config.toml /etc/tuigreet/config.toml
sudo cp ../greetd/config.toml /etc/greetd/config.toml
sudo cp ../i3/i3.desktop /usr/share/xsessions/i3.desktop
```

If `elogind is already running` errors appear on the login screen, run:
```bash
sudo sv down elogind
sudo rm /etc/runit/runsvdir/default/elogind
```
If some strange behavior:
```bash
sudo rm /etc/runit/runsvdir/default/agetty-tty1
```
