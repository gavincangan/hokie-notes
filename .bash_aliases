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

# Local tmux setup
alias tmuxl="$HOME/local/bin/tmux"
