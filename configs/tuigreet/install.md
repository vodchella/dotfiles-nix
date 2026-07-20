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
_greeter ALL=(root) NOPASSWD: /usr/bin/loginctl poweroff
_greeter ALL=(root) NOPASSWD: /usr/bin/loginctl reboot
```

Copy `./config.toml` to `/etc/tuigreet/config.toml`
Copy `../greetd/config.toml` to `/etc/greetd/config.toml`
Copy `../i3/i3.desktop` to `/usr/share/xsessions/i3.desktop`

If `elogind is already running` errors appear on the login screen, run:
```bash
sudo sv down elogind
sudo rm /etc/runit/runsvdir/default/elogind
```
