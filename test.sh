#!/usr/bin/env bash

# Install CLI at version
npm i -g @angular/cli@
# New project
ng new sample --defaults=true
# Change into it
cd sample
# Try to install Clarity
if ! ng add @clr/angular
then
    echo "Failed to add Clarity"
    exit 1
fi
# Try to build prod
if ! ng build --prod
then
    echo "Failed to build after adding Clarity"
    exit 1
fi