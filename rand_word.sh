#!/bin/bash

set -e

ROOT=$PWD
RANDOM=$$
n=$(( $RANDOM%2007 ))
if [ $n != 0 ]
then
	cat ${ROOT}/positive_words  | sed -n ${n}p
fi

