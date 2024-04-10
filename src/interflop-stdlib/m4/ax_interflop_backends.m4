# SYNOPSIS
#
#   AX_INTERFLOP_BACKENDS
#
# DESCRIPTION
#
# Include the interflop-backends for the configure.ac file.
#
# List of the backends:
#  - interflop-backend-bitmask
#  - interflop-backend-cancellation 
#  - interflop-backend-ieee 
#  - interflop-backend-mcaint 
#  - interflop-backend-mcaquad 
#  - interflop-backend-vprec
#  - interflop-backend-verrou
#  - interflop-backend-checkfloatmax
#  - interflop-backend-checkdenormal
#  - interflop-backend-checkcancellation

AC_DEFUN([AX_INTERFLOP_BACKENDS], [
    # Verificarlo backends
    if test -d "$srcdir/src/backends/interflop-backend-bitmask"; then
        AC_CONFIG_SUBDIRS([src/backends/interflop-backend-bitmask])
    fi
    if test -d "$srcdir/src/backends/interflop-backend-cancellation"; then
        AC_CONFIG_SUBDIRS([src/backends/interflop-backend-cancellation])
    fi
    if test -d "$srcdir/src/backends/interflop-backend-ieee"; then
        AC_CONFIG_SUBDIRS([src/backends/interflop-backend-ieee])
    fi
    if test -d "$srcdir/src/backends/interflop-backend-mcaint"; then
        AC_CONFIG_SUBDIRS([src/backends/interflop-backend-mcaint])
    fi
    if test -d "$srcdir/src/backends/interflop-backend-mcaquad"; then
        AC_CONFIG_SUBDIRS([src/backends/interflop-backend-mcaquad])
    fi
    if test -d "$srcdir/src/backends/interflop-backend-vprec"; then
        AC_CONFIG_SUBDIRS([src/backends/interflop-backend-vprec])
    fi
    # Verrou backends
    if test -d "$srcdir/src/backends/interflop-backend-verrou"; then
        AC_CONFIG_SUBDIRS([src/backends/interflop-backend-verrou])
    fi
    if test -d "$srcdir/src/backends/interflop-backend-checkfloatmax"; then
        AC_CONFIG_SUBDIRS([src/backends/interflop-backend-checkfloatmax])
    fi
    if test -d "$srcdir/src/backends/interflop-backend-checkdenormal"; then
        AC_CONFIG_SUBDIRS([src/backends/interflop-backend-checkdenormal])
    fi
    if test -d "$srcdir/src/backends/interflop-backend-checkcancellation"; then
        AC_CONFIG_SUBDIRS([src/backends/interflop-backend-checkcancellation])
    fi    
])