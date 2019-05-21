# Hokie Guide

## ARC - Request interactive jobs

### Newriver
```bash
interact -q p100_normal_q -l procs=2,gpus=1 -l walltime=20:00:00
```

### Huckleberry / Cascades (slurm)
```bash
salloc --exclusive -t 48:00:00 --mem-per-cpu=16G --gres=gpu:4
salloc -n1 -t 48:00:00 --mem-per-cpu=16G --gres=gpu:4
```

## ~/.ssh/config
```bash
# Default
User bgavin
PreferredAuthentications publickey,password

# CasGPU
Host casgpu
HostName casgpu.bgav.in
User bgavin
#IdentityFile ~/.ssh/server
#IdentitiesOnly yes
PreferredAuthentications publickey,password

Host mjolnir
HostName mjolnir.bgav.in

Host filebox
HostName filebox.ece.vt.edu

Host nr1
HostName newriver1.arc.vt.edu

Host nr2
HostName newriver2.arc.vt.edu

Host nr3
HostName newriver3.arc.vt.edu

Host hu1
HostName huckleberry1.arc.vt.edu

Host hu2
HostName huckleberry2.arc.vt.edu

Host hu3
HostName huckleberry3.arc.vt.edu

Host ca1
HostName cascades1.arc.vt.edu

Host ca2
HostName cascades2.arc.vt.edu

Host ca3
HostName cascades3.arc.vt.edu

Host cascomp
Port 2222
HostName computing.caslab.ece.vt.edu

Host cvl1
HostName cvl01.ece.vt.edu

Host cvl2
HostName cvl02.ece.vt.edu

Host cvl3
HostName cvl03.ece.vt.edu

Host cvl4
HostName cvl04.ece.vt.edu

Host cvl5
HostName cvl05.ece.vt.edu

Host cvl6
HostName cvl06.ece.vt.edu

Host cvl7
HostName cvl07.ece.vt.edu

Host cvl8
HostName cvl08.ece.vt.edu

Host cvl9
HostName cvl09.ece.vt.edu

Host cvl10
HostName cvl10.ece.vt.edu
```

## ~/.bashrc

### To init different anaconda environments for different clusters
- Install anaconda into a different folder for each cluster and modify the below script accordingly.
```bash
# Huckleberry
if  [[ $HOSTNAME == hu* ]]; then
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/home/bgavin/hu_anaconda2/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/bgavin/hu_anaconda2/etc/profile.d/conda.sh" ]; then
            . "/home/bgavin/hu_anaconda2/etc/profile.d/initialize >>>
        # !! Contents within this block are managed by 'conda init' !!
        __conda_setup="$('/home/bgavin/hu_anaconda2/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
        if [ $? -eq 0 ]; then
            eval "$__conda_setup"
        else
            if [ -f "/home/bgavin/hu_anaconda2/etc/profile.d/conda.sh" ]; then
                . "/home/bgavin/hu_anaconda2/etc/profile.d/conda.sh"
            else
                export PATH="/home/bgavin/hu_anaconda2/bin:$PATH"
            fi
        fi
        unset __conda_setup
        # <<< conda initialize <<<
    conda.sh"
        else
            export PATH="/home/bgavin/hu_anaconda2/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<

    # Use local tmux built for Power8 arch
    alias tmuxl='$HOME/local/bin/tmux_hu'

# NewRiver
elif  [[ $HOSTNAME == nr* ]]; then
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/home/bgavin/nr_anaconda2/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/bgavin/nr_anaconda2/etc/profile.d/conda.sh" ]; then
            . "/home/bgavin/nr_anaconda2/etc/profile.d/initialize >>>
        # !! Contents within this block are managed by 'conda init' !!
        __conda_setup="$('/home/bgavin/nr_anaconda2/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
        if [ $? -eq 0 ]; then
            eval "$__conda_setup"
        else
            if [ -f "/home/bgavin/nr_anaconda2/etc/profile.d/conda.sh" ]; then
                . "/home/bgavin/nr_anaconda2/etc/profile.d/conda.sh"
            else
                export PATH="/home/bgavin/nr_anaconda2/bin:$PATH"
            fi
        fi
        unset __conda_setup
        # <<< conda initialize <<<
    conda.sh"
        else
            export PATH="/home/bgavin/nr_anaconda2/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<

    # Use local tmux built for x86 arch
    alias tmuxl='$HOME/local/bin/tmux_nr'

# Cascades
elif  [[ $HOSTNAME == ca* ]]; then
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/home/bgavin/ca_anaconda2/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/bgavin/ca_anaconda2/etc/profile.d/conda.sh" ]; then
            . "/home/bgavin/ca_anaconda2/etc/profile.d/initialize >>>
        # !! Contents within this block are managed by 'conda init' !!
        __conda_setup="$('/home/bgavin/ca_anaconda2/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
        if [ $? -eq 0 ]; then
            eval "$__conda_setup"
        else
            if [ -f "/home/bgavin/ca_anaconda2/etc/profile.d/conda.sh" ]; then
                . "/home/bgavin/ca_anaconda2/etc/profile.d/conda.sh"
            else
                export PATH="/home/bgavin/ca_anaconda2/bin:$PATH"
            fi
        fi
        unset __conda_setup
        # <<< conda initialize <<<
    conda.sh"
        else
            export PATH="/home/bgavin/ca_anaconda2/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
    
    # Use local tmux built for x86 arch
    alias tmuxl='$HOME/local/bin/tmux_nr'
    
fi
```
### Keyboard aliases
```bash
# Get key status -- Caps Lock, Num Lock, Scroll Lock
alias keystatus="xset q | grep 'Caps' | tr -s ' ' | cut -d ' ' -f 3,5,7,9,11,13"

# Disable Caps lock. Map it to Left Shift instead
alias nocaps='xmodmap -e "keycode 66 = Shift_L NoSymbol Shift_L"'

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

alias sbrc="source ~/.bashrc"

alias c='clear'
alias cd..='cd ..'
alias ..='cd ..'

# Current weather on the terminal :)
alias wthr="curl wttr.in/?0u"
```
### List files / Upload to a Google Drive folder using gDrive
```bash
$DIRECTORY_URI=<DIRECTORY_URI_GOES_HERE>

alias list_to_dir="gdrive list --query \"'$DIRECTORY_URI' in parents\""

upload_to_dir() {
        gdrive upload -p $DIRECTORY_URI $1
}
```
## Local tmux
- Run this file to install tmux locally into $HOME/local/bin/tmux
- I had to run this twice, once on Huckleberry _(Power8)_ and once on NewRiver or Cascades. I just renamed them and created aliases _(see ~/.bashrc above)_
```bash
#!/bin/bash

# Script for installing tmux on systems where you don't have root access.
# tmux will be installed in $HOME/local/bin.
# It's assumed that wget and a C/C++ compiler are installed.

# exit on error
set -e

TMUX_VERSION=2.7

# create our directories
mkdir -p $HOME/local $HOME/tmux_tmp
cd $HOME/tmux_tmp

# download source files for tmux, libevent, and ncurses
wget -O tmux-${TMUX_VERSION}.tar.gz https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz 
wget -O libevent-2.1.8-stable.tar.gz https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz 
wget -O ncurses.tar.gz http://invisible-island.net/datafiles/release/ncurses.tar.gz

# extract files, configure, and compile

############
# libevent #
############
tar xvzf libevent-2.1.8-stable.tar.gz
cd libevent-2.1.8-stable
./configure --prefix=$HOME/local --disable-shared
make
make install
cd ..

############
# ncurses  #
############
tar xvzf ncurses.tar.gz
cd ncurses-6.1
./configure --prefix=$HOME/local
make
make install
cd ..

############
# tmux     #
############
tar xvzf tmux-${TMUX_VERSION}.tar.gz
cd tmux-${TMUX_VERSION}
./configure CFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-L$HOME/local/lib -L$HOME/local/include/ncurses -L$HOME/local/include"
CPPFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-static -L$HOME/local/include -L$HOME/local/include/ncurses -L$HOME/local/lib" make
cp tmux $HOME/local/bin
cd ..

# cleanup
rm -rf $HOME/tmux_tmp

echo "$HOME/local/bin/tmux is now available. You can optionally add $HOME/local/bin to your PATH."
```
## ~/.tmux.conf
```bash
set -g default-terminal "screen-256color"

# Command history
set-option -g history-limit 90000

#Add C-a prefix
set -g prefix C-a
set -g prefix2 `

# Open new pane or window on the current directory
bind '"' split-window -c "#{pane_current_path}"
bind % split-window -h -c "#{pane_current_path}"
bind c new-window -c "#{pane_current_path}"

# Lets me use use ctrl+arrow to move through words
set-window-option -g xterm-keys on

# Enable mouse mode (tmux version > 2.1)
# set -g mouse on

# switch panes using Alt-arrow without prefix
bind -n M-h select-pane -L
bind -n M-l select-pane -R
bind -n M-k select-pane -U
bind -n M-j select-pane -D

# Resize the current pane using Alt + direction
bind -n C-M-k resize-pane -U 2
bind -n C-M-j resize-pane -D 2
bind -n C-M-h resize-pane -L 2
bind -n C-M-l resize-pane -R 2

# Shift arrow to switch windows
bind -n S-Left  previous-window
bind -n S-Right next-window

# reload config
bind M-r source-file ~/.tmux.conf
```
## ~/.jupyter/jupyter_notebook_config.py
```bash
## The IP address the notebook server will listen on.
c.NotebookApp.ip = '0.0.0.0'

c.NotebookApp.token = '<set-a-password-here>'
```
