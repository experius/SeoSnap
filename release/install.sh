#!/bin/sh

if [ "$1" == "clean" ]; then
  echo 'Cleaning installation'
  sudo rm -rf ./cache
fi

mkdir -p cache
mkdir -p logs
if [ ! -f ".env" ]; then
  cp .env.example .env
  echo 'Generating new secret key'
  export NEW_SECRET="$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c50)";
  sed -i "s/https\:\/\/miniwebtool.com\/django-secret-key-generator\//${NEW_SECRET}/g" .env;
  
  echo 'Setting new admin user login'
  read -p 'Username [snaptron]: ' ADMIN_NAME
  read -p 'Email [snaptron@snap.tron]: ' ADMIN_EMAIL
  read -sp 'Password [Sn@ptron1337]: ' ADMIN_PASS
  sed -i "s/snaptron$/${ADMIN_NAME:-snaptron}/g" .env;
  sed -i "s/snaptron@snap.tron/${ADMIN_EMAIL:-snaptron@snap.tron}/g" .env;
  sed -i "s/Sn@ptron1337/${ADMIN_PASS:-Sn@ptron1337}/g" .env;
fi

