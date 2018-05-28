#!/bin/bash

# The following function prints a text using custom color
# -c or --color define the color for the print. See the array colors for the available options.
# -n or --noline directs the system not to print a new line after the content.
# Last argument is the message to be printed.
cecho () {
    declare -A colors;
    colors=(\
		['red']='\E[0;31m'\
		['green']='\E[0;32m'\
		['yellow']='\E[0;33m'\
		['blue']='\E[0;34m'\
		['magenta']='\E[0;35m'\
		['cyan']='\E[0;36m'\
		['white']='\E[0;37m'\

		['red inverted']='\E[0;41m'\
		['green inverted']='\E[0;42m'\
		['yellow inverted']='\E[0;43m'\
		['blue inverted']='\E[0;44m'\
		['magenta inverted']='\E[0;45m'\
		['cyan inverted']='\E[0;46m'\
		['black']='\E[0;47m'\
    );

    local defaultMSG="No message passed.";
    local defaultColor="black";
    local defaultNewLine=true;

    while [[ $# -gt 1 ]];
    do
    key="$1";

    case $key in
        -c|--color)
            color="$2";
            shift;
        ;;
        -n|--noline)
            newLine=false;
        ;;
        *)
            # unknown option
        ;;
    esac
    shift;
    done

    message=${1:-$defaultMSG};   # Defaults to default message.
    color=${color:-$defaultColor};   # Defaults to default color, if not specified.
    newLine=${newLine:-$defaultNewLine};

    echo -en "${colors[$color]}";
    echo -en "$message";
    if [ "$newLine" = true ] ; then
        echo;
    fi
    tput sgr0; #  Reset text attributes to normal without clearing screen.

    return;
}

print_warning () {
	cecho -n -c 'yellow inverted' "[WARNING]";
	cecho -c 'yellow' " $@";
	echo ""
}

print_error () {
	cecho -n -c 'red inverted' "[ERROR]";
	cecho -c 'red' " $@";
	echo ""
}

print_information () {
	cecho -n -c 'blue inverted' "[INFORMATION]";
	cecho -c 'blue' " $@";
	echo ""
}


info () {
	printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

prompt () {
	printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
	printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
	printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
	echo ''
	exit
}

