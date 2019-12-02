#! /usr/bin/env bash

RES=0

if [ -f /etc/redhat-release ]; then
	for file in $( ls ${1}/tests/results/network-scripts ); do
		diff -u ${1}/tests/results/network-scripts/${file} /tmp/${file} || RES=1
	done
elif [ -f /etc/debian_version ]; then
	for file in $( ls ${1}/tests/results/debian ); do
		diff -u ${1}/tests/results/debian/${file} /tmp/${file} || RES=1
	done
else
	echo "Untested OS" >&2
	RES=1
fi

exit ${RES}
