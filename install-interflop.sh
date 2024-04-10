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

function install_backend() {
    echo "Installing backend $1"
    Cd src/backends/interflop-backend-$1
    Autogen
    Configure --enable-warnings ${@:2}
    Make
    MakeInstall
    Cd ${ROOT}
}

# rm -rf src/interflop-stdlib
# rm -rf src/backends/interflop-backend-*
# git submodule update --init --recursive

install_stdlib $@

backends=(bitmask cancellation ieee mcaint mcaquad vprec)
for backend in ${backends[@]}; do
    install_backend $backend $@
done

export LD_LIBRARY_PATH=$(interflop-config --libdir):$LD_LIBRARY_PATH
