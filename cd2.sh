#!/usr/bin/env bash

# Declare associative array
declare -A directories

# Define name and directory
directories["cd2"]="/vagrant/cd2"

install() {

    if [[ $EUID -ne 0 ]]; then
        echo "This script must be run as root" 1>&2
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
    if [ ! -L "/usr/bin/cd2" ]
    then
        ln -s /opt/bin/cd2.sh /usr/bin/cd2
    fi
}

if [ $1 == "install" ]
then
    install
else
    cd ${directories["$1"]}
fi