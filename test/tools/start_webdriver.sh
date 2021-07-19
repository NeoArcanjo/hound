#!/usr/bin/env bash

if [ "$WEBDRIVER" = "phantomjs" ]; then
  npm install -g phantomjs
  nohup phantomjs -w &
  echo "Running with PhantomJs..."
  sleep 3
elif [ "$WEBDRIVER" = "selenium" ]; then
  mkdir -p $HOME/src
  npm install -g selenium-standalone
  selenium-standalone install
  nohup selenium-standalone start &
  echo "Running with Selenium..."
  sleep 10
fi
