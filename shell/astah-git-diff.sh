#!/bin/bash

# ------------------------------------------------------------
# Setting: 
# 1. create symbolic link （e.g ln -sf ~/myscript/shell/astah-git-diff.sh /usr/local/bin/astah-git-diff）
# 2. set a PATH
#
# Usage:
# 1. cd <your repository that contain .astah file>
# 2. astah-git-diff base-revision target-revesion filename
# ------------------------------------------------------------

WORKING_DIR=~/astah_diff_work

if [ ! -e $WORKING_DIR ]; then
    mkdir ~/astah_diff_work
fi

BASE_FILE=$WORKING_DIR/$1".asta"
REF_FILE=$WORKING_DIR/$2".asta"

rm -f $WORKING_DIR/*.asta

echo "work_dir: "$WORKING_DIR
echo -n > $BASE_FILE
echo -n > $REF_FILE

echo "------------------------------------------------------------"

git show "$1:$3" > $BASE_FILE
git show "$2:$3" > $REF_FILE

echo "base: "$BASE_FILE
echo "ref: "$REF_FILE

echo "------------------------------------------------------------"

# astah-command.shを起動(for macOS)
/Applications/astah\ professional/astah-command.sh -diff $BASE_FILE $REF_FILE

# astah-command.shを起動(for Linux(deb系))
# /usr/lib/astah_professional/astah-command.sh -diff $BASE_FILE $REF_FILE