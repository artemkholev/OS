#!/bin/bash

start() {
	echo "Starting vnc server with $resolution on Display $display"
}

stop() {
	echo "Killing vncserver on display $display"
}

display_help() {
    echo "Программа выводит элемент - свойство"
    echo "=)"
    exit 1
}

while :
do
    case "$1" in
      -h | --help)
          display_help
          exit 0
          ;;
      -d | --display)
          display="$2"
           shift 2
           ;;
      --)
          shift
          break
          ;;
      -*)
          echo "Error: Unknown option: $1" >&2
          exit 1 
          ;;
      *) 
          break
          ;;
    esac
done

case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart)
    stop 
    start
    ;;
  *)
  	
     echo "---вещи - свойства---"	
     input_one=()
     while IFS= read -r line || [[ "$line" ]]; do
     input_one+=("$line")
     done < items.txt
     input_one=( $(shuf -e "${input_one[@]}") )

     input_two=()
     while IFS= read -r line || [[ "$line" ]]; do
     input_two+=("$line")
     done < properties.txt
     input_two=( $(shuf -e "${input_two[@]}") )

     for index in {1..5};
     do
        echo "${input_one[index]} - ${input_two[index]}"
     done
     exit 1
     ;;
esac
