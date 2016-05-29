#**********************************************************************
#
# This file is part of a fork of NIST Biometric Image Software. 
# Modifications to the upstream source code are distributed under the
# following terms: 
#
#    Copyright 2013 Michael Chaberski
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
#
# The original source code is a work in the public domain. The original 
# license and disclaimers are below.
#
# BEGIN ORIGINAL LICENSE TEXT
#*******************************************************************************
#
# License: 
# This software and/or related materials was developed at the National Institute
# of Standards and Technology (NIST) by employees of the Federal Government
# in the course of their official duties. Pursuant to title 17 Section 105
# of the United States Code, this software is not subject to copyright
# protection and is in the public domain. 
#
# This software and/or related materials have been determined to be not subject
# to the EAR (see Part 734.3 of the EAR for exact details) because it is
# a publicly available technology and software, and is freely distributed
# to any interested party with no licensing requirements.  Therefore, it is 
# permissible to distribute this software as a free download from the internet.
#
# Disclaimer: 
# This software and/or related materials was developed to promote biometric
# standards and biometric technology testing for the Federal Government
# in accordance with the USA PATRIOT Act and the Enhanced Border Security
# and Visa Entry Reform Act. Specific hardware and software products identified
# in this software were used in order to perform the software development.
# In no case does such identification imply recommendation or endorsement
# by the National Institute of Standards and Technology, nor does it imply that
# the products and equipment identified are necessarily the best available
# for the purpose.
#
# This software and/or related materials are provided "AS-IS" without warranty
# of any kind including NO WARRANTY OF PERFORMANCE, MERCHANTABILITY,
# NO WARRANTY OF NON-INFRINGEMENT OF ANY 3RD PARTY INTELLECTUAL PROPERTY
# or FITNESS FOR A PARTICULAR PURPOSE or for any purpose whatsoever, for the
# licensed product, however used. In no event shall NIST be liable for any
# damages and/or costs, including but not limited to incidental or consequential
# damages of any kind, including economic damage or injury to property and lost
# profits, regardless of whether NIST shall be advised, have reason to know,
# or in fact shall know of the possibility.
#
# By using this software, you agree to bear all risk relating to quality,
# use and performance of the software and/or related materials.  You agree
# to hold the Government harmless from any claim arising from your use
# of the software.
#
#*******************************************************************************
# Project:              NIST Fingerprint Software
# SubTree:              /NBIS/Main
# Filename:             rules.mak.src
# Integrators:          Kenneth Ko
# Organization:         NIST/ITL
# Host System:          GNU GCC/GMAKE GENERIC (UNIX)
# Date Created:         08/20/2006
# Date Updated:		03/27/2007
#                       10/23/2007
#                       04/02/2008
#			09/09/2008 by Joseph C. Konczal
#                       12/10/2008 by Kenneth Ko - Fix to support 64-bit
#                       12/16/2008 by Kenneth Ko - Add command line option for
#                                                  HPUX
#			05/04/2011 by Kenneht Ko
#
# ******************************************************************************
#
# This rules file contains all the necessary variables to build "NBIS".
#
# ******************************************************************************
TOP := $(dir $(lastword $(MAKEFILE_LIST)))
TOP := $(subst //,/,$(TOP))
TOP := $(patsubst %/,%,$(TOP))
SHELL	:= /bin/sh
MKDIR_P                     := mkdir -p
#
# ------------------------------------------------------------------------------
#
PROJ_NAME	:= nbis

DEBIAN_PKG_NAME := nbis

#
# ---------------------- Variables set by setup.sh------------------------------
#
PACKAGES			:= commonnbis an2k bozorth3 imgtools mindtct nfseg nfiq pcasys
#
DIR_ROOT			:= $(TOP)
X11_FLAG			:= 0
X11_INC				:= /usr
X11_LIB				:= /usr

ENDIAN_FLAG			:= -D__NBISLE__
NBIS_OPENJPEG_FLAG		:= -D__NBIS_OPENJPEG__
NBIS_PNG_FLAG			:= -D__NBIS_PNG__

# DESTDIR defaults to empty string
INSTALL_ROOT                    ?= $(DESTDIR)/usr
INSTALL_ROOT_INC_DIR		:= $(INSTALL_ROOT)/include/$(DEBIAN_PKG_NAME)
INSTALL_ROOT_BIN_DIR		:= $(INSTALL_ROOT)/bin
INSTALL_ROOT_LIB_DIR		:= $(INSTALL_ROOT)/lib/$(DEB_HOST_MULTIARCH)
INSTALL_RUNTIME_DATA_DIR	:= $(INSTALL_ROOT)/share/$(DEBIAN_PKG_NAME)
INSTALL_ROOT_MAN_DIR        := $(INSTALL_ROOT)/share/man/man1

INSTALL_RUNTIME_DATA_DIR_FLAG   := -DINSTALL_RUNTIME_DATA_DIR=\"$(INSTALL_RUNTIME_DATA_DIR)\"
INSTALL_BIN_DIR_FLAG            := -DINSTALL_BIN_DIR=\"$(INSTALL_ROOT_BIN_DIR)\"
AN2K_RUNTIME_DATA_DIR  := $(INSTALL_RUNTIME_DATA_DIR)/an2k
AN2K_RUNTIME_DATA_DIR_FLAG := -DAN2K_RUNTIME_DATA_DIR=\"$(AN2K_RUNTIME_DATA_DIR)\"
#
# ------------------------------------------------------------------------------
#
EXPORTS_DIR	:= $(DIR_ROOT)/exports
EXPORTS_INC_DIR	:= $(EXPORTS_DIR)/include
EXPORTS_LIB_DIR	:= $(EXPORTS_DIR)/lib
EXPORTS_DIRS	:= $(EXPORTS_DIR) \
		$(EXPORTS_INC_DIR) \
		$(EXPORTS_LIB_DIR) 
# 
# ------------------------------------------------------------------------------
#
RUNTIME_DATA_PACKAGES		:= an2k nfiq pcasys
RUNTIME_DATA_DIR		:= runtimedata
#
# ------------------------------------------------------------------------------
#
DOC_DIR		:= $(DIR_ROOT)/doc
DOC_CATS_DIR	:= $(DOC_DIR)/catalogs
DOC_INSTALL_DIR	:= $(DOC_DIR)/install
DOC_REFS_DIR	:= $(DOC_DIR)/refs
DOC_DIRS	:= $(DOC_REFS_DIR)
#
# ------------------------------------------------------------------------------
#
PCASYS_X11_DIR	:= $(DIR_ROOT)/pcasys/obj/src/lib/pca/x11
#
# ------------------------------------------------------------------------------
#
MAN_SRC_DIR		:= $(DIR_ROOT)/man/man1
#
# ------------------------------------------------------------------------------
#
#EXTRA_DIR	:= $(MAN_DIR) \
#		$(DOC_DIR)
#
# ------------------------------------------------------------------------------
#
DIR_ROOT_BUILDUTIL:= $(DIR_ROOT)/buildutil
#
# ------------------------------------------------------------------------------
#
CC		:= $(shell which gcc)
DEB_BUILD_HARDENING := 1
DEB_BUILD_HARDENING_FORTIFY := 1
CFLAGS		:= -O2 -w -ansi -D_FORTIFY_SOURCE=2 -D_POSIX_SOURCE $(ENDIAN_FLAG) $(NBIS_JASPER_FLAG) $(NBIS_OPENJPEG_FLAG) $(NBIS_PNG_FLAG) $(ARCH_FLAG) $(INSTALL_RUNTIME_DATA_DIR_FLAG) $(INSTALL_BIN_DIR_FLAG) $(AN2K_RUNTIME_DATA_DIR_FLAG)
#CFLAGS	:= -g $(ENDIAN_FLAG) $(NBIS_JASPER_FLAG) $(NBIS_PNG_FLAG) $(ARCH_FLAG)
CDEFS		:=
CCC		:= $(CC) $(CFLAGS) $(CDEFS)
LDFLAGS	:= $(LDFLAGS) $(ARCH_FLAG) -lopenjpeg -lpng12
M		:= -M
#M		:= -MM
#
UNAME		:= $(shell uname)
#
AWK		:= $(shell which awk)
#
OWNER		:= $(shell whoami)
GROUP		:= $(shell id -gn)
#
PERMS1	:= 755
PERMS2	:= 644
#
INSTALL_CMD := $(shell which install)
INSTALL		:= $(shell which install)
INSTALL_BIN	:= $(INSTALL) -p -o $(OWNER) -g $(GROUP) -m $(PERMS1) 
INSTALL_LIB	:= $(INSTALL) -p -o $(OWNER) -g $(GROUP) -m $(PERMS2)
RM		:= $(shell which rm) -f
MV		:= $(shell which mv) -f
CP		:= $(shell which cp)
CAT		:= $(shell which cat)
SED		:= $(shell which sed)
CHMOD		:= $(shell which chmod)
MKDIR		:= $(shell which mkdir)
TOUCH		:= $(shell which touch)
AR		:= $(shell which ar)
#

MANPAGES := cmbmcs.1 mlp.1 nfseg.1 chgdesc.1 datainfo.1 mktran.1 sd_rfmt.1 iaf2an2k.1 asc2bin.1 diffbyts.1 djpegl.1 znormpat.1 kltran.1 intr2not.1 optrwsgw.1 rwpics.1 rdwsqcom.1 djpeglsd.1 mkoas.1 optrws.1 optosf.1 cropcoeff.1 an2k2txt.1 an2ktool.1 bozorth3.1 lintran.1 dwsq.1 dlwsqcom.1 cjpegl.1 histogen.1 mindtct.1 fixwts.1 chkan2k.1 rgb2ycc.1 mlpfeats.1 an2k2iaf.1 stackms.1 pcasys.1 cwsq.1 txt2an2k.1 bin2asc.1 wrwsqcom.1 fing2pat.1 ycc2rgb.1 nfiq.1 meancov.1 dwsq14.1 not2intr.1 eva_evt.1 oas2pics.1 znormdat.1
