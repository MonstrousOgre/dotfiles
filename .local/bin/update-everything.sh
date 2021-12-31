#!/bin/sh
# shell script for updating packages from every package manager

COUNT=0
CHECK=false

if [ "$1" == "--check" ]; then
  COUNT=$((COUNT+$(checkupdates | grep -c "")))
  COUNT=$((COUNT+$(paru -Qum | grep -c "")))
else
  echo -e "\n\e[1;93m-> \e[0m\e[1;92mUpdating Arch Linux packages\e[0m\e[1;34m  \e[0m\n"
  #yay -Syu
  paru -Syu
  echo -e "\n\e[1;33m<- \e[0m\e[1;32mComplete\e[0m"
fi

if [ "$1" == "--check" ]; then
  COUNT=$((COUNT+$(rustup check | grep -c "Update available")))
else
  echo -e "\n\e[1;93m-> \e[0m\e[1;92mUpdating Rustup\e[0m\e[1;37m  \e[0m\n"
  rustup update
  echo -e "\n\e[1;33m<- \e[0m\e[1;32mComplete\e[0m"
fi

if [ "$1" == "--check" ]; then
  COUNT=$((COUNT+$(cargo install-update --list | grep -c "Yes")))
else
  echo -e "\n\e[1;93m-> \e[0m\e[1;92mUpdating cargo packages\e[0m\n"
  cargo install-update -a
  echo -e "\n\e[1;33m<- \e[0m\e[1;32mComplete\e[0m"
fi

if [ "$1" == "--check" ]; then
  COUNT=$((COUNT+$(npm -g outdated | grep -c "")))
  #COUNT=$COUNT
else
  echo -e "\n\e[1;93m-> \e[0m\e[1;92mUpdating npm packages\e[1m\e[1;91m  \e[0m\n"
  npm update -g
  echo -e "\n\e[1;33m<- \e[0m\e[1;32mComplete\e[0m"
fi

if [ "$1" == "--check" ]; then
  COUNT=$((COUNT+$(pip list --outdated | grep -c "")))
  #COUNT=$COUNT
else
  echo -e "\n\e[1;93m-> \e[0m\e[1;92mUpdating pip packages\e[1m\e[1;33m  \e[0m\n"
  pip-review --local --interactive
  echo -e "\n\e[1;33m<- \e[0m\e[1;32mComplete\e[0m"
fi

if [ "$COUNT" -gt 0 ]; then
    echo "痢 $COUNT"
else
    echo ""
fi
