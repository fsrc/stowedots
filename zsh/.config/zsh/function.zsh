

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

set-title(){
   echo -en "\033]0;$1\a"
}

fsrc(){
  rse fsrc.pw $1 $2
}
