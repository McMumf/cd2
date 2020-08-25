#!/usr/bin/env bash

# Declare associative array
declare -A directories

# Define name and directory
directories["cd2"]="/vagrant/cd2"
directories["vag"]="/vagrant"

install() {

    # check if root
    if [[ $EUID -ne 0 ]]; then
        echo "This function must be run as root" 1>&2
        exit 1
    fi

    # Get path of current script
    script_name1=`basename $0`
    script_path1=$(dirname $(readlink -f $0))
    script_path_with_name="$script_path1/$script_name1"

    # check if /opt/bin exists
    if [ ! -d "/opt/bin" ]
        then
            mkdir /opt/bin
        else 
            echo "We Gucci"
    fi

    cp $script_path_with_name /opt/bin/cd2.sh

    if [ ! -L "/usr/bin/cd2" ]; then
        ln -s /opt/bin/cd2.sh /usr/bin/cd2
    fi
}

uninstall() {
    
    if [[ $EUID -ne 0 ]]; then
        echo "This function must be run as root" 1>&2
        exit 1
    fi 

    rm /opt/bin/cd2.sh
    rm /usr/bin/cd2
}

navigate() {

    echo "Navigating to ${directories["$1"]}"
    cd "${directories["$1"]}"
}

if [ $1 == "install" ]; then
    install
elif [ $1 == "uninstall" ]; then
    uninstall
else
    if [ -v directories[$1] ]; then
        . navigate $1
    else
        echo "Yeahhh that ain't it chief, try another name"
    fi
fi
