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
  - [polybar-scripts](https://github.com/x70b1), I've got my own fork of this repo and I hope to contribute in a near future. My custom scripts are included in this repo.
<br><br>
<br><br>
## Getting started <a name="getting-started"></a>
#### Dependencies <a name="dependencies"></a>
  - [i3wm](https://www.archlinux.org/packages/community/x86_64/i3-wm/) - comminity
    - [i3-gaps](https://www.archlinux.org/packages/community/x86_64/i3-gaps/) (i3wm's fork, so you **must** chose one of them, `i3` or `i3-gaps`, see [contents](#contents)) - comminity
    - [i3-gnome](https://aur.archlinux.org/packages/i3-gnome/). Not mandatory but I strongly recommend it in order to manage things your cursor/icon themes, online accounts, etc. It does requires `gnome` as dependency, but I'm researching about how to integrate it with minimum gnome's packages required. It can be installed alongside `i3` or `i3-gaps` - AUR
    - Perhaps a few more **extra packages** which I start in the i3 startup. Like [Megasync](https://github.com/meganz/MEGAsync) client, but **those are optional**.
  - [rofi](https://www.archlinux.org/packages/community/x86_64/rofi/) - comminity
    - [rofi-calc](https://aur.archlinux.org/packages/rofi-calc/) - AUR
  - [polybar](https://aur.archlinux.org/packages/polybar/) - AUR
    - [polybar-scripts](https://github.com/x70b1) - GH, but a few of those scripts are included and customized in this repo.
  - [compton](https://www.archlinux.org/packages/community/x86_64/compton/) - community
    - No speciacial dependencies. Default cfg
  - [weechat](https://www.archlinux.org/packages/community/x86_64/weechat/) - comminity
  - [zsh](https://www.archlinux.org/packages/extra/x86_64/zsh/) - extra
    - [zimfw](https://aur.archlinux.org/packages/zsh-zim-git/) - AUR
    - [powerlevel9k](https://www.archlinux.org/packages/community/any/zsh-theme-powerlevel9k/) - comminity
  - **Fonts**
    - [cantarell-fonts](https://www.archlinux.org/packages/extra/any/cantarell-fonts/) - extra
    - [ttf-font-awesome](https://www.archlinux.org/packages/community/any/ttf-font-awesome/) - comminity
    - [siji-git](https://aur.archlinux.org/packages/siji-git/) - AUR
    - [nerd-fonts-complete](https://aur.archlinux.org/packages/nerd-fonts-complete/) - AUR
    - [ttf-weather-icons](https://aur.archlinux.org/packages/ttf-weather-icons/) - AUR
    - [ttf-go-mono-git](https://aur.archlinux.org/packages/ttf-go-mono-git/) - AUR
#### Usage (Clone/Fork) <a name="usage"></a>
  - ##### You are free to fork/clone this repo for personal usage, they are _simple_ config files.
  - ##### The main script is [launcher-polybar](https://github.com/WyRe/dotfiles/blob/master/polybar/.config/polybar/launcher-polybar), it is launching the following resources:
    - `polybar`
    - `megasync`
    - `feh`

    **depending on the `$HOSTNAME` value**
#### Deploying <a name="deploying"></a>
The most important thing to mention in here is that, this is a conventional git repo, so you are free to clone it into your `$HOME` and then use `stow` to create the proper symlinks folder by folder, e.g.

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
You are free to fork this project, but since these are personal cfgs, I think I won't accept pull requests. Obviously you might want to fork it and customize. To get it clear, my workflow is like I've described in [usage](#usage) and the contents are described below.
#### Contents <a name="contents"></a>
In detail, this repo does contain my personal configs for my two personal computers. This repo only needs a branch to at the moment.
  - [master](https://github.com/WyRe/dotfiles/tree/master)

    It does contain the general/shared cfg files, specifically **config files for** these programs
    - `i3` / `i3-gaps` (`i3-gaps` is a fork of `i3`, so it you cannot install both at the same time. You must chose `i3-gaps` or disable inside [i3 conf file](https://github.com/WyRe/dotfiles/blob/master/i3/.config/i3/config) the lines from 305 to 427)
    - `compton`
    - `rofi` + `rofi-calc`
    - `termite`
    - `weechat` scripts for weechats do not load apparently (despite of they are listed in the config file), anyway at this moment I'm using the following (you are able to use `/script` command in weechat to manage them):
        - `go.py`
        - `highmon.pl`
        - `grep.py`
        - `unset_unused.pl`
        - `autosort.py`
        - `emoji.lua`
    - `zsh` + `zimfw` + `powerlevel9k`
    - `polybar` + `polybar-scripts`
<br><br>
<br><br>
## License <a name="license"></a>
I think this could be an unlicensed repo. They only are setups.
<br><br>
<br><br>
## Work in progress <a name="wip"></a>

At this time I'm working on it, so it may looks like a bit empty.
