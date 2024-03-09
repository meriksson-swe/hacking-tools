#!/bin/bash
default_port=4444
reg='^-{0,2}h(elp){0,1}$'
input=''

# Print help
function help (){
  echo "This script sets up a local NetCat listener that can be used for remove shell callbacks."
  echo "call this script with $0 [parameters] [port]" 
  echo "  port" 
  echo "    custom port to use. If not set default port $default_port will be used" 
  echo "  parameters" 
  echo "    h, -h, --h, help, -help, --help to show this help" 
}

# Set up the tunnel
function tunnel() {
    local port="${1}"
    nc -lvp "$port"
}

if [ $# -gt 2 ]; then
  help
  exit 0
fi

# Check params for help and port
if [ $# -ne 0 ]; then
  for var in "$@"
  do
    if [[ "$var" =~ $reg ]]; then
      help
      exit 0
    fi
    input="$var"
  done
else
  # If no arguments passed, use default port
  input=$default_port
fi

tunnel $input
