# Screen Locking
gsd-screensaver-proxy is triggered when using lighdm. To prevent this behaviour you need to disable the gnome-flashback screensaver by performing:

`gsettings set org.gnome.gnome-flashback screensaver false`

or using `dconf-editor`

**This will disable the gnome-flashback screensaver** and will allow you to use i3lockmore through the systemd service

# Template systemd services

- The service must be placed into `/etc/systemd/system/` because when is enabled it creates a symlink inside `/etc/systemd/system/sleep.target.wants/`

- This kind of services has an `@` because you must specify something after the `@` (an argument), for instance in this case `i3lock@.service` could be activated performing `sudo systemctl enable i3lock@wyre.service`, but not necessary the argument must be a username, it could also be a path for a config file, etc 
  - For example, for [rsnapshot-systemd package](https://aur.archlinux.org/packages/rsnapshot-systemd) containing `rsnapshot` timers and services you would have to use `/etc/rsnapshot.conf` as argument, though people in `#archlinux` did not recommend me them unless to run multiple instances with multiple configs
</p>

- The service can include `%I` or `%i` as [this post explains](https://superuser.com/questions/393423/the-symbol-and-systemctl-and-vsftpd).

- This service has been written according to [Sleep Hooks in Arch Linux Wiki](https://wiki.archlinux.org/index.php/Power_management#Sleep_hooks). Also further information can be found in [Arch Linux Wiki](https://wiki.archlinux.org/index.php/Power_management)
