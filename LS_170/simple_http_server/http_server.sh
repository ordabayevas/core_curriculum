#!/bin/bash

function server () {
  while true
  do
    message_arr=()
    check=true
    while $check
    do
      read line
      message_arr+=($line)
      if [[ "${#line}" -eq 1 ]]
      then
        check=false
      fi
    done
    method=${message_arr[0]}
    path=${message_arr[1]}
    if [[ $method = 'GET' ]]
    then
      if [[ -f "./www/$path" ]]
      then
        echo -ne 'HTTP/1.1 200 OK\r\n\r\n'; cat "./www/$path"
        Content-Type: text/html; charset=utf-8
        Content-Length=$(wc -c < $path)
      else
        echo -ne 'HTTP/1.1 404 Not Found\r\n\r\n'
        Content-Length=0
      fi
    else
      echo -ne 'HTTP/1.1 400 Bad Request\r\n\r\n'
      Content-Length=0
    fi
  done
}

# function server () {
#   while [[ true ]]
#   do
#     read method path version
#     if [[ $method = 'GET' ]]
#     then
#       if [[ -e ./www/$path ]]
#       then
#         echo -ne "HTTP/1.1 200 OK\r\n\r\n";cat ./www/$path
#       else
#         echo -ne "HTTP/1.1 404 Not Found\r\n\r\n"
#       fi
#     else
#       echo -ne "HTTP/1.1 400 Bad Request\r\n\r\n"
#     fi
#   done
# }

# function server () {
#   while [[ true ]]
#   do
#     read method path version
#     if [[ $method = 'GET' ]]
#     then
#       echo HTTP/1.1 200 OK
#     else
#       echo HTTP/1.1 400 Bad Request
#     fi
#   done
# }

# coproc SERVER_PROCESS { server; }

# nc -lv 2345 <&${SERVER_PROCESS[0]} >&${SERVER_PROCESS[1]}

# function server () {
#   while true
#   do
#     read message
#     echo "You said: $message"
#   done
# }

coproc SERVER_PROCESS { server; }

nc -lkv 2345 <&${SERVER_PROCESS[0]} >&${SERVER_PROCESS[1]}