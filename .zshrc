# Lines configured by zsh-newuser-install

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt autocd beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/b/.zshrc'

# use modern completen system:
autoload -Uz compinit
compinit
# End of lines added by compinstall

# behavior
export VISUAL=nvim
export EDITOR=nvim
# show username, machine name and cwd
export PS1='%n@%m %~$ '

export QT_QPA_PLATFORMTHEME=qt5ct
export QT_QPA_PLATFORM=wayland

# CTRL+arrow keys skip words
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
# delte key 
bindkey "^[[3~" delete-char

alias ls='ls -Alh --color=auto'
alias vim=nvim

source /home/b/Zeug/bureau/prompt_bureau_setup.zsh white
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

alias config='/usr/bin/git --git-dir=/home/b/.b_dotfiles/ --work-tree=/home/b'
