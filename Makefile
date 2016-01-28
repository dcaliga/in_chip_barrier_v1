#
# Copyright 2003 SRC Computers, LLC  All Rights Reserved.
#
#       Manufactured in the United States of America.
#
# SRC Computers, LLC
# 4240 N Nevada Avenue
# Colorado Springs, CO 80907
# (v) (719) 262-0213
# (f) (719) 262-0223
#
# No permission has been granted to distribute this software
# without the express permission of SRC Computers, LLC
#
# This program is distributed WITHOUT ANY WARRANTY OF ANY KIND.
#

# ----------------------------------
# User defines FILES, MAPFILES, and BIN here
# ----------------------------------
FILES       = main.c

MAPFILES    = ex_in_chip_barrier.mc

BIN         = ex_in_chip_barrier

MAPTARGET = map_m
# -----------------------------------
# User defined macros info supplied here
#
# (Leave commented out if not used)
# -----------------------------------
#MACROS     =

#MY_BLKBOX  =
#MY_MACRO_DIR   =
#MY_INFO    =
# -----------------------------------
# User supplied MCC and MFTN flags
# -----------------------------------

MCCFLAGS    =
MFTNFLAGS   =

# -----------------------------------
# User supplied flags for C & Fortran compilers
# -----------------------------------

CC      = gcc
LD      = gcc

FFLAGS      =

# -----------------------------------
# VCS simulation settings
# (Set as needed, otherwise just leave commented out)
# -----------------------------------

#USEVCS     = yes   # YES or yes to use vcs instead of vcsi
#VCSDUMP    = yes   # YES or yes to generate vcd+ trace dump
# -----------------------------------
# No modifications are required below
# -----------------------------------
MAKIN   ?= $(MC_ROOT)/opt/srcci/comp/lib/AppRules.make
include $(MAKIN)
