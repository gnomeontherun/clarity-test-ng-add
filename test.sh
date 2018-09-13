#!/usr/bin/env bash

index=0

# We need to test prior to 6.2
declare -a versions=("6.1.0" "6.2.0")
for version in "${versions[@]}"
do
    # Increment index
    let "index++"
    # Install CLI at version
    npm i -g @angular/cli@${version}
    # New project
    ng new sample${index}
    # Change into it
    cd sample${index}
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
    cd ../
done