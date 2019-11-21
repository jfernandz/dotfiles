#!/usr/bin/env python3

import subprocess
import sys
from collections import Counter, OrderedDict


# update GUIs
GUI = True

# update processes
PROCESS = True


# program/process names and corresponding gylphs
guis = OrderedDict({
    'terminals': '%{T10}%{T}',
    'chromes': '%{T10}%{T}',
    'firefox': '%{T10}%{T}',
    'skypeforlinux': '%{T10}瑩%{T}',
    'filemanager': '%{T10}%{T}',
    'remote-desktop': '%{T10}ﲾ%{T}',
    'pdfviewer': '%{T10}%{T}',
    'image': '%{T10}%{T}',
})

processes = OrderedDict({
    'vims': '%{T10}%{T}',
    'ssh': '%{T10}%{T}',
    'updater': '%{T10}%{T}',
})

# combine counts of program/process names in the tuple
# the resulting glpyh used will be that of the corresponding key
combine_guis = {
    'terminals': ('xfce4-terminal', 'termite', 'terminator', 'urxvt'),
    'chromes': ('chromium', 'chrome'),
    'filemanger': ('nemo', 'thunar', 'dolphin', 'nautilus', 'pcmanfm', 'Archivos'),
    'remote-desktop': ('TeamViewer', ),
    'pdfviewer': ('evince', 'okular', 'zathura'),
    'image': ('gthumb', 'shotwell', 'deepin-image-vi'),
}

combine_proccesses = {
    'vims': ('nvim', 'vim', 'atom'),
    'updater': ('pacman', 'yay', 'trizen', 'yaourt', 'makepkg', 'auracle'),
}


gui_output = ''
process_output = ''

if GUI:

    def get_running_guis():
        try:
            listed = sys.argv[1]
        except IndexError:
            listed = []

        get = lambda cmd: subprocess.check_output(cmd).decode("utf-8").strip()

        def check_wtype(w_id):
            # check the type of window, only list "NORMAL" windows
            return "_NET_WM_WINDOW_TYPE_NORMAL" in get(["xprop", "-id", w_id])

        def get_process(w_id):
            # get the name of the process, owning the window
            proc = get(["ps", "-p", w_id, "-o", "comm="])
            return proc

        wlist = [l.split() for l in subprocess.check_output(["wmctrl", "-lp"])\
                 .decode("utf-8").splitlines()]
        validprocs = [
            get_process(w[2]) for w in wlist if check_wtype(w[0]) == True
        ]

        return validprocs

    # get list of running GUI programs
    gui_counts = Counter(get_running_guis())

    # combine programs in program combine list
    for k, lst in combine_guis.items():
        count = 0
        for i in lst:
            try:
                count += gui_counts.pop(i)
            except KeyError:
                pass
        if count:
            gui_counts[k] += count

    # generate program output
    for k, v in guis.items():
        try:
            c = gui_counts[k]
            if c:
                gui_output += '%s %i ' % (v, c)
        except:
            pass

if PROCESS:

    def get_running_proc(process_name_list):
        counts = [None] * len(process_name_list)

        for i, p in enumerate(process_name_list):
            try:
                count = int(
                    subprocess.check_output(['pgrep', '-c', '-x',
                                             p]).decode('utf-8'))
            except subprocess.CalledProcessError:
                count = 0
            counts[i] = (p, count)

        return dict(counts)

    # count running proccesses
    process_counts = get_running_proc(processes.keys())
    combine_counts = get_running_proc(
        list(sum(combine_proccesses.values(), ())))
    process_counts.update(combine_counts)

    # combine processes in process combine list
    for k, lst in combine_proccesses.items():
        count = 0
        for i in lst:
            try:
                count += process_counts.pop(i)
            except KeyError:
                pass
        if count:
            process_counts[k] += count

    # generate process output
    for k, v in processes.items():
        try:
            c = process_counts[k]
            if c:
                process_output += '%s %i ' % (v, c)
        except:
            pass

print(gui_output + process_output)
