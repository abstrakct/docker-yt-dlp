#!/bin/bash

BODY="$1"

/usr/bin/apprise -b $BODY "$APPRISE_SERVICE"
