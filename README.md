# Hokie Guide

## ~/.bashrc

### To init different anaconda environments for different clusters
- Install anaconda into a different folder for each cluster and modify the below script accordingly.
```
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
```
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
