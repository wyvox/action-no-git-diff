#!/usr/bin/env bash

RED=$'\e[31m'
GREEN=$'\e[32m'
BLUE=$'\e[34m'
LIGHT_BLUE=$'\e[94m'

ITALIC=$'\e[3m'
BOLD=$'\e[1m'
ENDCOLOR=$'\e[0m'

green() { echo "${GREEN}$1${ENDCOLOR}" ; }
red() { echo "${RED}$1${ENDCOLOR}" ; }
lightBlue() { echo "${LIGHT_BLUE}$1${ENDCOLOR}" ; }
code() { echo "'${LIGHT_BLUE}$1${ENDCOLOR}'" ; }
italic() { echo "${ITALIC}$1${ENDCOLOR}"; }

####################################################

lightBlue "Checking for git diffs..."


italic ""
italic "Using $(code 'git diff --exit-code') allows ensuring stability of our commands and to reduce flakiness in CI."
italic ""
italic "If you see an error from this task, please check the command(s) from the previous step(s) and try running them locally."
italic "To fix, you will need to either commit the changes or add new files to the local per-project .gitignore file."
italic ""
italic ""

git diff --exit-code

if [ $? -ne 0 ]; then
	red "Git diff detected. Note what changed above."
	red "Please check the command(s) from the previous step(s) that produced the diff."
	exit 1
else
	green "✨ Congrats, the repo has no changed files at the moment. ✨"
fi
