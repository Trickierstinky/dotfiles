#Functions
weather () {
        if [ -z "$1" ]
        then
                curl "http://wttr.in/Sheffield"
        else
                curl "http://wttr.in/$1"
        fi
}

killrails () {
        if [ -z "$1" ]
        then
                fuser -k 3000/tcp
        else
                fuser -k $1/tcp
        fi
}

export GOROOT="$HOME/projects/go/"
export GOPATH="$HOME/projects/go/"
export PATH="$HOME/.rbenv/bin:$HOME/.ndenv/bin:$HOME/bin:$PATH:$GOROOT/bin"
export PATH="$PATH:~/.composer/vendor/bin:~/bin:/usr/local/go/bin:/usr/local/mongodb/bin"

alias szshrc='source ~/.zshrc'
alias du='du -h'
alias df='df -h'
alias f='find -iname'
alias v='vim'
alias weather='curl http://wttr.in/Sheffield'

# Multitail with basic java colorization
alias mu='multitail -cS apache -cS log4j -n 1000 --no-repeat -b 2 --mark-interval 2'

# History with timestamps and elapsed time
alias h='history -iD'

# ls
# -v: natural sort of version

alias  l='ls -l --human-readable -v --classify --group-directories-first --color=auto'
alias ll='ls -l --human-readable -v --classify --group-directories-first --color=auto'
alias la='ls -l --almost-all --human-readable -v --classify --group-directories-first --color=auto'

# ZSH global aliases for piping

# Parent directories
alias cd..='cd ..'
alias '..'='cd ..'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -g .......='../../../../../..'

# Git
alias   g='git'
compdef g=git
alias  gs='git status'
alias  gl='git l'
alias  gp='git pull'
alias gaa='git add -A'
# alias gpa="git push ; git push bitbucket ; git push stash"

# Rails
alias rs="./bin/rails s"
alias rc="./bin/rails c"
alias kr="killrails"
alias be="./bin/bundle exec"

# NPM
alias  ns='printAndRun npm start'
alias  nt='printAndRun npm test'
alias ntw='printAndRun npm run test:watch'

alias edot='code ~/.dotfiles/'
alias dwnld='cd ~/Downloads'
alias sshots='cd ~/Pictures/Screenshots'
alias pics='cd ~/Pictures'
