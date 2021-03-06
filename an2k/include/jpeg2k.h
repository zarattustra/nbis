/**********************************************************************
 * 
 *  This file is part of a fork of NIST Biometric Image Software. 
 *  Modifications to the upstream source code are distributed under the
 *  following terms: 
 * 
 *     Copyright 2013 Michael Chaberski
 * 
 *     Licensed under the Apache License, Version 2.0 (the "License");
 *     you may not use this file except in compliance with the License.
 *     You may obtain a copy of the License at
 * 
 *         http://www.apache.org/licenses/LICENSE-2.0
 * 
 *     Unless required by applicable law or agreed to in writing, software
 *     distributed under the License is distributed on an "AS IS" BASIS,
 *     WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *     See the License for the specific language governing permissions and
 *     limitations under the License.
 * 
 *  The original source code is a work in the public domain. The original 
 *  license and disclaimers are below.
 * 
 *  BEGIN ORIGINAL LICENSE TEXT                                       
 **********************************************************************/
/*******************************************************************************

License: 
This software and/or related materials was developed at the National Institute
of Standards and Technology (NIST) by employees of the Federal Government
in the course of their official duties. Pursuant to title 17 Section 105
of the United States Code, this software is not subject to copyright
protection and is in the public domain. 

This software and/or related materials have been determined to be not subject
to the EAR (see Part 734.3 of the EAR for exact details) because it is
a publicly available technology and software, and is freely distributed
to any interested party with no licensing requirements.  Therefore, it is 
permissible to distribute this software as a free download from the internet.

Disclaimer: 
This software and/or related materials was developed to promote biometric
standards and biometric technology testing for the Federal Government
in accordance with the USA PATRIOT Act and the Enhanced Border Security
and Visa Entry Reform Act. Specific hardware and software products identified
in this software were used in order to perform the software development.
In no case does such identification imply recommendation or endorsement
by the National Institute of Standards and Technology, nor does it imply that
the products and equipment identified are necessarily the best available
for the purpose.

This software and/or related materials are provided "AS-IS" without warranty
of any kind including NO WARRANTY OF PERFORMANCE, MERCHANTABILITY,
NO WARRANTY OF NON-INFRINGEMENT OF ANY 3RD PARTY INTELLECTUAL PROPERTY
or FITNESS FOR A PARTICULAR PURPOSE or for any purpose whatsoever, for the
licensed product, however used. In no event shall NIST be liable for any
damages and/or costs, including but not limited to incidental or consequential
damages of any kind, including economic damage or injury to property and lost
profits, regardless of whether NIST shall be advised, have reason to know,
or in fact shall know of the possibility.

By using this software, you agree to bear all risk relating to quality,
use and performance of the software and/or related materials.  You agree
to hold the Government harmless from any claim arising from your use
of the software.

*******************************************************************************/


/***********************************************************************
      PACKAGE: ANSI/NIST 2007 Standard Reference Implementation

      FILE:    JPEG2K.H

      AUTHORS: Kenneth Ko
      DATE:    12/15/2007

***********************************************************************/
#ifndef _JPEG2K_H
#define _JPEG2K_H

#include <jpegl.h>

#ifdef __NBIS_JASPER__
	#include <jasper/jasper.h>
#endif

#ifdef __NBIS_OPENJPEG__
	#include <openjpeg.h>
#endif

/*********************************************************************/

#ifdef __NBIS_JASPER__
	int jpeg2k_decode_mem(IMG_DAT **, int *, unsigned char *, const int);
	int img_dat_generate(IMG_DAT **, jas_image_t *);
#endif

#ifdef __NBIS_OPENJPEG__
	int openjpeg2k_decode_mem(IMG_DAT **, int *, unsigned char *, const int);
/*
	int image_to_raw(opj_image_t *, signed char *, unsigned char *);
*/
        int image_to_raw(opj_image_t *, unsigned char *);
        int img_dat_generate_openjpeg(IMG_DAT **oimg_dat, opj_image_t *image, unsigned char *);
	int get_file_format(char *);
#endif

#endif /* !_JPEG2K_H */ 
