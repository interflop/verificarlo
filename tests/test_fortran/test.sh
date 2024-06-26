#!/bin/bash
set -e

source ../paths.sh

if [ -z "${FLANG_PATH}" ]; then
    echo "this test is not run when not using --with-flang"
    # Exit with 77 to mark the test skipped
    # https://www.gnu.org/software/automake/manual/html_node/Scripts_002dbased-Testsuites.html
    exit 77
fi

export VFC_BACKENDS="libinterflop_mca.so"

# Compile newton.f90 using MCA lib instrumentation
verificarlo-f -c newton.f90 -o newton.o
verificarlo-f newton.o -o newton

# Check that two executions differ
./newton >output1
./newton >output2

if diff output1 output2; then
    echo "output should differ"
    exit 1
else
    echo "test successed"
    exit 0
fi
