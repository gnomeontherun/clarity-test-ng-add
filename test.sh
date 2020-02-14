#!/usr/bin/env bash

# Install CLI at version
npm i -g @angular/cli@${1}
# New project
ng new sample --defaults=true
# Change into it
cd sample
# Try to install Clarity
if ! ng add @clr/angular@${2}
then
    echo "Failed to add @clr/angular@$1 to @angular/cli@$2"
    exit 1
fi
# Try to build prod
if ! ng build --prod
then
    echo "Failed to build after adding @clr/angular@$1 to @angular/cli@$2"
    exit 1
fi