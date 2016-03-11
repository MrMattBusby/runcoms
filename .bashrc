# .bashrc
# Bourne Again SHell Run Command.
# 
#   Copyright (c) 2009-2015, Matt Busby @MrMattBusby.
#   All rights reserved.
#
#   Redistribution and use in source and binary forms, with or without
#   modification, are permitted provided that the following conditions
#   are met:
#   
#   1. Redistributions of source code must retain the above copyright
#      notice, this list of conditions and the following disclaimer.
#   
#   2. Redistributions in binary form must reproduce the above copyright
#      notice, this list of conditions and the following disclaimer in
#      the documentation and/or other materials provided with the
#      distribution.
#   
#   3. Neither the name of the copyright holder nor the names of its
#      contributors may be used to endorse or promote products derived
#      from this software without specific prior written permission.
#   
#   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
#   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
#   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
#   FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
#   COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
#   INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
#   BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
#   LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
#   CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
#   LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY
#   WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
#   POSSIBILITY OF SUCH DAMAGE.
#
### TODO ###
#
#   * Customize this .bashrc by changing any values tags with _TODO_
#   * Add a ~/.bashrc_custom for personalizations
#

### if not running interactively, don't do anything ###
[ -z "$PS1" ] && return

### source global definitions ###
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

### shell settings / vim mode ###
set history
#set keymap vi  # vi style usage (can't Alt-. though)
#set -o vi
#set -u  # fail vs '' when using unset vars (exits bash)
#set -e  # ignore failing commands
set -b  # report jobs immedietely

### shopts/sttys ###
shopt -s checkwinsize # check window size after every command
shopt -s histappend # append history among shell sessions

### exports ###
export FALSE=0
export TRUE=1

export NAME=m_busby # _TODO_
export EDITOR=/usr/bin/vim #/usr/local/bin/vim # _TODO_
export HISTSIZE=3000
export HISTFILESIZE=3000
export HISTCONTROL=ignoreboth # don't add cmds w/ '^ ' to history, also ignores dupes
export HOSTS=/etc/hosts
export LC_ALL="C" #en_US.UTF-8
export LANG="C"
export LANGUAGE="C"
export LC_COLLATE="C"
export NUL=/dev/null
export PYTHONIOENCODING=utf_8
export PYTHONSTARTUP=~/.pythonrc # _TODO_
export PYTHONPATH=~/bin:~/scripts:~/git # _TODO_
export SERR=/dev/stderr
export SIMPLEPS=$FALSE
export SIN=/dev/stdin
export SOUT=/dev/stdout

# anaconda priority
if [ -d ~/anaconda/bin ] ; then
  export PATH=~/anaconda/bin:$PATH
fi

### !!! OVERWRITES !!! ###
alias ascii='man ascii | tail --lines +19 | head -89' # info. version-dependant
alias bpy='bpython-curses'
alias cal='cal -3s'
alias chgrp='chgrp --preserve-root' # perms
alias chmod='chmod --preserve-root'  # perms
alias chown='chown --preserve-root'  # perms
alias cd='cd_func' # search subs
alias ci='vim' # because typo
alias cim='vim' # because typo
alias cp='cp -i' # for safety
alias echo='echo -e' # interpret backslash
alias free='free -tm' # totals
alias iostat='iostat -xhm' # more info
alias ipq='ipython qtconsole &'
alias ipy='ipython'
alias less='less -R'  # decode colors
alias ln='ln -i' # for safety
alias ls='ls --color=auto' # better with colors
alias mkdir='mkdir -pv' # create parents
alias mv='mv -i' # for safety
alias ping='ping -i.5 -c4 -W1' # send 4 packets, no need ^C
alias ps='ps auxf' # verbose
alias rm='rm -i' # for safety
alias screen='screen' # or 'byobu' (excellent wrapper but isn't common)
alias tar='tar_func' # for safety/prevent overwrite
alias top='htop 2> $NUL || /usr/bin/top' # htop not always exist
alias tree='tree -aCAS' # cleaner
alias units='man units | tail --lines +9 | head -46' # info. version-dependant
alias vi='if [ -f /etc/vimrc ] ; then /usr/bin/vim -u /etc/vimrc; else /usr/bin/vim -u NONE; fi' # default VI

### typos ###
alias cd..="cd .."
alias cd...="cd ../.."
alias cls='clear'
alias dir='la'
alias dc='cd'
alias ipconfig='/sbin/ifconfig'
alias iv='vim'
alias vmi='vim'
alias L='less'
alias Less='less'
alias LEss='less'
alias mc='mv'

### shortcuts ###
alias .-="cd - &> /dev/null"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ..1="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias beautify='astyle -n -A2yCSUs3NLwYm0M40fpHk3W3j -xe'
alias cd-="cd -"
alias chx='chmod +x'
alias cl-='cl -;'
alias cpu='lscpu || cat /proc/cpuinfo'
alias dff='df -kTh' # more readable
alias duu='du -h --max-depth 1' # display 1-level, summarize folders
alias hist='history | tail -15'
alias hl='grep -E --color=auto -e ^ -e' # highlight + preserve other output
alias la='ls -HAhlpq1' # list all files
alias ld='ls -d .*/ */ 2>/dev/null' # list directories only, simple
alias lt='ls -Hhlpq1t' # list all non .* files by time
alias l.='ls -d .* 2>/dev/null' # list all .* files
alias man2='man 2'
alias man3='man 3'
alias man4='man 4'
alias mem='cat /proc/meminfo'
alias path='echo -e ${PATH//:/\\n}' # easily display path
alias psme="/bin/ps -F | head -1 && /bin/ps -aF --user $USER | hl $USER"
alias pts='echo "pts: you are $(tty)" | egrep /.\* && echo && ps | head -1 && ps auxfh | grep pts/[[:digit:]]'
alias py='python -q 2> $NUL || python'
alias py2='python2.7 -q'
alias py3='python -q || /opt/python3/bin/python3 -q'
alias scr='screen -dRR' # attach to first or create new
alias scrls='screen -ls'
alias so='source'
alias tarc='tar -czvpf' # tar aliased to tar_func() for safety
alias tart='tar -tzvpf' # tar aliased to tar_func() for safety
alias tarx='tar -xzvpf' # tar aliased to tar_func() for safety
alias topcpu='ps | head -1 && /bin/ps auxfh | sort -nr -k 3 | head'
alias topmem='ps | head -1 && /bin/ps auxfh | sort -nr -k 4 | head'
alias topme='ps | head -1 && ps auxfh | egrep $USER | sort -nr -k 3 | head | grep $USER'
alias treed='\tree -dCASL 4' # dir only 3 deep
alias trees='\tree -hpCASL 3' # files 2 deep
alias v='vim'

### programs/filetypes ###
function csv() {
  gnumeric "$@" &
}
function csv2() {
  libreoffice --calc "$@" &
}
function d() {
  if [ $# -lt 1 ] ; then
    echo -e "${CMDCOL}usage:${NC} d arg1 arg2.."
  else
    echo -e "${CMDCOL}diffuse -w $@ &${NC}"
    diffuse -w $@ &
  fi
}
function ff() {
  firefox "$@" &
}
function image() {
  gthumb "$@" &
}
function md() {
  # view a markdown file via pandoc/firefox
  if [ $# -ne 1 ] ; then
    echo -e "${CMDCOL}md: Use one input parameter!${NC}"
  else
    echo -e "${CMDCOL}pandoc $1 -o "/tmp/$1.html" ; firefox "/tmp/$1.html" &${NC}"
    pandoc $1 -o "/tmp/$1.html" 
    firefox "/tmp/$1.html" &
  fi
}
function pdf() {
  evince "$@" &
}

### devel ###
alias m='make'
alias mcm='make clean && make'

# svn diff x | le
function sd() {
  if command -v colordiff &>/dev/null ; then svn diff $@ | colordiff | less -R ; else svn diff $@ | less ; fi
}

# svn log -v x | le# svn log -v x | le
function sl() {
  if [ $# -eq 0 ] ; then svn log -v | less ; else svn log -v $@ | less ; fi
}

alias st='svn st' # | /bin/grep -v ^?'
alias svn_count='svn log -q | grep "|" | awk "{print \$3}" | sort | uniq -c | sort -nr'
alias up='svn up'

### edit startup scripts ###
alias vibu='vim ~/bin/backup'
alias vib='vim ~/.bashrc'
alias vii='vim ~/.ipython/ipythonrc'
alias vik='vim ~/.ssh/known_hosts'
alias vip='vim ~/.pythonrc'
alias vipu='vim ~/scripts/pyutils.py'
alias vis='vim ~/.screenrc'
alias viv='vim ~/.vimrc'

### sudo ###
alias ns='sudo netstat -pa --inet'
alias ports='sudo netstat -tulanp' # open ports
alias vig='sudo vim /etc/group'
alias vih='sudo vim /etc/hosts'
alias visudo='sudo vim /etc/sudoers'

### function definitions ###

# cd to first subdir matching $1 if not found, can't run in subprocess
function cd_func() {
  if [ $# -ge 1 ] ; then
    \cd "$1" 2> /dev/null ||
    {
      local IGDIRS="\/\.(svn|config|cache|vim|local|git)\/"
      local SDIRT="\/${@}$"
      echo -n "bash: cd: Not a directory, searching for \""${@}"\".."
      #local FDIRS=$( \find . -type d -print0 2> /dev/null | \egrep -zZv --color=never "${IGDIRS}" | \egrep -zm1 --color=never "${SDIRT}" )  # Faster on time
      local FDIRS=$( \find . -type d -regextype posix-egrep -regex ".*${SDIRT}" ! -regex ".*${IGDIRS}.*" -print -quit 2> /dev/null )  # Fewer time/calls/errors on strace
      if [ -z "${FDIRS}" ] ; then
        echo "not found!"
        return 1
      else
        echo -n "\r                                                                               \r"
        \cd "${FDIRS}"
      fi
    }
  else
    \cd
  fi
}

# change location then ls, can't run in subprocess
function cl() {
  cd $* 1>/dev/null && ls -pq
}

# display on startup info about user/pc/etc
function me() {
  local TTYINFO=$(tty|sed 's|/dev/||')
  local WHOINFO=$(who|grep $USER|grep pts|wc -l)
  local HOSTINFO1=$(uptime|grep -o "up.*users" | sed 's|  | |g')
  local HOSTINFO2=$(who -q|head -1|sed 's| |\n|g'|sort -u|xargs)
  local PC_INFO=$(cat /proc/cpuinfo | grep -i "model name" | head -1 | sed 's/.*: //' | xargs)
  local PC_NUM=$(cat /proc/cpuinfo | grep -i "processor" | wc -l)
  local PC_STAT_C="$(($(mpstat | grep %idle | sed 's/%idle.*//' | wc -c)-1))"
  local AVG=($(cat /proc/loadavg))
  local LOAD_RAW=($(mpstat | grep %idle -A1 | tail -1 | sed "s/.\{${PC_STAT_C}\}//" | xargs))
  local LOAD=$(echo ${LOAD_RAW[0]} | awk '{print 100-$1}')
  local MEM=($(\free -tm | grep Mem | awk '{print $2,$3}'))
  local CACHE=$(\free -tm | grep "\-/+" | awk '{print $3}')
  local SWP=($(\free -tm | grep Swap | awk '{print $2,$3}'))
  local IP=$(/sbin/ifconfig|egrep -o "(inet addr:|inet )[0-9\.]*" | sed "s/inet addr://" | sed "s/inet //" | xargs | sed 's/ /, /g')
  local OS=$(cat /etc/redhat-release 2>/dev/null || cat /etc/issue 2>/dev/null | head -1 | sed 's/^\s*//' | sed 's/\s*$//')
  local UNAME="$(uname -o) $(uname -r)"
  local VGREP=$(grep --version|head -1|grep -o "[0-9]\?\.[0-9]\?\.[0-9]")
  local VGNU=$(gnuplot --version|sed 's| patch.*||' | tr ' ' ':')
  local VGCC=$(gcc --version|head -1|egrep -o '\(GCC\) .\..\..'|sed 's|(GCC) ||')
  local VVIM=$(vim --version|head -1|egrep -o '.\..')
  local VSVN=$(svn --version 2>/dev/null|head -1|sed 's|, version||'|sed 's| (.*||' | tr ' ' ':')
  local VPY=$(echo $(/bin/env python -V 2>&1)|egrep -o "[pP]ython [0-9\.]*" | tr ' ' ':')
  local DATE=$(date | xargs)

  echo -e "${BWHITE}User  ${BBLACK}: ${WHITE}$USER:$EUID ($HOME)"
  echo -e "${BWHITE}Shell ${BBLACK}: ${WHITE}$SHELL ($TERM: $TTYINFO of $WHOINFO)"
  echo -e "${BWHITE}Host  ${BBLACK}: ${WHITE}${HOSTNAME} ${DISPLAY} ($HOSTINFO1: $HOSTINFO2)"
  echo -e "${BWHITE}PC    ${BBLACK}: ${WHITE}$PC_INFO x$PC_NUM"
  echo -e "${BWHITE}Loads ${BBLACK}: ${WHITE}${LOAD}% ${AVG[@]::4} Mem:${MEM[1]}(${CACHE})/${MEM[0]}Mb Swap:${SWP[1]}/${SWP[0]}Mb"
  echo -e "${BWHITE}IPs   ${BBLACK}: ${WHITE}${IP}"
  echo -e "${BWHITE}OS    ${BBLACK}: ${WHITE}${OS}: $UNAME"
  echo -e "${BWHITE}Vers  ${BBLACK}: ${WHITE}grep:$VGREP $VGNU gcc:$VGCC VIM:$VVIM $VPY"
  echo -e "${BWHITE}Date  ${BBLACK}: ${WHITE}${DATE}${NC}"
}

# define a word
function def() {
  curl dict://dict.org/d:"$(echo $@|xargs)":*
}

# select line, use via pipe (count from 0)
function line() {
  if [ $# -ne 1 ] ; then
    echo -e "${CMDCOL}line: Use only one numeric input parameter!${NC}"
  else
    head -$(($1+1)) | tail -1
  fi
}

# try to match a word for defining
function match() {
  curl dict://dict.org/m:"$(echo $@|xargs)"::re
}

# make directory and goto
function mkgo() {
  if [ $# -eq 1 ] ; then
    echo -e "${CMDCOL}mkdir -pv $1 && cd $1${NC}"
    mkdir -pv $1 && cd $1
  else
    echo -e "${CMDCOL}mkgo: Use only 1 argument!${NC}"
  fi
}

# ipython notebook
function notebook() {
  pushd ~/notebooks
  ipython notebook
}

# pause or sleep
function pause() {
  if [ $# -eq 0 ] ; then
    sleep 999999
  else
    sleep $1
  fi
}

# pc-to-server file transfer: $ pc_s @apt2 file_from file_to
function pc_s() {
  if [ $# -eq 3 ] ; then
    echo -e "${CMDCOL}scp $2 ${NAME}$1:$3${NC}"
    scp $2 ${NAME}$1:$3
  else
    echo -e "${CMDCOL}pc_s: Use 3 arguments: pc_s @server filename destfolder${NC}"
  fi
}

# ps1 function called from PROMPT_COMMAND, changes based on several vars
function create_ps() {
  # last command (this has to be at the top)
  local LAST_CMD=$?

  # escape color codes for prompt (otherwise you'll have PS printing errors, runon lines etc)
  local BLACK="\[$BLACK\]"
  local RED="\[$RED\]"
  local GREEN="\[$GREEN\]"
  local YELLOW="\[$YELLOW\]"
  local BLUE="\[$BLUE\]"
  local PURPLE="\[$PURPLE\]"
  local CYAN="\[$CYAN\]"
  local WHITE="\[$WHITE\]"
  local BBLACK="\[$BBLACK\]"
  local BRED="\[$BRED\]"
  local BGREEN="\[$BGREEN\]"
  local BYELLOW="\[$BYELLOW\]"
  local BBLUE="\[$BBLUE\]"
  local BPURPLE="\[$BPURPLE\]"
  local BCYAN="\[$BCYAN\]"
  local BWHITE="\[$BWHITE\]"
  local HBLACK="\[$HBLACK\]"
  local HRED="\[$HRED\]"
  local HGREEN="\[$HGREEN\]"
  local HYELLOW="\[$HYELLOW\]"
  local HBLUE="\[$HBLUE\]"
  local HPURPLE="\[$HPURPLE\]"
  local HCYAN="\[$HCYAN\]"
  local HWHITE="\[$HWHITE\]"
  local NC="\[$NC\]"

  # history
  local PS1_HIST="${BBLACK}[${BWHITE}\!${BBLACK}]"

  # time
  #local PS1_TIME="${WHITE}$(date "+%d-%b-%Y") ${BBLACK}<${WHITE}$(date "+%H:%M:%S")${BBLACK}>"

  # load hackkkkk
  local PS1_LOADAVG=($(cat /proc/loadavg))
  local PS1_STAT_C="$(($(mpstat | grep %idle | sed 's/%idle.*//' | wc -c)-1))"
  local PS1_LOAD_RAW=($(mpstat | grep %idle -A1 | tail -1 | sed $(echo 's/.\{'$PS1_STAT_C'\}//')))
  #local PS1_LOAD_RAW=($(mpstat | grep %idle -A1 | tail -1 | sed "s/.{${PS1_STAT_C}}//" | xargs))
  local PS1_LOAD="${GREEN}$(echo ${PS1_LOAD_RAW[0]} | awk '{print 100-$1}')${BBLACK}% ${GREEN}${PS1_LOADAVG[0]}${BBLACK}l"

  # jobs
  local JOBS_C=$(jobs | wc -l)
  if [ ${JOBS_C} == 0 ]
  then local JOBS="${BLUE}${JOBS_C}"
  else local JOBS="${YELLOW}${JOBS_C}"
  fi
  local VIM_C=$(/bin/ps aux | egrep "(^$USER | root)" | grep vim | grep -v 'grep' | wc -l)
  if [ ${VIM_C} == 0 ]
  then local VIMS="${BLUE}${VIM_C}"
  else local VIMS="${YELLOW}${VIM_C}"
  fi
  #local PS1_JOBS="${PURPLE}jobs${WHITE}:${JOBS}${PURPLE} vims${WHITE}:${VIMS}"
  local PS1_JOBS="${JOBS}${BBLACK}j ${VIMS}${BBLACK}v"

  # last command return
  if [ $LAST_CMD == 0 ] ; then
    local PS1_RTN=""
  else
    local PS1_RTN=" ${RED}${LAST_CMD} "
  fi
  #local PS1_RTN="${PURPLE}rtn${WHITE}:${PS1_RTN_COL}${LAST_CMD}"

  # who am i
  local PS1_WHOAMI="${BBLACK}[${WHITE}${USER}${WHITE}${BBLACK}@${WHITE}${HOSTNAME%%.*}${BBLACK}]"

  # pwd
  #local L_PWD=$(pwd -P)
  local L_PWD=$(pwd)
  if [ ${#L_PWD} -le 32 ]
  then local PS1_PWD="${BBLUE}${L_PWD}/"
  else local PS1_PWD="${BBLUE}..$(echo -e $L_PWD | egrep -o '.{0,32}$')/"
  fi

  # symbol
  if [ $LAST_CMD == 0 ]
  then PS1_RTN_COL2=${BBLUE}
  else PS1_RTN_COL2=${BRED}
  fi
  local PS1_SYB="${PS1_RTN_COL2}>"

  # prompt strings
  if [ $SIMPLEPS -eq 0 ] ; then
  export PS1="\
${BLACK}_______________________________________________________________________________${NC}
${PS1_HIST} ${PS1_WHOAMI}  ${PS1_LOAD}  ${PS1_JOBS}${NC}
${PS1_PWD}${PS1_RTN}${PS1_SYB}${NC} " # _PS1_
  else
  export PS1="[\u@\h \w] \$ " # _PS1_
  fi
  export PS2="${PS1_RTN_COL2}...${NC} " # continuation
  export PS3="${PS1_RTN_COL2}?${NC} " # select case
  export PS4="${PS1_RTN_COL2}+${NC} " # set prefix tracing
}

# remote login (ssh), remember tab-complete after '@': $ rl @somehost
function rl() {
  echo -e "${CMDCOL}ssh -Y ${NAME}$1${NC}"
  ssh -Y ${NAME}$1
}

# server-to-pc file transfer: $ s_pc @apt2 file_from file_to
function s_pc() {
  if [ $# -eq 3 ] ; then
    echo -e "${CMDCOL}scp ${NAME}$1:$2 $3${NC}"
    scp ${NAME}$1:$2 $3
  else
    echo -e "${CMDCOL}s_pc: Use 3 arguments: s_pc @server filelocation localdest${NC}"
  fi
}

# make F^@#1%& tar safer because it's so stupid
function tar_func() { 
  echo -e "${CMDCOL}\$ tar $@${NC}"
  echo -e "${CMDCOL}tar: verify package $2 [Enter/^C]?${NC}"
  read -n 1 -s
  /bin/tar $@
}

# tar/gzip a folder then remove it
function tard() { 
  local FILEIN=${1%/}
  echo -e "${CMDCOL}tard: tar.gzipping $FIELIN then removing directory...${NC}"
  tarc $FILEIN.tgz $FILEIN && /bin/rm -rf $FILEIN && echo "tard: removed $FILEIN, complete."
}

# what is some command, can't run in subprocess
function whats() {
  echo -e "${CMDCOL}alias:${NC}"
  alias "$1"
  echo
  echo -e "${CMDCOL}type -a:${NC}" 
  type -a "$1"
  echo
  echo -e "${CMDCOL}which:${NC}" 
  local FILERSLT=$(file $(which $1 | tail -1 | tr -d '\n') 2> /dev/null)
  which "$1" && echo && echo -e "${CMDCOL}file \$(which):${NC}" && echo -e "$FILERSLT"
  if [ $(echo -en "$FILERSLT" | grep -ic executable) -le 1 ] ; then
    if [ $(echo -en "$FILERSLT" | grep -ic text) -ge 1 ] ; then
      echo && echo -e "${CMDCOL}head \$(which):${NC}" && head $(which $1 | tail -1 | tr -d '\n') 2> /dev/null
    fi
  fi
  echo 
  echo -e "${CMDCOL}whatis:${NC}" 
  whatis "$1"
  echo
  echo -e "${CMDCOL}apropos | head:${NC}" 
  apropos "$1" | head 2> /dev/null
}

# wiki a word or phrase in quotes
function wiki() {
  echo $(dig +short txt "$(echo $@)".wp.dg.cx)
}

function error() {
  >&2 echo -en ">> $FILENAME: ERROR: $@!\n"
}

function print() {
  echo -en ">> $FILENAME: $@.\n"
}

### startup actions ###
case "$-" in
  *i*) # only in interactive mode
    source ~/bin/setcolors &> $NUL # _TODO_
    pushd ~ &> $NUL
    ulimit unlimited
    ulimit -c unlimited
    me # print welcome
    ;;
  *)
    ;;
esac

case $TERM in
  xterm|xterm-256color|xterm-color|gnome-terminal|screen|Eterm)
    # xterm escape seq "ESC]0;...BELL" sets icon name and title
    if [ "$COLORTERM" == "gnome-terminal" ] ; then
      export TERM=xterm-256color
    elif [ -n "$local256" ] || [ -n "$SEND_256_COLORS_TO_REMOTE" ]; then
      export TERM=xterm-256color
    fi
    export PROMPT_COMMAND='\
create_ps;\
echo -ne "\033]0;${USER} @ ${HOSTNAME}\007";'
    ;;
  cygwin)
    # start xming
    cygstart.exe /cygdrive/c/Program\ Files\ \(x86\)/Xming/Xming.exe :0 -clipboard -multiwindow
    export DISPLAY=localhost:0
    export PROMPT_COMMAND='\
create_ps;\
echo -ne "\033]0;${USER} @ ${HOSTNAME}\007";'
    ;;
  *)
    ;;
esac

### source custom definitions ###
if [ -f ~/.bashrc_custom ]; then
  source ~/.bashrc_custom
fi