#!/bin/bash
INPUT_FILE=tests/TEST.md
EXPECTED_FILE=tests/EXPECTED.md

source tests/generate_log.sh > tests/app.log

source main.sh -sf tests/app.log -df tests/TEST.md

perl -p -i -e "s/\r//g" "$INPUT_FILE"


if cmp -b --verbose "$INPUT_FILE" "$EXPECTED_FILE" ; then
    echo "Success"
else
    echo "No match"
fi
