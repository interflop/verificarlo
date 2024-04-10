#!/bin/bash

ROOT=$PWD

function check() {
    if [[ $? != 0 ]]; then
        echo "Error"
        exit 1
    fi
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
    echo "Installing stdlib"
    echo "Arguments: $@"
    Cd src/interflop-stdlib
    Autogen
    Configure --enable-warnings $@
    Make
    MakeInstall
    Cd ${ROOT}
}

install_stdlib $@

# export LD_LIBRARY_PATH=$(interflop-config --libdir):$LD_LIBRARY_PATH
