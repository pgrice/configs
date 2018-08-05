export SVN_EDITOR=/usr/bin/vim.gtk
set -o vi

#BNR Aliases
function bnr_grep { grep ${2--ir} --color "$1" ~/bnr_robot_software/src/ --exclude-dir="bnr_locations" $*; }

# Linting helper functions
function cf {
    clang-format-3.9 -style=file "$1" > /tmp/clang-format-"$1"
    vimdiff "$1" /tmp/clang-format-"$1"
    rm /tmp/clang-format-"$1"
    }

alias pylint="echo 'pylint --rcfile=$BNR_ROOT/src/bnr_autonomy/pylintrc' && 
              pylint --rcfile='$BNR_ROOT/src/bnr_autonomy/pylintrc'"

# General Aliases
alias v='vim'
alias l='ls'
alias ls='ls -FGk --color=always'
alias la='ls -lAsh'
alias rm='rm -r'
alias mv='mv -i'
alias cp='cp -ir'
alias p='cd ../'
alias pp='cd ../../'
alias ppp='cd ../../../'
alias du='echo "du -hc --max-depth=1" && du -hc --max-depth=1' # A sensible disk-usage for current directory
alias rmpyc='rm -vf *.pyc; rm -vf `find . -name *.pyc`'  # remove the pesky .pycs
alias rmsvn='sudo find . -name ".svn" -exec rm -rf {} \;'
alias open='gnome-open'

# Git Aliases
alias gco='echo "git checkout:" && git checkout'
alias gf='echo "git fetch" && git fetch'
alias gm='echo "git merge" && git merge'
alias gl='echo "git log" && git log'
alias grb='echo "git rebase -i --autosquash" && git rebase -i --autosquash'

# Ros Aliases
source /opt/ros/indigo/share/rosbash/rosbash
alias rt='echo "rostopic: " && rostopic'
alias rtl='echo "rostopic list:" && rostopic list'
alias rtll='echo "rostopic list|less:" && rostopic list | less'
alias rtlg='echo "rostopic list | grep" && rostopic list | grep'
alias rte='echo "rostopic echo: " && rostopic echo'
alias rte1='echo "rostopic echo -n 1: " && rostopic echo -n 1'
alias rti='echo "rostopic info: " && rostopic info'
alias rn='echo "rosnode: " && rosnode'
alias rnl='echo "rosnode list: " && rosnode list'
alias rnlg='echo "rosnode list | grep: " && rosnode list | grep'
alias rni='echo "rosnode info: " && rosnode info'
alias rms='echo "rosmsg show: " && rosmsg show'
alias rviz='echo "rosrun rviz rviz " && rosrun rviz rviz'

complete -F "_roscomplete_rostopic" "rt"
complete -F "_roscomplete_rosnode" "rn"

function imv () { echo "rosrun image_view image_view image:=$1" && rosrun image_view image_view image:=$1; }
function imvt () { echo "rosrun image_view image_view image:=$1 _image_transport:=theora" && rosrun image_view image_view image:=$1 _image_transport:=theora; }

