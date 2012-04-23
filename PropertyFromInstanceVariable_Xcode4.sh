#!/bin/bash

# Created by Richard Heard on 23/04/12.
# Copyright (c) 2012 Richard Heard. All rights reserved.

# CONFIG
SCRIPT="PropertyFromInstanceVariable.pl"


# VARIABLES
PWD="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TMP_FILE_PATH="/tmp/tmp_$SCRIPT"


# LOGIC
"$PWD/populateXcode3UserScriptVariables.sh" "$PWD/$SCRIPT" > $TMP_FILE_PATH;
/bin/chmod 700 $TMP_FILE_PATH;
$TMP_FILE_PATH;

