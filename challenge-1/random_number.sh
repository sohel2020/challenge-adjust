#!/usr/bin/env bash

set -eo pipefail

RED='\033[31m'
BOLD='\033[1m'
DIM='\033[2m'
RS_ALL='\033[0m'
RS_DIM='\033[22m'

hl() {
    echo -e "$BOLD$1$RS_DIM"
}

error() {
    echo -e "$RED$(hl "[ERROR]") $1$RS_ALL"
}

die() {
    error "$1"
    exit 1
}

silent() {
    "$@" > /dev/null 2>&1
}

assure_package() {
    if ! silent command -v "$1" ; then
        die "$1 is required in your PATH."
    fi
}


usage() {
    echo "Usage: $0 -s <startnumber> -e <endnumber>"
    echo
    echo "example: $0 -s 1 -e 10"
    echo
    echo "  -s | --startnumber      Begin range  number. default: 1"
    echo "  -e | --endnumber        End range  number. default: 10"
    echo
}

# checking if required package exist
assure_package shuf

if [ $# -eq 0 ]
then
    usage
    die "No argument provide, you need to provide atleast two argument"
fi


while :
do
    case "$1" in
        -h | --help)
            usage
            exit 0 ;;
        -f | --startnumber)
            start_number=$2
            shift 2 ;;
        -l | --endnumber)
            end_number=$2
            shift 2 ;;
        -*) usage
            die "Invalid option: $1" ;;
        *)  break ;;
    esac
done

# setting default values for variables
start_number=${start_number:-1}
end_number=${end_number:-10}

shuf -i $start_number-$end_number
