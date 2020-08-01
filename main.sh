#!/bin/bash
# Requires perl

source "${PWD}"/"$(dirname ${BASH_SOURCE[0]})"/scripts/bargs.sh "$@"

error_msg(){
    local msg=$1
    echo -e "[ERROR] $msg"
    export DEBUG=1
    exit 1
}

if [[ "${CREATE_BACKUP}" == "true" ]]; then
    CREATE_BACKUP=".bak"
    [[ -z "${BACKUP_FILE_PATH}" ]] && CREATE_BACKUP="${BACKUP_FILE_PATH}"
else
    CREATE_BACKUP=""
fi

if [[ "${SRC_FILE_PATH}" != "replacer_null" ]]; then
    [[ ! -f "${SRC_FILE_PATH}" ]] && error_msg "${SRC_FILE_PATH} doesn't exist."
    src_file_stream=$(cat "${SRC_FILE_PATH}")
elif [[ "${SRC_TEXT}" != "replacer_null" ]]; then
    src_file_stream="${SRC_TEXT}"
else
    error_msg "Must provide src_file_path or src_text"
fi


result=$(perl \
    -i"${CREATE_BACKUP}" \
    -p0e 's~(?<='"${START_VALUE}"'\n\n)(.*)(?=\n\n'"${END_VALUE}"')~'"${src_file_stream}"'\r~s' \
    "${DST_FILE_PATH}")

[[ -z $result ]] && echo "Success" || echo "Failed"
