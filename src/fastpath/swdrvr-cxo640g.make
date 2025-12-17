################################################
#                                              #
#   FastPath Makefile for the CXO640G card     #
#                                              #
#       Milton Ruas, 2017                      #
#       milton-r-silva@alticelabs.com          #
#                                              #
################################################

# Board and CPU identification
export BOARD = CXO640G
export CPU   = pq3

# Base folders (using absolute references)
CURRENT_PATH = $(shell pwd)
FP_FOLDER    = $(word $(words $(subst /, ,$(CURRENT_PATH))),$(subst /, ,$(CURRENT_PATH)))
OLT_DIR      = $(subst /$(FP_FOLDER),,$(shell pwd))
KERNEL_BASE  = /var/lib/jenkins/workspace/OLT1TX_3.20_build-git/olt360/build/boards/CXO640G-MX

# Cross-Compiler
export TOOLCHAIN_BASE_DIR = /opt/eldk/usr
export TOOLCHAIN_BIN_DIR  = $(TOOLCHAIN_BASE_DIR)/bin
export LD_LIBRARY_PATH    = $(TOOLCHAIN_BASE_DIR)/lib
CROSS_COMPILE = ppc_85xxDP-

# Kernel and SDK paths
KERNEL_PATH ?= $(KERNEL_BASE)/lib/linux
SDK_PATH    ?= $(OLT_DIR)/../lib/broadcom-sdk-xgs/sdk-all-switchdrvr-6.5.25/broadcom

# DESTDIR will point to build_dir location (external libs and includes)
ifeq ($(DESTDIR),)
 export BUILDIR = $(OLT_DIR)/../build_dir/CXO640G-MX
endif
export BUILDIR_LOCAL = $(OLT_DIR)/../build_dir_local/CXO640G-MX

# Comilation logging level
export LVL7_MAKEFILE_LOGGING := N
export LVL7_MAKEFILE_DISPLAY_MODE := S

INSTALL_SCRIPT=swdrvr-cxo640g.install

include swdrvr-common.make

