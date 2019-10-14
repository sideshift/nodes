#!/usr/bin/env bash
set -e

node -p "require('ejs').render(fs.readFileSync('./templates/$1.ejs','utf8'),{_:require('lodash'),...require('./src/$2')})"
