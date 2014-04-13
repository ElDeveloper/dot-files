# Prompt configuration 'user:Current Directory$ '
export PS1='\[\e[1;32m\]\u\[\e[m\]:\W$ '

export HISTFILESIZE=1000000000
export HISTSIZE=10000000000

# latest version of git ... because this is how I roll
export PATH='/usr/local/git/bin/':${PATH}

# Setting PATH for Python 2.7.1
# The original version is saved in ~/.bash_profile.pysave
export PATH=/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH

# # *QIIME Dependencies*
# Blast PATH for the scripts version 2.2.22
export PATH=/Users/yoshikivazquezbaeza/svn_sw/dep/blast-2.2.22/bin:$PATH
# mothur PATH for the binaries of version
export PATH=/Users/yoshikivazquezbaeza/svn_sw/dep/mothur-1.25.0/:$PATH
# RDP Classifier path
export RDP_JAR_PATH=/Users/yoshikivazquezbaeza/svn_sw/dep/rdp_classifier_2.2/rdp_classifier-2.2.jar
# P-Placer, Guppy and Taxtastic
export PATH=/Users/yoshikivazquezbaeza/svn_sw/dep/pplacer-v1.1.alpha13-Darwin-10.8.0:$PATH
# Fast Tree
export PATH=/Users/yoshikivazquezbaeza/svn_sw/dep/FastTree:$PATH
# UCLUST
export PATH=/Users/yoshikivazquezbaeza/svn_sw/dep/uclust:$PATH
# CDBTools
export PATH=/Users/yoshikivazquezbaeza/svn_sw/dep/cdbtools:$PATH
# USEARCH
export PATH=/Users/yoshikivazquezbaeza/svn_sw/dep/usearch-5.2.236:$PATH
export PATH=/Users/yoshikivazquezbaeza/svn_sw/dep/usearch-6.1:$PATH
# RTAX
export PATH=/Users/yoshikivazquezbaeza/svn_sw/dep/rtax-0.983:$PATH
# clearcut
export PATH=/Users/yoshikivazquezbaeza/svn_sw/dep/clearcut:$PATH
# RAxML
export PATH=/Users/yoshikivazquezbaeza/svn_sw/dep/RAxML:$PATH
# muscle
export PATH=/Users/yoshikivazquezbaeza/svn_sw/dep/muscle-3.8.31:$PATH
# tools for the end of the world APOCAQIIME
# export PATH=/Users/yoshikivazquezbaeza/git_sw/apocaqiime/scripts:$PATH
# export PYTHONPATH=/Users/yoshikivazquezbaeza/git_sw/apocaqiime/:$PYTHONPATH

# Colors for the ls calls
export CLICOLOR=1
export LSCOLORS=GxBxhxDxfxhxhxhxhxcxcx

# Color for grep matches
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='01;38;5;226'

# Alias to be able to call Sublime Text ... 3 is still in beta
alias st2='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'
alias st3='/Applications/Sublime\ Text\ 3.app/Contents/SharedSupport/bin/subl'

# Make the ls command output have sizes human readable 
alias ls='ls -h'

# keep raw colors 
alias less='less -R'

# Copy current path to the paste board, echo quotes for paths with spaces
alias cpwd='echo "\"$(pwd)\"" | pbcopy'

# Show a file in Finder
alias show='open -R'

# modern terminal swag
alias YOLO='sudo rm -rf'

# order the processes by CPU usage then by memory usage
alias topy='top -o CPU -O RSIZE -U ${USER}'

# MATLAB alias, will always launch from the current path with no GUI
alias matlab='/Applications/MATLAB_R2013a.app/bin/matlab -nosplash -nodesktop -r "cd ${PWD}"'

alias zay='say -v Zarvox -i'

# inkscape magic
export PATH='/Applications/Inkscape.app/Contents/Resources/bin/':${PATH}
#alias inkscape='/Applications/Inkscape.app/Contents/Resources/bin/inkscape'

alias math="/Applications/Mathematica.app/Contents/MacOS/MathKernel"

# Microsoft hates their users, this comes handy for QIIME mapping files
alias meta='open -a /Applications/Microsoft\ Office\ 2011/Microsoft\ Excel.app'

# chrome shortcut
alias chrome='open -a /Applications/Google\ Chrome.app'

# firefox shortcut
alias firefox='open -a /Applications/Firefox.app'

# VPN connect and disconnect
alias cvpn='networksetup -connectpppoeservice CU\ Boulder'
alias dvpn='networksetup -disconnectpppoeservice CU\ Boulder'

# There's a problem with this system, currently not allowing the use of a 
# 'motd' file, so output a message depending on the day of the week ...
if [ "`date '+%A'`" == "Friday" ]; then 
	echo "It's friday friday gotta get down on friday, everybody's looking forward to the weekend, weekend!"
else
	echo "Time is never wasted when you're wasted all the time!"
fi

# Support for language codifications, without this Sphix won't work
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#***************************************
#**Shortcuts for remote login sessions**
#***************************************

# MBL cluster
alias lostmps='ssh yvbaeza@evol5.mbl.edu'

# E-vident virtual machine
export EVIDENT=evident@192.168.56.101
alias loevdnt='ssh evident@192.168.56.101'

# antares
export ANTARES=ib08yvb@antares.dci.uia.mx
alias loantar='ssh ib08yvb@antares.dci.uia.mx'

# git @ aldebaran
export ALDEBARAN=git@aldebaran.dci.uia.mx
alias loaldeb='ssh git@aldebaran.dci.uia.mx'

# MacPorts Installer addition on 2012-08-15_at_09:58:10: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# enable and disable git convenience functions ... not sure they will stay
function egit (){
	function get_git_branch () {
		command git rev-parse --abbrev-ref HEAD 2> /dev/null
	}
	# git specific usage for branching
	function branch_separator () {
		if [[ -n $(get_git_branch) ]]
		then
		echo "@"
		fi
	}
    export TMP_GIT_PS1=${PS1} # back up the default settings
	export PS1='\[\e[1;32m\]\u\[\e[m\]:\W\[\e[01;38;5;195m\]$(branch_separator)\[\e[m\]\[\e[01;38;5;196m\]$(get_git_branch)\[\e[m\]$ '
}
function dgit (){
	export PS1=${TMP_GIT_PS1}
}
egit;
alias git='hub'


# show all colors in xterm-256
#( x=`tput op` y=`printf %$((${COLUMNS}-6))s`;for i in {0..256};do o=00$i;echo -e ${o:${#o}-3:3} `tput setaf $i;tput setab $i`${y// /=}$x;done; )

# git branchname autocompletion 
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

#source /Users/yoshikivazquezbaeza/qiime_software/activate.sh

# VirtualEnv
source /Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenvwrapper.sh

