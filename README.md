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
PreferredAuthentications publickey

# CasGPU
Host casgpu
HostName casgpu.bgav.in
User bgavin
#IdentityFile ~/.ssh/server
#IdentitiesOnly yes
PreferredAuthentications publickey

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
fi
```
## Local tmux
- Run this file to install tmux locally into $HOME/local/bin/tmux
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
