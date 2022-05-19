export SVN_EDITOR=/usr/bin/vim.gtk
set -o vi

# Linting helper functions
function cf {
    clang-format-3.9 -style=file "$1" > /tmp/clang-format-"$1"
    vimdiff "$1" /tmp/clang-format-"$1"
    rm /tmp/clang-format-"$1"
    }

function cf80 {
    clang-format-3.9 -style='{Language: Cpp, BasedOnStyle: Google, ColumnLimit: 80}' "$1" > /tmp/clang-format-"$1"
    vimdiff "$1" /tmp/clang-format-"$1"
    rm /tmp/clang-format-"$1"
    }

function cf120 {
    clang-format-3.9 -style='{Language: Cpp, BasedOnStyle: Google, ColumnLimit: 120}' "$1" > /tmp/clang-format-"$1"
    vimdiff "$1" /tmp/clang-format-"$1"
    rm /tmp/clang-format-"$1"
    }

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

# Bash prompt (PS1) configuration
GIT_PROMPT_ONLY_IN_REPO=0
GIT_PROMPT_THEME_FILE=~/git/pgrice_configs/bash/git-prompt-colors.sh
GIT_PROMPT_THEME=Custom
source ~/git/bash-git-prompt/gitprompt.sh

# Git Aliases
#source ~/git/git-completion.bash
alias g='git'
alias gch='echo "git checkout:" && git checkout'
alias gco='echo "git commit:" && git commit'
alias gf='echo "git fetch" && git fetch'
alias gm='echo "git merge" && git merge'
alias gl='echo "git log" && git log'
alias grb='echo "git rebase -i --autosquash" && git rebase -i --autosquash'
function worktree {
    BRANCH=$1
    WT_PATH=~/trees/$BRANCH
    git worktree add $WT_PATH -b $BRANCH
    cd $WT_PATH
    echo "export BREWST_HOME=$WT_PATH" > $WT_PATH/.envrc
    direnv allow .
}

# Ros Aliases
#source /opt/ros/$ROS_DISTRO/share/rosbash/rosbash
#alias rt='echo "rostopic: " && rostopic'
#alias rtl='echo "rostopic list:" && rostopic list'
#alias rtll='echo "rostopic list|less:" && rostopic list | less'
#alias rtlg='echo "rostopic list | grep" && rostopic list | grep'
#alias rte='echo "rostopic echo: " && rostopic echo'
#alias rte1='echo "rostopic echo -n 1: " && rostopic echo -n 1'
#alias rti='echo "rostopic info: " && rostopic info'
#alias rn='echo "rosnode: " && rosnode'
#alias rnl='echo "rosnode list: " && rosnode list'
#alias rnlg='echo "rosnode list | grep: " && rosnode list | grep'
#alias rni='echo "rosnode info: " && rosnode info'
#alias rms='echo "rosmsg show: " && rosmsg show'
#alias rviz='echo "rosrun rviz rviz " && rosrun rviz rviz'

#complete -F "_roscomplete_rostopic" "rt"
#complete -F "_roscomplete_rosnode" "rn"
#
#function imv () { echo "rosrun image_view image_view image:=$1" && rosrun image_view image_view image:=$1; }
#function imvt () { echo "rosrun image_view image_view image:=$1 _image_transport:=theora" && rosrun image_view image_view image:=$1 _image_transport:=theora; }

