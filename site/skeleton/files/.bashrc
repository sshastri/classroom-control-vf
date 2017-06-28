############ Puppet Controlled ############
################# 06/28/17 ################

# .bashrc

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

if [ -f ~/.bashrc-local ]; then
    source ~/.bashrc-local
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific aliases and functions
PS1='\[\e[0;37m\][\[\e[1;32m\]\u\[\e[0;37m\]@\[\e[1;34m\]\h\[\e[0;37m\]:\[\e[0;36m\]\w\[\e[1;37m\]]\[\e[1;32m\]\$\[\e[0;37m\] '
