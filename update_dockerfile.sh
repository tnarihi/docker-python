#! /bin/bash

find . -maxdepth 1 -type d -name "docker*" | while read DIR ; do
    cat $DIR/Dockerfile.base > $DIR/Dockerfile
    if [ $# -ge 1 ]; then
	for BASE in $@; do
	    cat $BASE >> $DIR/Dockerfile
	done
    fi
    cat Dockerfile.base >> $DIR/Dockerfile
    echo "--------------------------------"
    echo "Dockerfile is created at ${DIR}."
    echo "--------------------------------"
    cat $DIR/Dockerfile
    echo "--------------------------------"
done
