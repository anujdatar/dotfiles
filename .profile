# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export ANSIBLE_CONFIG="$HOME/.ansible/ansible.cfg"
CODE_FOLDER='<path-to-Code>'

alias cdcode='cd $CODE_FOLDER'
alias cdardno='cd $CODE_FOLDER/arduino'
alias cdbash='cd $CODE_FOLDER/bash_projects'
alias cddocker='cd $CODE_FOLDER/docker_projects'
alias cdelect='cd $CODE_FOLDER/electron\ apps/'
alias cdjs='cd $CODE_FOLDER/js_projects'
alias cdpy='cd $CODE_FOLDER/python_projects'
alias cdtut='cd $CODE_FOLDER/tutorials'
alias work='cd $CODE_FOLDER/work'

alias goog="ping -c 4 www.google.com"
alias goog6="ping6 -c 4 www.google.com"

alias wscrcpy="adb kill-server && adb tcpip 5555 && db connect <device-ip>:5555 && scrcpy"
export QT_QPA_PLATFORMTHEME=gtk2

export GPG_TTY=$(tty)
