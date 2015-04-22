#!/bin/bash

server=antiphase.net
port=6667
nick='duck_turpin'
user_name='pete'
real_name='Pete Bot'
channel='#tdtrs'

be_pete=( \
  'Fook'\
  'Ahahahahaha'\
  'I love Maggie'\
  'Fookin PFY ate me bacon sarnie'\
  'Jono Bacon'\
  'Ive got some lovely HP Vectras you might be interested in'\
  'Ubuntu née Canonical'\
  'Fookin Zen fookin Cart'\
  'PHPMail ate my fookin hamster'\
)


exec > /dev/tcp/${server}/${port}

echo -e "NICK ${nick}\r\n"
sleep 10
echo -e "USER ${user_name} 0 * :${real_name}\r\n"
sleep 10
echo -e "JOIN ${channel} * \r\n"
sleep 1

while sleep $(( $RANDOM >> 9 ))  # 0-128s between proclamations
do
  echo -e "PRIVMSG #tdtrs :${be_pete[ $(( $RANDOM * ${#be_pete[*]} >> 15 )) ]}\r\n"
done
