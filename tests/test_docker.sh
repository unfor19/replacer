#!/bin/bash
EXPECTED_FILE_PATH=tests/EXPECTED.md
SRC_FILE_PATH=tests/app.log
DST_FILE_PATH=tests/TEST.md
DOCKER_FOLDER=/app
DOCKER_SRC_PATH="${DOCKER_FOLDER}"/"${SRC_FILE_PATH}"
DOCKER_DST_PATH="${DOCKER_FOLDER}"/"${DST_FILE_PATH}"
DOCKER_TAG=unfor19/replacer:latest

source tests/generate_log.sh > tests/app.log

docker run --rm -v "${PWD}"/:${DOCKER_FOLDER} \
    "${DOCKER_TAG}" -sf "${DOCKER_SRC_PATH}" -df "${DOCKER_DST_PATH}"

perl -p -i -e "s/\r//g" "${DST_FILE_PATH}"

if cmp -b --verbose "${DST_FILE_PATH}" "${EXPECTED_FILE_PATH}" ; then
    echo "[LOG] Test passed"
    exit 0
else
    echo "[ERROR] Test failed"
    exit 1
fi