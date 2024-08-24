# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
eval "`SHELL=/bin/bash dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
#
# Some more alias to avoid making mistakes:
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

# man console_codes
#       -- Makes the sequence not take any actual terminal spaces
#      /  -- escape sequence to start colors
#      | /   -- color selections separated by a ;
#      | |  /    -- Code for setting attributes
#      | |  |   / -- Close the initial [ - so command line wrap is correct.
#      |_|__|___|/_
# GRN="\[\e[1;32m\]"
GRN="\[\e[1;32m\]"
NOR="\[\e[0;39;49;27m\]"
COL="\[\e[1;34m\]"
PS1="⌁ \u$NOR@$GRN\H$NOR:\w\n${COL}❯$NOR "

HISTCONTROL=ignoredups:ignorespace
HISTSIZE=10000

export PATH=/root/bin:$PATH
