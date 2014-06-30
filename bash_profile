alias java='java -ea -server'
alias ll='ls -la'
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
export PS1='\[\033[0;32m\]\u@\h\[\033[0;36m\] \w\[\033[31m\] $(parse_git_branch)\[\033[0;36m\]$\[\033[00m\] '
export CLICOLOR=1

export PATH=~/trevor/scripts:$PATH
export PATH="/Applications/Postgress.app/Contents/Versions/9.3/bin:$PATH"
