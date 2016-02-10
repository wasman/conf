export VERTX_HOME=~/Applications/vert.x/vert.x-3.1.0/
export PATH=~/Applications/npm-global/bin:$PATH
export PATH=~/Applications/vert.x/vert.x-3.1.0/bin:$PATH
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH=~/Applications/gradle/gradle-2.10/bin:$PATH
export PATH=~/Applications/play/activator-dist-1.3.7/:$PATH
alias emacs="/usr/local/Cellar/emacs/24.5/Emacs.app/Contents/MacOS/Emacs -nw"

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash
alias tmux="TERM=screen-256color-bce tmux"
