# WyRe's dot-stuff
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
<br><br>
<br><br>
## Getting started <a name="getting-started"></a>
#### Dependencies <a name="dependencies"></a>
  - [i3wm](https://github.com/i3/i3)
    - [i3-gaps](https://github.com/Airblader/i3) (i3wm's fork)
    - [i3-gnome](https://github.com/csxr) (not mandatory but recommended)
    - Perhaps a few more **extra packages** which I start in the i3 startup. Like [Megasync](https://github.com/meganz/MEGAsync) client, but **those are optional**.
  - [rofi](https://github.com/DaveDavenport/rofi)
    - [rofi-calc](https://github.com/svenstaro/rofi-calc)
  - [polybar](https://github.com/jaagr/polybar)
    - [polybar-scripts](https://github.com/x70b1)
  - [compton](https://github.com/chjj/compton)
    - No speciacial dependencies. Default cfg.
  - [weechat](https://github.com/weechat/weechat)
    - [weechat-notify-send](https://github.com/s3rvac/weechat-notify-send)
#### Usage (Clone/Fork) <a name="usage"></a>
  - ##### Only [desktop](/WyRe/dotfiles/tree/master) or [laptop](/WyRe/dotfiles/tree/laptop) are _working_ branches, [master](/WyRe/dotfiles/tree/master) just contains common setups.
  - ##### [desktop](/WyRe/dotfiles/tree/desktop) and [laptop](/WyRe/dotfiles/tree/laptop) branches are completely independent, they just depend on [master branch](/WyRe/dotfiles/tree/master).
  - ##### These three branches will keep permanently separated forever.
  - ##### Workflow: common setups are made into [master](/WyRe/dotfiles/tree/master) branch, then this branch will be merged into [desktop](/WyRe/dotfiles/tree/desktop) and [laptop](/WyRe/dotfiles/tree/laptop). For specific changes just the proper branch will be pushed.
#### Deploying <a name="deploying"></a>
The most important thing to mention in here is that, this is a conventional git repo, so you are free to clone it into your $HOME and then use `stow` to create the proper symlinks folder by folder, for example:

```
$ cd ~/
$ git clone https://github.com/WyRe/dotfiles/tree/desktop
$ cd ~/dotfiles
$ stow i3
```

It will symlink this `i3` cfg folder into your `$HOME/.config/i3` folder.
____
**Note:** In the case you have already a cfg folder for `i3` (that's to say, `$HOME/.config/i3` already exist), then `stow` will warn you, and you will must to backup that already existing config if you want to use this one instead of yours.
____
<br><br>
<br><br>
## Forks <a name="forks"></a>
You are free to fork this project, but since these are personal cfgs, I think I won't accept pull requests. Obviously you might want to fork it and customize. To get it clear, my workflow is like I've described in [usage](#usage) and the contents for each branch are described below.
#### Contents (per branch) <a name="contents"></a>
In detail, this repo does contain my personal configs for my two personal computers. In fact, because of this, It has been divided in multiple branches, containing the following described:
  - [master](/WyRe/dotfiles/tree/master): It does contain the general/shared cfg files, specifically these
    - `i3`
    - `compton`
    - `rofi`
    - `termite`
    - `weechat`
<br><br>
  - [desktop](/WyRe/dotfiles/tree/desktop): at this moment this branch contains **the same files than [master](/WyRe/dotfiles/tree/master), but with an extra folder** for polybar setup; this setup is adapted to my HDMI desktop display, polybar spawns two status bar, one at the top and the other at bottom. Bottom bar is just sysinfo, but top bar contains workspaces, volume widget and a shutdown button. So ..
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


