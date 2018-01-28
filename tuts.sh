#!/bin/bash

# Template
#tuts_tar()
#{
#
#case $1 in
#-h|--help|*)
#esac
#
#}


welcome(){

echo "======================  $1  ======================"

}

tuts_tar()
{

case $1 in
-h|--help|*) welcome "In ${FUNCNAME[0]}"
esac

}

tuts_kill()
{

	case $1 in
		-h|--help|*) welcome "In ${FUNCNAME[0]}";
			echo "pkill -f <app name> EX: pkill -f vim --> kills all processes with vim"
	esac

}



tuts_vim()
{

case $1 in
-h|--help|*) echo -n "

 Show all tabs:
/\t

 Show trailing whitespace:
/\s\+$

 Show trailing whitespace only after some text (ignores blank lines):
/\S\zs\s\+$

 Show spaces before a tab:
/ \+\ze\t

Reference:
http://vim.wikia.com/wiki/Highlight_unwanted_spaces

"
esac
}


grep_usage(){

echo "tuts_grep -avif(all vars in file) <file_path>"

}

alias g='grep -RnHi'
alias gw='grep -RnHw'
alias f='find . -name'
#gr()
#{
#case $1 in
#-s) grep -RnHi "$2" $all_scripts;;
#-h|--help|*)echo "g -s<>";;
#esac
#
#}

tuts_grep()
{

case $1 in
-avif) grep -RnHioP "\w*[A-Z]+\w*=" $2;;
-h|--help|*)welcome "In ${FUNCNAME[0]}"
grep_usage;;
esac

}
