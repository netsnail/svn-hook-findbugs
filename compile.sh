#!/bin/bash

_path=$1

_ant=/data/apache-ant-1.9.4/bin/ant
_mvn="/data/apache-maven-3.3.9/bin/mvn compile"

if [ -f $_path/build.xml ]; then
	echo $_ant
else 
	echo $_mvn
fi
