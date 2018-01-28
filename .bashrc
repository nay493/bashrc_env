
export http_proxy="http://proxy:80"
export https_proxy="https://proxy:80"
export ftp_proxy="ftp://proxy:80"
export GIT_PROXY_COMMAND="/home/murrahma/git_proxy"
export no_proxy="author.xilinx.com"
export NO_PROXY=$no_proxy

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

alias teef='tee 2>&1 file'
alias both='2>&1'



# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u:\W\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Added by nay@

# Enable tab completion
#source ~/git-completion.bash

# colors!
green="\[\033[0;32m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
reset="\[\033[0m\]"

# Change command prompt
#source ~/git-prompt.sh
#export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
##export PS1="$purple\u$green\$(__git_ps1)$blue \W $ $reset"

#alias subl="/home/nayeem/Videos/Sublime\ Text\ 2/subl"

#nay@
function cdn(){ for i in `seq $1`; do cd ..; done;}

#source /scratch/murrahma/my_work/learn/bookmarks/env_setup.sh
#alias folder_mod='find $1 -type d -print0 | xargs -0 stat --format '%Y :%y %n' | sort -nr | cut -d: -f2- '

alias pc='mkdir ./my_logs; petalinux-config | tee ./my_logs/petalinux-config.log 2>&1'
#alias pb='mkdir ./my_logs; date && petalinux-build && date | tee -a ./my_logs/petalinux-build.log 2>&1'
#alias pb='mkdir ./my_logs; date > ./my_logs/petalinux-build.log 2>&1 && petalinux-build >> ./my_logs/petalinux-build.log 2>&1 && date >> ./my_logs/petalinux-build.log 2>&1'
alias pcv='mkdir ./my_logs; petalinux-config --verbose | tee ./my_logs/petalinux-config_verb.log 2>&1'
alias pbv='mkdir ./my_logs; petalinux-build --verbose | tee ./my_logs/petalinux-build_verb.log 2>&1'

alias gits='git status'
alias gita='git add'
alias gitc='git commit -s -m'
#alias gitf='git format-patch -M -1 --subject-prefix="PLNX_SKLTN_DIST][PATCH"'
#alias gitf_cover='git format-patch -M  --subject-prefix="PLNX_SKLTN_DIST][PATCH" --cover'

pbt(){
case $1 in 
normal) mkdir ./my_logs;date | tee ./my_logs/build.log; petalinux-build | tee -a ./my_logs/build.log;date | tee -a ./my_logs/build.log; ;;

verbose) mkdir ./my_logs;date | tee ./my_logs/build_verb.log; petalinux-build | tee -a ./my_logs/build_verb.log;date | tee -a ./my_logs/build_verb.log; ;;

*|-h|--help) echo "pbt normal| pbt verbose";;
esac

}



pvc(){
echo "Note : In commit msg write the FILE_NAME :"
echo "0. cover letter 1. CR: BRANCH: 2. detailed info 3. changes in v2"
echo "1. subject prefix 2. PATCH version 3. file in which edited 4. commit message"
echo "5. detailed explanation"
echo "6. Time-stamps of patches created"

}

subj_prfx(){
subject_prefix=("EMBEDDEDSW PATCH" "ATF PATCH" "UBOOT PATCH" "LINUX PATCH" "PLNX_SKLT_DIST" "INT_SKLT" "PLNX_REF_DSGN" "PLNX_BSP_OVERLAY" "VCU-MODULES" "VCU-CTRL-SW" "VCU-OMX-IL" "PLNX_PLGX_DEVTOOLS" "INT_PLGX_DEVTOOLS")
echo ""
echo "Subject prefix can be: "
echo "${subject_prefix[*]}"
echo "][PATCH"
echo ""
echo "\"PLNX_SKLT_DIST][PATCH v\""
echo ""

echo "For patch verification check-list give command : pvc"

}

gitformat(){
case $1 in

normal) git format-patch -M -1 --subject-prefix="${2}" -o ${4}; ;;

cover) git format-patch -M -${3} --subject-prefix="${2}" --cover -o ${4}; ;;

*|-h|--help) echo "gitformat <cover|normal> <subject_prefix> <no of patches> <path_for_patches_to_get_stored>";
             subj_prfx ;;

esac

}



#systest board boot aliases
alias systest_init='/proj/systest/bin/systest'
alias systest_powertoggle='power 0; power 1'
alias systest_serial='hw_server; serial baud=115200; connect serial'
alias bootkernelonhw='petalinux-boot --jtag --kernel --hw_server-url'
alias bootprebuiltonhw='petalinux-boot --jtag --prebuilt 3 --hw_server-url'

#know linux distribution

alias know_linux_distro='cat /etc/*-release'

alias lib_deps='ldd'

alias source_xsdk='source /proj/xbuilds/2017.1_daily_latest/installs/lin64/SDK/2017.1/settings64.sh'
alias SYSTEST='/proj/systest/bin/systest'
alias shared_fldr='/proj/xhdsswstaff/murrahma/'

#if [ -f build/conf/bblayers.conf ]; then
alias tool_used='cat build/conf/bblayers.conf | grep "SDKBASEMETAPATH ="'


#source bitbake

bb_env_path1=$(tool_used | awk -F "= " '{print $2}' | sed -e 's/^"//g' -e 's/"$//g')
bb_env_path=${bb_env_path1}/layers/core/oe-init-build-env
alias source_bb='source $bb_env_path'

#source petalinux environment
pl_env_path=$(tool_used | awk -F "= " '{print $2}' | sed -e 's/^"//g' -e 's/"$//g' | awk -F "components" '{print $1}')
pl_env_path=${pl_env_path}settings.sh
alias source_pl='source $pl_env_path'


YOCTO_DETAILS_PATH=$(tool_used | awk -F "= " '{print $2}' | sed -e 's/^"//g' -e 's/"$//g')
YOCTO_DETAILS_PATH=${YOCTO_DETAILS_PATH}/layers/core/meta-poky/conf/distro/poky.conf
alias yocto_version='cat ${YOCTO_DETAILS_PATH} | grep "DISTRO_NAME\|DISTRO_CODENAME\|DISTRO_VERSION"'
#fi
alias proj_arch='cat project-spec/meta-plnx-generated/conf/machine/plnx_*.conf  | grep UBOOT_MACHINE'

alias find_commands='firefox https://www.tecmint.com/35-practical-examples-of-linux-find-command/'
alias win_dir='cd /proj/xhdsswstaff/murrahma/tmp'

alias my_build='cd /scratch/murrahma/my_builds/0701/xilinx-zc702-2017.3/'
alias liv_tool='cd /scratch/murrahma/my_work/liv_tool/skltn_dist/'


tmuX() {

case $1 in 

*|-h|--help) 
	echo -e "tmuX <-h|--help> <about|commands> \n"
	case $2 in
	about) 
	echo -e "tmux = Terminal multiplexer\n"
	echo -e "Adv:	can attach a remote session; deattach and the after time reattach to see command given at attch still runs=\n"
	echo -e "Adv:	can share sessions\n"
	echo -e "Installation :: sudo apt-get install tmux \n"
	echo -e "start tmux :: \$ tmux \n"

	;;
	commands)
        echo -e "----------- tmuX help guide -----------\n"
        echo -e "       ^ + B -- for any tmux command\n\t^ + B + : -- for splitting window"
        echo -e "       ^ + B + c -- create new window\n\t^ + B + , -- change name of window"
        echo -e "       ^ + B + p -- goto prev window\n\t^ + B + n -- go to next window"
        echo -e "       ^ + B + & -- kill window\n\t^ + B + %/\" -- split window vertical/horizontal"
	;;
	
	esac
esac
}


sendMail() {

case $1 in 

all) git send-email --to VINEETHC@xilinx.com --cc murrahma@xilinx.com --to git-dev@xilinx.com "$2" ; ;;

 VN) git send-email --to VINEETHC@xilinx.com  --to murrahma@xilinx.com "$2" ; ;;

 N) git send-email --to murrahma@xilinx.com "$2" ; ;;
 
 plnx_team) git send-email --to plnx_team@xilinx.com --to murrahma@xilinx.com "$2" ; ;;
 
 ssw_all) git send-email --to ssw_all@xilinx.com --to murrahma@xilinx.com "$2" ; ;;

*|-h|--help) echo "sendMail <N/VN/all/plnx_team|ssw_all> <patch>"; echo "Use command to send series of patches at once : sendall" ;;

esac


}

sendallpatches(){

case $1 in
N)
 target="${2}"
  for f in "$target"/*
  do
    sendMail N  ${f}
  done;;
VN)
 target="${2}"
  for f in "$target"/*
  do
    sendMail VN  ${f}
  done;;
plnx_team)
 target="${2}"
  for f in "$target"/*
  do
    sendMail plnx_team  ${f}
  done;;
git_dev)
 target="${2}"
  for f in "$target"/*
  do
    sendMail all  ${f}
  done;;
ssw_all)
       target="${2}"
  for f in "$target"/*
     do
       sendMail ssw_all  ${f}
  done;;       

*|-h|--help)
echo "sendallpatches N|VN|plnx_team|git_dev|ssw_all <directory containing patches>";;
esac


}

pp() {

case $1 in

--boot) petalinux-package --boot  --fsbl images/linux/zynqmp_fsbl.elf --fpga images/linux/download.bit --atf images/linux/bl31.elf --pmufw images/linux/pmufw.elf --u-boot images/linux/u-boot.elf "$2" ; ;;

*|-h|--help) echo "pp --boot --force(optional)" ;;
esac


}


CD() {

case $1 in 
liv_tool) cd /scratch/murrahma/my_work/liv_tool/skltn_dist/ ;;
pl_tool) cd /scratch/murrahma/my_work/pl_tool_all/pl_tool/skeleton_dist/ ;;
build) cd /scratch/murrahma/my_builds/0701/ ;;

*|-h|--help) echo "CD <liv_tool|pl_tool|build>" ;;
esac
}


#alias SM_all='sendMail all'
#alias SM_VN='sendMail VN'
#alias SM_N='sendMail N'



alias urd='/scratch/sdb1/learn/urdu/urdu/urdu_automation/urdu_script.sh'



sudo date -s "$(wget -qSO- --max-redirect=0 google.com 2>&1 | grep Date: | cut -d' ' -f5-8)Z"

#xbindkeys &

export PATCH_DIR='/proj/xhdsswstaff/murrahma/my_work/patches'


src(){

case $1 in

17.1|17.2|17.3|17.4|18.1) echo "Executing ==>  source /proj/petalinux/petalinux-v20${1}_daily_latest/petalinux-v20${1}-final/settings.sh";;

*|-h|--help) echo "src <17.1|17.2|17.3|17.4|18.1)>" ;;

esac

}


crt(){

case $1 in

17.1|17.2|17.3|17.4|18.1) echo "petalinux-create -t project -s /proj/petalinux/petalinux-v20${1}_bsps_daily_latest/xilinx-zcu102-zu9-es2-rev1.0-v20${1}-final.bsp -n zcu102" ;;

*|-h|--help) echo "src <17.1|17.2|17.3|17.4|18.1)>" ;;
esac
}


paths(){

case $1 in

esdk)echo "esdk installers = /proj/petalinux/yocto/yocto_sdk_latest_2017.3/sdk-installers/";;

*|-h|--help)echo "paths <esdk>";;

esac



}


regress_builds(){
case $1 in

*|-h|--help)echo "  /build/ssw_regressions/ssw_regressions/2017.4/petalinux-regression/tcRepo/petalinux/projects/systest/build/ ";;

esac
}
mycommands="/proj/xhdsswstaff/murrahma/my_work/learn/bash/scripts/mycommands.sh"
tuts_path="/proj/xhdsswstaff/murrahma/my_work/learn/bash/scripts/tuts.sh"
myvars="/proj/xhdsswstaff/murrahma/my_work/learn/bash/scripts/myvars.sh"
. ${tuts_path}
. ${myvars}
. ${mycommands}
