#!/bin/sh

mkdir -p m4 src/backends/*/m4
autoreconf -is -I $(realpath src/interflop-stdlib/m4/)
