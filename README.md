# WyRe's dot-stuff

![](https://github.com/WyRe/dotfiles/blob/master/screenshots/Screenshot_2019-03-02_22-43-23.png)

## Table of Contents
- [Introduction](#introduction)
- [Getting started](#getting-started)
  - [Dependencies](#dependencies)
  - [Usage](#usage)
  - [Deploying](#deploying)
- [Forks](#forks)
  - [Contents](#contents)
- [License](#license)
- [Work in progress](#wip)
## Introduction <a name="introduction"></a>
This repo contains my personal cfgs for my custom desktop environment. You are free to fork and customize it. Track your dot-stuff!

I'm Arch Linux user, a great part of software listed in [dedependencies](#dependencies) section is available in Arch oficial repos or AUR.
  ##### Cloned from github:
  - [polybar-scripts](https://github.com/x70b1), I've got my own fork of this repo and I hope to contribute in a near future. My custom scripts are included in this repo ([desktop](/WyRe/dotfiles/tree/desktop/polybar/.config/polybar/polybar-scripts) and [laptop](/WyRe/dotfiles/tree/laptop/polybar/.config/polybar/polybar-scripts) branches)
  - [zimfw](https://github.com/zimfw/zimfw). I've followed their [install guide](https://github.com/zimfw/zimfw#installation), of course you must also install `zimfw` if you want to use [.zimrc](/WyRe/dotfiles/blob/master/zsh/.zimrc). In this case, `zimfw` does include the [liquidprompt](https://github.com/nojhan/liquidprompt) which I'm using
  - [weechat-notify-send](https://github.com/s3rvac/weechat-notify-send), it is also already included in [master](/WyRe/dotfiles/tree/master/weechat/.weechat/python)

<br><br>
<br><br>
## Getting started <a name="getting-started"></a>
#### Dependencies <a name="dependencies"></a>
  - [i3wm](https://github.com/i3/i3)
    - [i3-gaps](https://github.com/Airblader/i3) (i3wm's fork, so you **must** chose one of them, `i3` or `i3-gaps`, see [contents](#contents)) - AUR
    - [i3-gnome](https://github.com/csxr) (not mandatory but recommended) - AUR
    - Perhaps a few more **extra packages** which I start in the i3 startup. Like [Megasync](https://github.com/meganz/MEGAsync) client, but **those are optional**.
  - [rofi](https://github.com/DaveDavenport/rofi)
    - [rofi-calc](https://github.com/svenstaro/rofi-calc) - AUR
  - [polybar](https://github.com/jaagr/polybar) - AUR
    - [polybar-scripts](https://github.com/x70b1) - GH, but included in this repo
  - [compton](https://github.com/chjj/compton)
    - No speciacial dependencies. Default cfg.
  - [weechat](https://github.com/weechat/weechat)
    - [weechat-notify-send](https://github.com/s3rvac/weechat-notify-send)
  - [zsh](https://github.com/zsh-users/zsh)
    - [zimfw](https://github.com/zimfw/zimfw) - GH, and **not** included in this repo, only cfg.
  - **Fonts**
    - [cantarell-fonts](https://www.archlinux.org/packages/extra/any/cantarell-fonts/)
    - [ttf-font-awesome](https://www.archlinux.org/packages/community/any/ttf-font-awesome/)
    - [siji-git](https://aur.archlinux.org/packages/siji-git/) - AUR
    - [nerd-fonts-complete](https://aur.archlinux.org/packages/nerd-fonts-complete/) - AUR
    - [ttf-weather-icons](https://aur.archlinux.org/packages/ttf-weather-icons/) - AUR
    - [ttf-go-mono-git](https://aur.archlinux.org/packages/ttf-go-mono-git/) - AUR
#### Usage (Clone/Fork) <a name="usage"></a>
  - ##### Only [desktop](/WyRe/dotfiles/tree/master) or [laptop](/WyRe/dotfiles/tree/laptop) are _working_ branches, [master](/WyRe/dotfiles/tree/master) just contains common setups.
  - ##### [desktop](/WyRe/dotfiles/tree/desktop) and [laptop](/WyRe/dotfiles/tree/laptop) branches are completely independent, they just depend on [master branch](/WyRe/dotfiles/tree/master).
  - ##### These three branches will keep permanently separated forever.
  - ##### Workflow: common setups are made into [master](/WyRe/dotfiles/tree/master) branch, then this branch will be merged into [desktop](/WyRe/dotfiles/tree/desktop) and [laptop](/WyRe/dotfiles/tree/laptop). For specific changes just the proper branch will be pushed.
#### Deploying <a name="deploying"></a>
The most important thing to mention in here is that, this is a conventional git repo, so you are free to clone it into your $HOME and then use `stow` to create the proper symlinks folder by folder, e.g.

```
$ cd ~/
$ git clone https://github.com/WyRe/dotfiles/tree/desktop
$ cd ~/dotfiles
$ stow i3
```

It will symlink this `i3` cfg folder into your `$HOME/.config/i3` folder (preserving the folder structure).
____
**Note:** In the case you have already a cfg folder for `i3` (that's to say, `$HOME/.config/i3` already exist), then `stow` will warn you, and you will must to backup that already existing config if you want to use this one instead of yours.
____
<br><br>
<br><br>
## Forks <a name="forks"></a>
You are free to fork this project, but since these are personal cfgs, I think I won't accept pull requests. Obviously you might want to fork it and customize. To get it clear, my workflow is like I've described in [usage](#usage) and the contents for each branch are described below.
#### Contents (per branch) <a name="contents"></a>
In detail, this repo does contain my personal configs for my two personal computers. In fact, because of this, It has been divided in multiple branches, containing the following described:
  - [master](/WyRe/dotfiles/tree/master) [**Do not clone this branch, it will always keep _incomplete_**]: It does contain the general/shared cfg files, specifically **config files for** these programs
    - `i3` / `i3-gaps` (`i3-gaps` is a fork of `i3`, so it you cannot install both at the same time. You must chose `i3-gaps` or disable inside [i3 conf file](https://github.com/WyRe/dotfiles/blob/master/i3/.config/i3/config) the lines from 305 to 427)
    - `compton`
    - `rofi` + `rofi-calc`
    - `termite`
    - `weechat`
    - `zsh` + `zimfw`  
<br><br>
  - [desktop](/WyRe/dotfiles/tree/desktop): at this moment this branch contains **the same files than [master](/WyRe/dotfiles/tree/master), but with an extra folder** for polybar setup; this setup is adapted to my HDMI desktop display, polybar spawns two status bar, one at the top and the other at bottom. Bottom bar is just sysinfo, but top bar contains workspaces, volume widget, shutdown buttons a widget to manage usb storage devuces, etc... So ..
    - Inherits from [master](/WyRe/dotfiles/tree/master)
    - `polybar` setup for desktop PC
<br><br>
  - [laptop](/WyRe/dotfiles/tree/laptop): right now this is a slightly modified version of top bar in [desktop](/WyRe/dotfiles/tree/desktop) branch, however **also this branch just depend on master branch**. Thus
    - Inherits from [master](/WyRe/dotfiles/tree/master)
    - `polybar` setup for my laptop PC
<br><br>
<br><br>
## License <a name="license"></a>
I think this could be an unlicensed repo. They are just setups.
<br><br>
<br><br>
## Work in progress <a name="wip"></a>

At this time I'm working on it, so it may looks like a bit empty.

