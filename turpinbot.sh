#!/bin/bash

server=chat.freenode.net
port=6667
nick=duck_turpin
user_name=pete
real_name='Pete Bot'
channel='#tdtrs'

be_pete=( \
  "Fook"\
  "Ahahahahaha"\
  "I love Maggie"\
  "Fookin PFY ate me bacon sarnie"\
  "Jono Bacon"\
  "I've got some lovely HP Vectras you might be interested in"\
  "Ubuntu née Canonical"\
  "Fookin Zen fookin Cart"\
  "PHPMail ate my fookin hamster"\
  "You fookin idiot!"\
)


exec > /dev/tcp/${server}/${port}

echo -e "NICK ${nick}\r\n"
sleep 10
echo -e "USER ${user_name} 0 * :${real_name}\r\n"
sleep 10
echo -e "JOIN ${channel} * \r\n"
sleep 1

while sleep $(( $RANDOM >> 8 ))  # 0-128s between proclamations
do
  echo -e "PRIVMSG ${channel} :${be_pete[ $(( $RANDOM * ${#be_pete[*]} >> 15 )) ]}\r\n"
done
