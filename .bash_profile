# Identify OS and Machine -----------------------------------------
export OS=`uname -s | sed -e 's/  */-/g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
export OSVERSION=`uname -r`; OSVERSION=`expr "$OSVERSION" : '[^0-9]*\([0-9]*\.[0-9]*\)'`
export MACHINE=`uname -m | sed -e 's/  */-/g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
export PLATFORM="$MACHINE-$OS-$OSVERSION"
# Note, default OS is assumed to be OSX

#Load in .bashrc -------------------------------------------------
source ~/.bashrc

# Hello Messsage --------------------------------------------------
#echo -e "Kernel Information: " `uname -smr`
#echo -e "`bash --version`"
echo -ne "Uptime: "; uptime
#echo -ne "Server time is: "; date
echo -e "Ghock and Gholl!"

#export CLICOLOR=1
#export LSCOLORS=ExFxBxDxCxegedabagacad

# general path
PATH=${PATH}:~/bin
PATH=${PATH}:/usr/local/bin
PATH=${PATH}:/opt/bin

# MySQL
export PATH=${PATH}:/usr/local/mysql/bin:

# Aliases -------------------------------------------------------
alias f='open -a Finder '
alias preview="open -a '/Applications/Preview.app'"
alias chrome="open -a google\ chrome"
alias photoshop="open -a '/Applications/Adobe Photoshop CS5.1/Adobe Photoshop CS5.1.app'"
