#!/usr/bin/env bash

ng new sample
cd sample
if ! ng add @clr/angular
then
    echo "Failed to add Clarity"
    exit 1
fi
if ! ng build --prod
then
    echo "Failed to build after adding Clarity"
    exit 1
fi