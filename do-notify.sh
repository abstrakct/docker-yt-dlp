#!/bin/bash

BODY="$1"

if [[ ! -z $APPRISE_SERVICE ]]; then
    /usr/bin/apprise -b $BODY "$APPRISE_SERVICE"
fi
