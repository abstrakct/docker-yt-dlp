#!/bin/bash

BODY="$1"

if [[ ! -z $APPRISE_SERVICE ]]; then
    apprise -b "Downloaded: $BODY" "$APPRISE_SERVICE"
fi
