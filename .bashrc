# .bashrc
# Bourne Again SHell Run Command.
# 
#   Copyright (c) 2009-2016, Matt Busby @MrMattBusby.
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

### if not running interactively, don't do anything ###
[ -z "$PS1" ] && return

### source global definitions ###
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi
if [ -f ~/.bashrc_custom ]; then
  . ~/.bashrc_custom
fi

######################
### shell settings ###
######################

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
export HISTCONTROL=ignoreboth # don't add cmds w/ '^ ' to history, also ignores dupes
export HISTFILESIZE=5000
export HISTSIZE=5000
export HOSTS=/etc/hosts
export NUL=/dev/null
export PYTHONIOENCODING=utf_8
export SERR=/dev/stderr
export SIMPLEPS=$FALSE
export SIN=/dev/stdin
export SOUT=/dev/stdout

##########################
### !!! OVERWRITES !!! ###
##########################

### modify defaults ###
alias chgrp='chgrp --preserve-root' # perms
alias chmod='chmod --preserve-root' # perms
alias chown='chown --preserve-root' # perms
alias echo='echo -e' # interpret backslash
alias egrep='egrep --color=auto'
alias grep='grep --color=auto'
alias info='info --vi-keys'
alias less='less -R'  # decode colors
alias ls='ls --color=auto' # better with colors
alias mkdir='mkdir -pv' # create parents
alias ssh='ssh -Y' # FW X

### for safety ###
alias cp='cp -i'
alias ln='ln -i'
alias mf='mv -iv' # typo, haven't ever used mf
alias mv='mv -iv'
alias rm='rm -i'
alias tar='tar_func'

### force ###
alias CP='/usr/bin/cp -rf'
alias MV='/usr/bin/mv -vf'
alias RM='/usr/bin/rm -rf'

### customize (revert using `$\<command>`) ###
alias cd='cd_func' # search subs
alias ci='vi' # because typo
alias cim='vim' # because typo
alias df='df -kTh' # more readable
alias du='du -h --max-depth 1' # display 1-level, summarize folders
alias free='free -tm' # totals
alias gc='git commit' # never used gc
alias gs='git status' # never used ghostscript
alias iostat='iostat -xhm' # more info
alias ipq='ipython qtconsole &'
alias ipy='ipython'
alias ipy3='ipython3'
alias lsblk='lsblk -o NAME,OWNER,GROUP,RM,RO,TYPE,SIZE,MODEL,MOUNTPOINT'
alias ping='ping -i.5 -c6 -W1' # send 6 packets, no need ^C
alias top='htop 2> $NUL || /usr/bin/top' # htop not always exist

#############
### typos ###
#############

alias cd..="cd .."
alias cd...="cd ../.."
alias cls='clear'
alias dir='la'
alias dc='cd'
alias ipconfig='/sbin/ifconfig'
alias iv='vi'
alias vmi='vim'
alias L='less'
alias Less='less'
alias LEss='less'
alias mc='mv'

#############################
### shortcuts/convenience ###
#############################

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
alias cd-="cd -"
alias chx='chmod +x'
alias cl-='cl -;'
alias cpu='lscpu || cat /proc/cpuinfo'
alias diffd='diff -r --brief' # diff directories
alias hist='history | tail -15'
alias hl='grep -E --color=auto -e ^ -e' # highlight + preserve other output
alias la='ls --color=auto -Ahlpq1' # list all files
alias ld='ls --color=auto -d .*/ */ 2>/dev/null' # list directories only, simple
alias lt='ls --color=auto -hlpq1t' # list all non .* files, by time
alias l.='ls --color=auto -d .* 2>/dev/null' # list all .* files
alias man2='man 2'
alias man3='man 3'
alias man4='man 4'
alias mem='cat /proc/meminfo'
alias ns='sudo netstat -pa --inet' # !!SUDO!!
alias path='echo -e ${PATH//:/\\n}' # easily display path
alias ports='sudo netstat -tulanp' # open ports # !!SUDO!!
alias psa='ps auxf' # verbose
alias psg='ps auxf|head -1;ps auxf|egrep --color=always -B4 -i' # ps-grep
alias psme="/bin/ps -F | head -1 && /bin/ps -aF --user $USER | hl $USER"
alias pts='echo "pts: you are $(tty)" | egrep /.\* && echo && ps | head -1 && ps auxfh | grep pts/[[:digit:]]'
alias py='python -q 2> $NUL || python'
alias py2='python2'
alias py3='python3 -q || $(\which python3|head -1) -q'
alias tarc='tar -czvpf' # tar aliased to tar_func() for safety
alias tart='\tar -tzvpf'
alias tarx='\tar -xzvpf'
alias topcpu='ps | head -1 && /bin/ps auxfh | sort -nr -k 3 | head'
alias topmem='ps | head -1 && /bin/ps auxfh | sort -nr -k 4 | head'
alias topme='ps | head -1 && ps auxfh | egrep $USER | sort -nr -k 3 | head | grep $USER'
alias treed='tree -dL 4' # dir only 3 deep
alias trees='tree -hpL 3' # files 2 deep
alias v='vim'

#############
### devel ###
#############

### git ###
alias gd='git diff'
#alias gc= # See OVERWRITES
#alias gs= # See OVERWRITES

### make ###
alias m='make'
alias mcm='make clean && make'

### svn ###
function sd() {
  if command -v colordiff &>/dev/null ; then svn diff "$@" | colordiff | less -R ; else svn diff "$@" | less ; fi
}
function sl() {
  svn log -v "$@" | less
}
alias st='svn st | /bin/grep -v ^?'
alias svn_count='svn log -q | grep "|" | awk "{print \$3}" | sort | uniq -c | sort -nr'
alias up='svn up'

#################################
### edit startup/misc scripts ###
#################################

alias vib='vim ~/.bashrc'
alias vig='sudo vim /etc/group' # !!SUDO!!
alias vih='sudo vim /etc/hosts' # !!SUDO!!
alias vii='vim ~/.ipython/ipythonrc.py'
alias vik='vim ~/.ssh/known_hosts'
alias vip='vim ~/.pythonrc.py'
alias visudo='sudo vim /etc/sudoers' # !!SUDO!!
alias viv='vim ~/.vimrc'

############################
### function definitions ###
############################

# cd to first subdir matching $1 if not found (can't run in subprocess)
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

# change location then ls (can't run in subprocess)
function cl() {
  cd $* 1>/dev/null && ls -pq
}

# (l)ist (c)ontents of file/dir/misc types and total size in the current
function lc() {
  if [ $# -eq 0 ] ; then
    pushd . 1> /dev/null
  else
    pushd $@ 1> /dev/null
  fi
  DIR=$(pwd -P $@)
  echo -e "${CMDCOL}>>> Listing contents of \"$DIR\" (ignoring items with permissions):${NC}"
  echo
  echo -e "${CMDCOL}All   :${NC} $(find . -maxdepth 1 -regex '\.\/.*' 2>/dev/null|wc -l) ($(find . -maxdepth 1 \
    -regex '\.\/\..*' 2>/dev/null|wc -l) hidden)"
  echo -e "${CMDCOL}Dirs  :${NC} $(find . -maxdepth 1 -type d -regex '\.\/.*' 2>/dev/null|wc -l) ($(find . -maxdepth 1 \
    -type d -regex '\.\/\..*' 2>/dev/null|wc -l) hidden)"
  echo -e "${CMDCOL}Files :${NC} $(find . -maxdepth 1 -type f -regex '\.\/.*' 2>/dev/null|wc -l) ($(find . -maxdepth 1 \
    -type f -regex '\.\/\..*' 2>/dev/null|wc -l) hidden, \
  $(ls -1 *.{tgz,tar,a,ar,rpm,iso,bz,bz2,lz,gz,gzip,tar.gzip,rz,7z,s7z,cab,rar,tar.bz2,tar.gz,zz,zip} 2>/dev/null|\
  sort -u|wc -l) archived)"
  echo -e "${CMDCOL}Links :${NC} $(find . -maxdepth 1 -type l -regex '\.\/.*' 2>/dev/null|wc -l) ($(find . -maxdepth 1 \
    -type l -regex '\.\/\..*' 2>/dev/null|wc -l) hidden)"
  echo -e "${CMDCOL}Size  :${NC} $(ls -Agh1 2>/dev/null|head -1|sed 's|total ||') ($(du -h 2>/dev/null|tail -1|\
    sed 's|\s*\.\s*$||') including sub-directories)"
  echo
  ls --color=auto -Apq
  popd 1> /dev/null
}

# Make a directory and navigate to it
function mkgo() {
  if [ $# -eq 1 ] ; then
    echo -e "${CMDCOL}mkdir -pv $1 && cd $1${NC}"
    mkdir -pv $1 && pushd $1
  else
    echo -e "${CMDCOL}mkgo: Use only 1 argument!${NC}"
  fi
}

# Launch IPython notebook
function notebook() {
  pushd ~/notebooks
  ipython notebook
}

# Name the terminal
function termname() {
  export PROMPT_COMMAND='\
export PREV_STATUS="$?";\
export PREV_COMMAND="$(history|tail -1|sed s/.......//|sed s/\\\\//g)";\
create_ps "$PREV_STATUS";\
echo -ne "\033]0;'"$@"'\007";'
}

# ps1 function called from PROMPT_COMMAND, changes based on several vars
function create_ps() {
  # last command
  local LAST_CMD="$@"

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
  local L_PWD=$(pwd -P)
  #local L_PWD=$(pwd)
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

# make F^@#1%& tar safer because it's so stupid
function tar_func() { 
  echo -e "${CMDCOL}\$ tar $@${NC}"
  echo -e "${CMDCOL}tar: verify package $2 [Enter/^C]?${NC}"
  read -n 1 -s
  /bin/tar "$@"
}

# tar/gzip a folder then remove it
function tard() { 
  local FILEIN=${1%/}
  echo -e "${CMDCOL}tard: tar.gzipping $FIELIN then removing directory...${NC}"
  tarc $FILEIN.tgz $FILEIN && /bin/rm -rf $FILEIN && echo "tard: removed $FILEIN, complete."
}

# what is X? (can't run in subprocess), if not file/command try locate/apropos before failing
function whats() {
  local ANY=0
  local RESULT=
  local OUTPUT=
  local COMMAND=
  local WCL=
  local COMMANDS=(
  'command -v'
  'readlink -e'
  'alias'
  'type -a'
  'which -a'
  'whatis'
  'file -b'
  'stat'
  'la'
  'lsattr'
  'du -h'
  'head -2'
  'wc'
  'sum'
  'md5sum'
  'man -w'
  'info -w'
  )
  # note: removed file -Eb b/c DNE in old distros
  for each in "${COMMANDS[@]}" ; do
    COMMAND="$each"
    each+=' "$1" 2>/dev/null'
    OUTPUT=$(eval "$each")
    RESULT=$?
    WCL=$(echo "$OUTPUT"|wc -l)
    if [ $RESULT == 0 ] ; then
      ((ANY++))
      echo
      echo -e "${CMDCOL}${COMMAND}:${NC}"
      if [ "$WCL" -le 30 ] ; then
        echo "$OUTPUT"
      else
        echo "$OUTPUT" | head -20
        echo "..."
      fi
    fi
  done
  if [ $ANY -eq 0 ] ; then
    OUTPUT=$(locate "$1" 2>/dev/null)
    RESULT=$?
    WCL=$(echo "$OUTPUT"|wc -l)
    if [ $RESULT == 0 ] ; then
      ((ANY++))
      echo
      echo -e "${CMDCOL}locate:${NC}"
      if [ "$WCL" -le 30 ] ; then
        echo "$OUTPUT"
      else
        echo "$OUTPUT" | head -20
        echo "..."
      fi
    fi
    OUTPUT=$(apropos "$1" 2>/dev/null)
    RESULT=$?
    WCL=$(echo "$OUTPUT"|wc -l)
    if [ $RESULT == 0 ] ; then
      ((ANY++))
      echo
      echo -e "${CMDCOL}apropos:${NC}"
      if [ "$WCL" -le 30 ] ; then
        echo "$OUTPUT"
      else
        echo "$OUTPUT" | head -20
        echo "..."
      fi
    fi
  fi
  if [ $ANY -eq 0 ] ; then
    >&2 echo "whats: cannot find '$1'!"
    return 1
  fi
}

#######################
### startup actions ###
#######################

# Term overrides
case $TERM in
  xterm|xterm-256color|xterm-color|gnome-terminal|screen|Eterm)
    # xterm escape seq "ESC]0;...BELL" sets icon name and title
    if [ "$COLORTERM" == "gnome-terminal" ] ; then
      export TERM=xterm-256color
    elif [ -n "$local256" ] || [ -n "$SEND_256_COLORS_TO_REMOTE" ]; then
      export TERM=xterm-256color
    fi
    ;;
  cygwin)
    # start xming
    cygstart.exe /cygdrive/c/Program\ Files\ \(x86\)/Xming/Xming.exe :0 -clipboard -multiwindow
    export DISPLAY=localhost:0
    ;;
  *)
    ;;
esac

# Set PS and Terminal text
export PROMPT_COMMAND='\
export PREV_STATUS="$?";\
export PREV_COMMAND="$(history|tail -1|sed s/.......//|sed s/\\\\//g)";\
create_ps "$PREV_STATUS";\
echo -ne "\033]0;[$(tty|egrep -o [[:digit:]])] ${USER}@${HOSTNAME%%.*}> ${PREV_COMMAND}\007";'

case "$-" in
  *i*) # only in interactive mode (don't want to write to stdout non-interactively like scp)
    source ~/bin/setcolors &> $NUL
    pushd ~ &> $NUL
    ulimit unlimited
    ulimit -c unlimited
    #command -v me >/dev/null 2>&1 && me
    me 2> /dev/null
    ;;
  *)
    ;;
esac

