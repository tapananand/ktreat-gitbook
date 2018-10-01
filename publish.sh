#!/bin/bash

git add .
git commit -m "$1"
if test $?
    git push origin master
fi

exit 0