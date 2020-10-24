#!/bin/bash

BODY="$1"

if [[ ! -z $APPRISE_SERVICE ]]; then
    apprise -b $BODY "$APPRISE_SERVICE"
fi
