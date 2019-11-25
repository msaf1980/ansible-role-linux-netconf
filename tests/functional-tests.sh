#! /usr/bin/env bash

RES=0

if [ -f /etc/redhat-release ]; then
	for file in $( ls ${1}/tests/results ); do
		diff -uB ${1}/tests/results/${file} tmp/${file} || RES=1
	done
fi

exit ${RES}
