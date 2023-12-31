/**********************************************************************
 * ISO MPEG Audio Subgroup Software Simulation Group (1996)
 * ISO 13818-3 MPEG-2 Audio Encoder - Lower Sampling Frequency Extension
 *
 * $Id: l3bitstream-pvt.h,v 1.4 2000/03/21 23:02:17 markt Exp $
 *
 * $Log: l3bitstream-pvt.h,v $
 * Revision 1.4  2000/03/21 23:02:17  markt
 * replaced all "gf." by gfp->
 *
 * Revision 1.3  2000/02/01 11:26:32  takehiro
 * scalefactor's structure changed
 *
 * Revision 1.2  1999/12/09 00:44:34  cisc
 * Removed write_ancillary_data() prototype. (No longer used)
 *
 * Revision 1.1.1.1  1999/11/24 08:42:59  markt
 * initial checkin of LAME
 * Starting with LAME 3.57beta with some modifications
 *
 * Revision 1.1  1996/02/14 04:04:23  rowlands
 * Initial revision
 *
 * Received from Mike Coleman
 **********************************************************************/

#ifndef L3BITSTREAM_PVT_H
#define L3BITSTREAM_PVT_H
#include "formatBitstream.h"
#include "l3side.h"
#include "lame.h"
static int encodeSideInfo( lame_global_flags *gfp,III_side_info_t  *si );

static void encodeMainData( lame_global_flags *gfp,
			    int              l3_enc[2][2][576],
			    III_side_info_t  *si,
			    III_scalefac_t   scalefac[2][2] );

static void drain_into_ancillary_data( int lengthInBits );

static void Huffmancodebits( BF_PartHolder **pph, int *ix, gr_info *gi );


#endif
