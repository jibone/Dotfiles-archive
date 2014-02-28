if [[ $- == *i* ]] ; then
  export IS_INTERACTIVE=true
else
  export IS_INTERACTIVE=false
fi

if [[ -z $SSH_CONNECTION ]]; then
  export IS_REMOTE=false
else
  export IS_REMOTE=true
fi

# Colors ----------------------------------------------------------
export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1 

if [ "$OS" = "linux" ] ; then
  alias ls='ls --color=auto' # For linux, etc
  # ls colors, see: http://www.linux-sxs.org/housekeeping/lscolors.html
  export LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rb=90'  #LS_COLORS is not supported by the default ls command in OS-X
else
  alias ls='ls -G'  # OS-X SPECIFIC - the -G command in OS-X is for colors, in Linux it's no groups
fi

# Setup some colors to use later in interactive shell or scripts
export COLOR_NC='\033[0m' # No Color
export COLOR_WHITE='\033[1;37m'
export COLOR_BLACK='\033[0;30m'
export COLOR_BLUE='\033[0;34m'
export COLOR_LIGHT_BLUE='\033[1;34m'
export COLOR_GREEN='\033[0;32m'
export COLOR_LIGHT_GREEN='\033[1;32m'
export COLOR_CYAN='\033[0;36m'
export COLOR_LIGHT_CYAN='\033[1;36m'
export COLOR_RED='\033[0;31m'
export COLOR_LIGHT_RED='\033[1;31m'
export COLOR_PURPLE='\033[0;35m'
export COLOR_LIGHT_PURPLE='\033[1;35m'
export COLOR_BROWN='\033[0;33m'
export COLOR_YELLOW='\033[1;33m'
export COLOR_GRAY='\033[1;30m'
export COLOR_LIGHT_GRAY='\033[0;37m'
alias colorslist="set | egrep 'COLOR_\w*'"  # lists all the colors

# History ----------------------------------------------------------
export HISTCONTROL=ignoredups
#export HISTCONTROL=erasedups
export HISTFILESIZE=3000
export HISTIGNORE="ls:cd:[bf]g:exit:..:...:ll:lla"
alias h=history
hf(){ 
  grep "$@" ~/.bash_history
}

if [ $IS_INTERACTIVE = 'true' ] ; then # Interactive shell only

  # Input stuff -------------------------------------------------------
  bind "set completion-ignore-case on" # note: bind used instead of sticking these in .inputrc
  bind "set show-all-if-ambiguous On" # show list automatically, without double tab
  bind "set bell-style none" # no bell

  # Use vi command mode
  #bind "set editing-mode vi"
  #set -o vi
  #bind -m vi-command -r 'v'

  shopt -s checkwinsize # After each command, checks the windows size and changes lines and columns


  # Prompts ----------------------------------------------------------
  git_dirty_flag() {
    git status 2> /dev/null | grep -c : | awk '{if ($1 > 0) print "⚡"}'
  }

  prompt_func() {
      previous_return_value=$?;
      if [ $IS_REMOTE = 'true' ] ; then
        prompt="\n\[\033]0;${USER} ${PWD}\007\]\[${COLOR_PURPLE}\]\w \[${COLOR_GRAY}\]${USER}@${HOSTNAME%%.*}$(__git_ps1)\[${COLOR_NC}\]\n"
      else
        prompt="\n\[\033]0;${USER} ${PWD}\007\]\[${COLOR_GREEN}\]\w \[${COLOR_GRAY}\]${USER}@${HOSTNAME%%.*}$(__git_ps1)\[${COLOR_NC}\]\n"
      fi
      #prompt="\033]0;${PWD}\007\[${COLOR_GREEN}\]\w\[${COLOR_GRAY}\]$(__git_ps1)\[${COLOR_NC}\] "
      #prompt="\[${COLOR_GREEN}\]\w\[${COLOR_GRAY}\]$(__git_ps1)\[${COLOR_YELLOW}\]$(git_dirty_flag)\[${COLOR_NC}\] "

      if test $previous_return_value -eq 0
      then
          PS1="${prompt}> "
      else
          PS1="${prompt}\[${COLOR_RED}\]> \[${COLOR_NC}\]"
      fi
  }
  PROMPT_COMMAND=prompt_func

  parse_git_branch() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \[\1\]/'
  }
  
  git_prompt ()
  {
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
      return 0
    fi
    
    git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
    
    #if git diff --quiet 2>/dev/null >&2; then
    #  git_color="${c_git_clean}"
    #else
    #  git_color=${c_git_cleanit_dirty}
    #fi
    
    #echo " [$git_color$git_branch${c_reset}]"
    echo "bla"
  }
  
  test() {
    #if ! git rev-parse --git-dir > /dev/null 2>&1; then
    #  return 0
    #fi
    git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
    echo $(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  }

  export PS1="\[${COLOR_GREEN}\]\W\[${COLOR_NC}\] \[${COLOR_YELLOW}\]$(test)\e[0:33m\e[0:35m⌘ \e[m "  # Primary prompt with only a path
  # export PS1="\[${COLOR_RED}\]\w > \[${COLOR_NC}\]"  # Primary prompt with only a path, for root, need condition to use this for root
  # export PS1="\[${COLOR_GRAY}\]\u@\h \[${COLOR_GREEN}\]\w > \[${COLOR_NC}\]"  # Primary prompt with user, host, and path 
  # This runs before the prompt and sets the title of the xterm* window.  If you set the title in the prompt
  # weird wrapping errors occur on some systems, so this method is superior
  export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/} ${USER}@${HOSTNAME%%.*}"; echo -ne "\007"'  # user@host path

  #export PS2='> '    # Secondary prompt
  #export PS3='#? '   # Prompt 3
  #export PS4='+'     # Prompt 4

  function xtitle {  # change the title of your xterm* window
    unset PROMPT_COMMAND
    echo -ne "\033]0;$1\007" 
  }

fi

source /Users/Jibone/Dropbox/todotxt/app/todo_completion

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
