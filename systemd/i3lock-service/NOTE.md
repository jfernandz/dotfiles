# Template systemd services

- The service must be placed into `/etc/systemd/system/` because when is enabled it creates a symlink inside `/etc/systemd/system/sleep.target.wants/`

- This kind of services has an `@` because you must specify something after the `@`, for instance in this case `i3lock@.service` could be activated performing `sudo systemctl enable i3lock@wyre.service` 

- The service can include `%I` or `%i` as [this post explains](https://superuser.com/questions/393423/the-symbol-and-systemctl-and-vsftpd).

- This service has been written according to [Sleep Hooks in Arch Linux Wiki](https://wiki.archlinux.org/index.php/Power_management#Sleep_hooks). Also further information can be found in [Arch Linux Wiki](https://wiki.archlinux.org/index.php/Power_management)
