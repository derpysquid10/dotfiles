# For a full list of active aliases, run `alias`.

function alias_if_exists() {
  # Does the alias only if the aliased program is installed
    if command -v $2 > /dev/null; then
        alias "$1"="$2"
    fi
}


# Better defaults
# alias ncdu='ncdu --confirm-quit --color dark'
alias crontab="VIM_CRONTAB=true crontab"
alias_if_exists 'diff' 'colordiff'
alias_if_exists 'ag' 'rg'
alias_if_exists 'vim' 'nvim'
alias_if_exists 'fdupes' 'jdupes'
                          
# MacOS GNUs
for i in awk cat chgrp chmod chown chroot cut date df du echo egrep env false fgrep find grep join kill link ln logname ls make mkdir mknod mktemp mv nice nohup paste perf printf pwd readlink realpath rm rmdir sed sort split tac tail tar tee test touch tr true truncate tty uniq unlink unzip uptime users who whoami yes zip; do
   alias_if_exists "$i" "g$i"
done
alias_if_exists "id" "/usr/local/bin/gid"

###########################################################
# Shortcuts

# Use colors in coreutils utilities output
alias grep='grep --color'
# chellcheck
alias sc='shellcheck'
# ls aliases
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -lh'
# cd aliases
alias ..='cd ..'
alias ...='cd ../..'

# overwritten aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias mkdir="mkdir -p"     # -p make parent dirs as needed
alias df="df -h"           # -h prints human readable format
alias du='du -hs'

# downloads
alias wget='wget -c'
#alias curl='curl -C'
alias rsync='rsync -avhr --progress -P'

# git related aliases
# there are also some alias in git config
alias ga='git add'
alias gaa='git add --all'
alias gap='git add --patch'  # patch - interactively select which line of code 
alias gb='git branch'
alias gst='git status'
# commit   -v: show what changes we have done
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gcm='git commit -m'
alias gca='git commit -av'
alias gcam='git commit -a -m'
#clone
alias gcl='git clone --recurse-submodules'
function gcd {
  local dir
  if [[ $# -eq 2 ]]; then
    gcl -- $1 $2 || return
    dir=$2
  else
    gcl -- $1 || return
    dir=$(basename "$1" .git)
  fi
  builtin cd $dir
}
# checkout 
alias gco='git checkout'
alias gcom='git checkout master'
#alias gcd='git checkout dev'
alias gcb='git checkout -b'  # create new branch and checkout
alias gbd='git branch -d'  # opposite to the above: delete a branch <- must after merging it into its upstream branch
# Note that gs is also ghostscript
alias ghostscript="/usr/local/bin/gs"
alias gf='git fetch'
# comment out to try to gup oftern
# alias gl='git pull'  # = fetch + merge
alias gup='git pull --rebase' # = fetch+rebase, better than gl in most cases
alias gp='git push'
alias gpsu='git push --set-upstream' # equalivant to git push -u
alias gpsuo='git push --set-upstream origin' 
alias gpsuom='git push --set-upstream origin master' 
alias gg='git graph'
# unalias gd
alias gd='git diff'
alias gds='git diff --staged'
alias gdc='git diff --cached'
alias gD='git ls-files'
alias gag='git exec ag'
# stash
alias gsta='git stash' # push , gst=status
alias gstu='git stash --include-untracked'
alias gstaa='git stash apply' # like pop, without clearing the stash
alias gstp='git stash pop' # =apply+clear
alias gsts='git stash show --text'
alias gstc='git stash clear'  # remove all
alias gstd='git stash drop'  # <stash>: remove a specific stash
#git reset
alias grh='git reset'  # (HEAD)
alias grhh='git reset --hard'
alias grso='git reset --soft origin/$(git_current_branch)'
alias grho='git reset --hard origin/$(git_current_branch)'
alias grsh="git reset --soft HEAD~1"
# rebase
alias grb='git rebase'  # <basebranch> <topicbranch>
alias grbi='git rebase -i' # interactively  
alias grba='git rebase --abort'
alias grbc='git rebase --continue' # use after add the solved confliction
alias grbo='git rebase --onto' # <basebranch> <exclude> <topicbranch>
# merge
alias gm='git merge'
# no fast-forwarding: when merging branches, maintain git topology
alias gmb='git merge --no-ff'  
# bisect:
#alias gbs='git bisect'
alias gbss='git bisect start'
alias gbsg='git bisect good'
alias gbsb='git bisect bad'
alias gbsr='git bisect reset'
#remote
alias grv='git remote -v'
alias grmv='git remote rename'
alias grrou='git remote rename origin upstream'
alias gra='git remote add'
alias grao='git remote add origin'
alias grset='git remote set-url' # change url of an existing remote
#git log
alias glog="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias glogs="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --stat --all"

# tensorboard 
alias tb='tensorboard --logdir '

# tmux
alias t='tmux'
alias ta='tmux attach -t'
alias tn='tmux new -s '
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'

## Jupyter
alias jc="jupyter console"
alias jco="jupyter nbconvert"
alias jn="jupyter notebook"
alias jn-b="jupyter notebook --no-browser"

# python
alias py3='python3 '
alias pip_install='python3 -m pip install --user'
alias py_path='python -c "import sys; print(sys.path)"'
alias py3_path='python3 -c "import sys; print(sys.path)"'
alias torch_version='python -c "import torch; print(torch.version.cuda)"'
alias torch_cuda='python -c "import torch; print(torch.cuda.is_available())"'
#conda 
alias ca='conda activate'
alias coa='.anaconda/bin/activate'
alias sa='source activate'
alias cod='conda deactivate'  # different  from cd 
alias sd="source deactivate"
alias coel='conda info --envs'
alias coer='conda env remove --name'
alias conda_export='conda env export > environment.yml'

#micromamba
alias mm="micromamba"
alias mma="micromamba activate"
alias mmd="micromamba deactivate"
alias micromamba_export="micromamba env export > environemnt.yml"

#rsync
alias copy='rsync -avzP'

# path
alias echo_path='echo $PATH | tr ":" "\n"'
alias myip='curl ipinfo.io/ip 2> /dev/null'

# Mirror stdout to stderr, useful for seeing data going through a pipe
alias peek='tee >(cat 1>&2)'

# ssh:
# do not use aliases, use config instead
alias cressida="ssh doc_cressida"
alias bigboy="ssh doc_bigboy"

# claude swapping
alias csw="cswap"
alias csws="cswap --switch"
alias cswls="cswap --list"


####################################################################


# Shell dependent Alias (only zsh has global aliases)
case $SHELL in
*/zsh)
   # assume Zsh
   ;;
*/bash)
   # assume Bash
   ;;
*)
   # assume something else
   ;;
esac

# # hostname dependent alias
# if [[ "$(hostname)" == "binbin-pc" ]]; then 
#     alias earphone='python3 /home/binbin/Documents/bluetooth\ sound/sony_connect.py' 
# fi
