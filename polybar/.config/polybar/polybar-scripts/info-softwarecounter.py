#!/usr/bin/env python3

import subprocess
from collections import Counter, OrderedDict
import logging


# update GUIs
ENABLE_GUI = True

# update processes
ENABLE_PROCESS = True

# Debugging feature
ENABLE_DEBUG = True


def debug():
    FORMAT = '%(asctime)s - %(levelname)s - %(funcName)s:%(lineno)d - %(message)s'
    logger.setLevel(logging.DEBUG)
    fh = logging.FileHandler(
            filename='./info-softwarecounter.log',
            encoding='utf-8'
    )
    fh.setLevel(logging.DEBUG)
    fh.setFormatter(logging.Formatter(FORMAT))
    logger.addHandler(fh)


logger = logging.getLogger(__name__)

#   _____ _    _ _____
#  / ____| |  | |_   _|
# | |  __| |  | | | |
# | | |_ | |  | | | |
# | |__| | |__| |_| |_
#  \_____|\____/|_____|


# program/process names and corresponding gylphs
guis = OrderedDict({
    'terminals': '',
    'chromes': '',
    'firefox': '',
    'skypeforlinux': '瑩',
    'filemanager': '',
    'remote-desktop': 'ﲾ',
    'pdfviewer': '',
    'image': '',
})

# combine counts of program/process names in the tuple
# the resulting glpyh used will be that of the corresponding key
combine_guis = {
    'terminals': ('gnome-terminal-server', 'xfce4-terminal', 'alacritty', 'termite', 'terminator', 'urxvt'),
    'chromes': ('chromium', 'chrome'),
    'filemanager': ('nemo', 'thunar', 'dolphin', 'nautilus', 'pcmanfm'),
    'remote-desktop': ('TeamViewer', ),
    'pdfviewer': ('evince', 'okular', 'zathura'),
    'image': ('gthumb', 'shotwell', 'deepin-image-vi', 'eog', 'gimp-2.10'),
}


def get(cmd):
    return subprocess.check_output(cmd).decode("utf-8").strip()


# def check_wtype(w_id):
#     # check the type of window, only list "NORMAL" windows
#     return "_NET_WM_WINDOW_TYPE_NORMAL" in get(["xprop", "-id", w_id])


def get_process(w_id):
    # get the name of the process, owning the window
    proc = get(["ps", "-p", w_id, "-o", "cmd="])
    return proc.split()[0].split("/")[-1]


def get_running_guis():

    wlist = [
        line.split() for line in subprocess.check_output(
            ["wmctrl", "-lp"]
        ).decode("utf-8").splitlines()
    ]

    logger.debug("wlist after LC:")
    logger.debug("-"*10)
    for i in wlist:
        logger.debug(i)
    logger.debug("-"*10)

    validprocs = [
        get_process(w[2]) for w in wlist if w[2] != '0'  # and check_wtype(w[0])
    ]

    logger.debug(f"validprocs -> {validprocs}")
    return validprocs


def GUI(gui_output=''):

    # get list of running GUI programs
    gui_counts = Counter(get_running_guis())
    logger.debug(f"gui_counts -> {gui_counts}")

    logger.debug("combine_guis items:")
    logger.debug("-"*10)
    # combine programs in program combine list
    for k, lst in combine_guis.items():
        logger.debug(f"{k} -> {lst}")
        count = 0
        for i in lst:
            try:
                count += gui_counts.pop(i)
            except KeyError:
                pass
        if count:
            gui_counts[k] += count
    logger.debug("-"*10)
    logger.debug(f"gui_counts after for loop -> {gui_counts}")

    logger.debug("guis items:")
    logger.debug("-"*10)
    # generate program output
    for k, v in guis.items():
        logger.debug(f"{k} -> {v}")
        try:
            logger.debug(f"k, gui_counts[k] -> {k}, {gui_counts[k]}")
            c = gui_counts[k]
            if c:
                logger.debug(f"ADDING {v} to gui_output")
                gui_output += f'%{{T10}}{v}%{{T}} x{c}   '
        except Exception:
            pass
    logger.debug("-"*10)

    logger.debug(f"gui_output -> {gui_output}")
    return gui_output


#  _____  _____   ____   _____ ______  _____ _____
# |  __ \|  __ \ / __ \ / ____|  ____|/ ____/ ____|
# | |__) | |__) | |  | | |    | |__  | (___| (___
# |  ___/|  _  /| |  | | |    |  __|  \___ \\___ \
# | |    | | \ \| |__| | |____| |____ ____) |___) |
# |_|    |_|  \_\\____/ \_____|______|_____/_____/


processes = OrderedDict({
    'vims': '',  # '',
    'ssh': '',
    'updater': '',
    'dockers': '',
})

combine_proccesses = {
    'vims': ('nvim', 'vim', 'atom'),
    'updater': ('pacman', 'yay', 'trizen', 'yaourt', 'makepkg', 'auracle'),
    'dockers': ('docker-proxy',),
}


def get_running_proc(process_name_list):
    counts = [None] * len(process_name_list)

    for i, p in enumerate(process_name_list):
        try:
            count = int(
                subprocess.check_output(
                    ['pgrep', '-c', '-x', p]
                ).decode('utf-8')
            )
        except subprocess.CalledProcessError:
            count = 0

        counts[i] = (p, count)
    return dict(counts)


def PROCESS(process_output=''):

    # count running proccesses
    process_counts = get_running_proc(processes.keys())
    logger.debug(f"process_counts -> {process_counts}")
    combine_counts = get_running_proc(
        list(sum(combine_proccesses.values(), ()))
    )
    logger.debug(f"combine_counts -> {combine_counts}")
    process_counts.update(combine_counts)
    logger.debug(f"process_counts.update() -> {process_counts}")

    # combine processes in process combine list
    logger.debug("combine_proccesses items:")
    logger.debug("-"*10)
    for k, lst in combine_proccesses.items():
        logger.debug(f"k, lst -> {k}, {lst}")
        count = 0
        for i in lst:
            try:
                count += process_counts.pop(i)
            except KeyError:
                pass
        if count:
            process_counts[k] += count
    logger.debug("-"*10)
    logger.debug(f"process_counts -> {process_counts}")

    # generate process output
    logger.debug("processes items:")
    logger.debug("-"*10)
    for k, v in processes.items():
        logger.debug(f"k, v -> {k}, {v}")
        try:
            c = process_counts[k]
            if c:
                logger.debug(f"ADDING {v} to process_output")
                process_output += f'%{{T10}}{v}%{{T}} x{c}   '
        except Exception:
            pass
    logger.debug("-"*10)

    logger.debug(f"process_output -> {process_output}")
    return process_output


def main():
    gui_output, process_output = '', ''

    if ENABLE_GUI:
        logger.debug("Including GUI apps:")
        gui_output = GUI()

    if ENABLE_PROCESS:
        logger.debug("Including Processes:")
        process_output = PROCESS()

    print(gui_output + process_output)


if __name__ == "__main__":

    if ENABLE_DEBUG:
        debug()

    logger.debug("------------ Script runs  -----------")
    main()
    logger.debug("------------ Script stops -----------\n")
