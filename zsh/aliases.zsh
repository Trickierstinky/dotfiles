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


eval "$(rbenv init -)"
eval "$(ndenv init -)"

alias szshrc='source ~/.zshrc'
alias du='du -h'
alias df='df -h'
alias f='find -iname'
alias v='vim'
alias meteo='curl http://wttr.in/Arras'
alias up="sudo apt update && sudo apt -V --yes upgrade"

# Multitail with basic java colorization
alias mu='multitail -cS apache -cS log4j -n 1000 --no-repeat -b 2 --mark-interval 2'

# History with timestamps and elapsed time
alias h='history -iD'

# ls
# -v: natural sort of version
alias ls='ls                                  -v --classify --group-directories-first --color=auto'
alias  l='ls -l              --human-readable -v --classify --group-directories-first --color=auto'
alias ll='ls -l              --human-readable -v --classify --group-directories-first --color=auto'
alias la='ls -l --almost-all --human-readable -v --classify --group-directories-first --color=auto'

# grep
alias  grep='grep --color=auto'
alias egrep='grep --color=auto'
alias zgrep='grep --color=auto'

# More verbose fileutils
alias cp='nocorrect cp -iv' # -i to prompt for every file
alias mv='nocorrect mv -iv'
alias rm='nocorrect rm -Iv' # -I to prompt when more than 3 files
alias rmdir='rmdir -v'
alias chmod='chmod -v'
alias chown='chown -v'

# ZSH global aliases for piping
# Example : cat myfile.txt G pattern
alias -g G='| grep -in'
alias -g T='| tail'
alias -g L='| less'

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
alias gpa="git push ; git push bitbucket ; git push stash"

# Rails
alias rs="./bin/rails s"
alias rc="./bin/rails c"
alias kr="killrails"
alias be="./bin/bundle exec"



# Maven
alias m='mvn-in-colors'
compdef _mvn m=mvn
MAVEN_SKIP_TESTS='-Dmaven.test.skip=true' # or -DskipTests
alias   mc='alert printAndRun mvn-in-colors clean'
alias   mt='alert printAndRun mvn-in-colors test'
alias  mct='alert printAndRun mvn-in-colors clean test'
alias  mcp='alert printAndRun mvn-in-colors clean package'
alias mcpt='alert printAndRun mvn-in-colors clean package $MAVEN_SKIP_TESTS'
alias  mpt='alert printAndRun mvn-in-colors package $MAVEN_SKIP_TESTS'
alias  mci='alert printAndRun mvn-in-colors clean install'
alias mcit='alert printAndRun mvn-in-colors clean install $MAVEN_SKIP_TESTS'
alias  mdt='mvn dependency:tree'
alias  msb='printAndRun mvn spring-boot:run'

# NPM
alias  ns='printAndRun npm start'
alias  nt='printAndRun npm test'
alias ntw='printAndRun npm run test:watch'

# Scala SBT
alias st='printAndRun sbt ~test-quick'
