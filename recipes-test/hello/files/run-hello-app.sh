#!/bin/sh

ROOT_PREFIX=""
[ -n "$1" ] && ROOT_PREFIX="$1"
ROOT_PATH="${ROOT_PREFIX}/"
BIN_PATH="usr/bin/"
BIN_NAME="hello"

HELLO_BIN="${ROOT_PATH}${BIN_PATH}${BIN_NAME}"

if [ -x "${HELLO_BIN}" ]; then
	echo "Executing ${HELLO_BIN} binary ${VERSION}"
	${HELLO_BIN}
	exit $?
else
	echo "${HELLO_BIN} is not found or is not executable"
	exit 1
fi
