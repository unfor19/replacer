#!/bin/bash
SRC_FILE_PATH=.help_message.txt
DST_FILE_PATH=README.md
DOCKER_FOLDER=/app
DOCKER_SRC_PATH="${DOCKER_FOLDER}"/"${SRC_FILE_PATH}"
DOCKER_DST_PATH="${DOCKER_FOLDER}"/"${DST_FILE_PATH}"
DOCKER_TAG=unfor19/replacer

REPLACER_START_VALUE="<!-- replacer_start_help -->"
REPLACER_END_VALUE="<!-- replacer_end_help -->"

docker rm -f replacer_help
docker build --file Dockerfile.alpine -t "${DOCKER_TAG}" .
docker run --name replacer_help "${DOCKER_TAG}" --help
help_message=$(docker logs replacer_help)

echo -e "\`\`\`bash\n\\$ docker run --rm -v \\$\{PWD\}/:/app ${DOCKER_TAG} --help" > "${SRC_FILE_PATH}"
echo -e "${help_message}" >> "${SRC_FILE_PATH}"
echo -e "\n\`\`\`" >> "${SRC_FILE_PATH}"

docker run --rm -v "${PWD}"/:${DOCKER_FOLDER} \
    "${DOCKER_TAG}" -sf "${DOCKER_SRC_PATH}" -df "${DOCKER_DST_PATH}" -sv "${REPLACER_START_VALUE}" -ev "${REPLACER_END_VALUE}"

