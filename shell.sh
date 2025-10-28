#!/bin/bash
first_var=$1
second_var=$2

echo "Script name: $0"
echo "First arg: $1"
echo "Number of args: $#"
echo "All args: $@"
echo "All args as single string: $*"

# $0 --> script name
# $1, $2, ... --> positional parameters
# $# -- > Number of arguments
# $@ --> all arguments
# $* --> all arguments as a single string