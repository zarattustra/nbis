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

# SubTree:              /NBIS/Main/pcasys/src/lib/pca
# Filename:             Makefile
# Integrators:          Kenneth Ko
# Organization:         NIST/ITL
# Host System:          GNU GCC/GMAKE GENERIC (UNIX)
# Date Created:         08/20/2006
#
# ******************************************************************************
#
# Makefile contains the variables to build library - "libpca".
#
# ******************************************************************************
THIS_DIR := $(dir ./$(lastword $(MAKEFILE_LIST)))
include $(THIS_DIR)/../../../p_rules.mak
#
LIBRARY	:= libpca
#
SRC	:= combine.c \
	eigen.c \
	enhnc.c \
	inits.c \
	mlp_sing.c \
	pnn.c \
	pseudo.c \
	r92.c \
	r92a.c \
	readfing.c \
	results.c \
	ridge.c \
	sgmnt.c \
	trnsfrm.c

#
EXT_INCS	:= -I$(EXPORTS_INC_DIR)
#
include $(DIR_ROOT_BUILDUTIL)/lib.mak
#
