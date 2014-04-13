#!/bin/bash -xe

# remove the garbage that might be currently living in the repo
cd ~/git_sw/dotfiles/ && git clean -xdf

changed=0

for element in .*
do
    echo "The element is $element"
    if [ "$element" != ".git"  ] && [ "$element" != ".gitignore" ] && \
        [ "$element" != ".." ] && [ "$element" != "." ] && \
        [ "$element" != ".viminfo" ]; then
        cp ~/${element} .
        git add $element
        changed=$[$changed + 1]
    fi
done

if [ "$changed" != "0" ]; then
    git commit -m "Auto-generated commit to update dotfiles"
    git push origin master
fi
