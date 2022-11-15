#!/bin/bash

REPO=yohanchatelain

function check() {
    if [[ $? != 0 ]]; then
        echo "Error"
        exit 1
    fi
}

function Clone() {
    git clone $1
    check
}

function Cd() {
    cd $1
    check
}

function Autogen() {
    ./autogen.sh
    check
}

function Configure() {
    ./configure $@
    check
}

function Make() {
    make
    check
}

function MakeInstall() {
    make install
    check
}

function install_stdlib() {
    Clone https://github.com/${REPO}/interflop-stdlib
    Cd interflop-stdlib
    Autogen
    Configure --enable-warnings
    Make
    MakeInstall
    Cd ..
}

function install_backend() {
    Clone https://github.com/${REPO}/interflop-backend-$1
    Cd interflop-backend-$1
    Autogen
    Configure --enable-warnings
    Make
    MakeInstall
    Cd ..
}

install_stdlib

backends=(bitmask cancellation ieee mcaint mcaquad verrou vprec)
for backend in ${backends[@]}; do
    install_backend $backend
done

export LD_LIBRARY_PATH=$(interflop-config --libdir):$LD_LIBRARY_PATH
