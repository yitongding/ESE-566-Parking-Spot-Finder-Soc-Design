/*
------------------------------------------------------------------------
--
//  ------------------------------------------------------------------------
//
//                    (C) COPYRIGHT 2002 - 2014 SYNOPSYS, INC.
//                            ALL RIGHTS RESERVED
//
//  This software and the associated documentation are confidential and
//  proprietary to Synopsys, Inc.  Your use or disclosure of this
//  software is subject to the terms and conditions of a written
//  license agreement between you, or your company, and Synopsys, Inc.
//
// The entire notice above must be reproduced on all authorized copies.
//
//  ------------------------------------------------------------------------

// 
// Release version :  2.11a
// File Version     :        $Revision: #5 $ 
// Revision: $Id: //dwh/DW_ocb/DW_ahb/amba_dev/src/DW_ahb_constants.v#5 $ 
--
-- File :                       DW_ahb_constants.v
-- Author:                      Ray Beechinor 
-- Date :                       $Date: 2014/05/23 $ 
-- Abstract     :               Auxiliary Parameter File for DW_ahb
--                              and associated files.  Contains
--                              parameters used in DW_ahb 
--                              which are not
--                              directly configured by the user 
--                              in coreConsultant
--
*/


// Name:         VISIBLE_0
// Default:      3
// Values:       -2147483648, ..., 2147483647
// 
// Visibility Control of Arbiter Slave
`define VISIBLE_0 3


// Name:         HSEL_ONLY_S0
// Default:      0
// Values:       -2147483648, ..., 2147483647
// 
// Generate Only Hsel for Arbiter Slave
`define HSEL_ONLY_S0 0


// Name:         ALIAS_S0
// Default:      0
// Values:       -2147483648, ..., 2147483647
// 
// Slave Alias for Arbiter
`define ALIAS_S0 0


// Name:         SPLIT_CAPABLE_0
// Default:      0
// Values:       -2147483648, ..., 2147483647
// 
// Is Arbiter Split-capable?
`define SPLIT_CAPABLE_0 0


// Name:         NUM_INT_MASTERS
// Default:      2 ([<functionof> + work.DW_ahb_cc_constants.v.NUM_AHB_MASTERS 1 
//               -1])
// Values:       2, ..., 16
// 
// Internal Master PortCount
`define NUM_INT_MASTERS 2


// Name:         NUM_INT_SLAVES
// Default:      3 ([<functionof> + work.DW_ahb_cc_constants.v.NUM_IAHB_SLAVES 1 
//               -1])
// Values:       2, ..., 31
// 
// Internal Master PortCount
`define NUM_INT_SLAVES 3


// Name:         HRESPBUS_WIDTH
// Default:      6 ([<functionof> * ([<functionof> + 
//               work.DW_ahb_cc_constants.v.NUM_IAHB_SLAVES 1 -1]) 2 -1])
// Values:       2, ..., 62
// 
// Internal HTRANS Bus Width
`define HRESPBUS_WIDTH 6


// Name:         HTRANSBUS_WIDTH
// Default:      4 ([<functionof> * ([<functionof> + 
//               work.DW_ahb_cc_constants.v.NUM_AHB_MASTERS 1 -1]) 2 -1])
// Values:       2, ..., 32
// 
// Internal HTRANS Bus Width
`define HTRANSBUS_WIDTH 4


// Name:         HSIZEBUS_WIDTH
// Default:      6 ([<functionof> * ([<functionof> + 
//               work.DW_ahb_cc_constants.v.NUM_AHB_MASTERS 1 -1]) 3 -1])
// Values:       3, ..., 48
// 
// HSIZE Address Bus Width
`define HSIZEBUS_WIDTH 6


// Name:         HBURSTBUS_WIDTH
// Default:      6 ([<functionof> * ([<functionof> + 
//               work.DW_ahb_cc_constants.v.NUM_AHB_MASTERS 1 -1]) 3 -1])
// Values:       3, ..., 48
// 
// HBURST Address Bus Width
`define HBURSTBUS_WIDTH 6


// Name:         HPROTBUS_WIDTH
// Default:      8 ([<functionof> * ([<functionof> + 
//               work.DW_ahb_cc_constants.v.NUM_AHB_MASTERS 1 -1]) 4 -1])
// Values:       4, ..., 96
// 
// HPROT Address Bus Width
`define HPROTBUS_WIDTH 8


// Name:         HWRITEBUS_WIDTH
// Default:      2 ([<functionof> + work.DW_ahb_cc_constants.v.NUM_AHB_MASTERS 1 
//               -1])
// Values:       1, ..., 16
// 
// HWRITE Address Bus Width
`define HWRITEBUS_WIDTH 2


// Name:         HREADY_WIDTH
// Default:      3 ([<functionof> + work.DW_ahb_cc_constants.v.NUM_IAHB_SLAVES 1 
//               -1])
// Values:       1, ..., 32
// 
// HWRITE Address Bus Width
`define HREADY_WIDTH 3


// Name:         INTERNAL_HSEL
// Default:      4 ([<functionof> + work.DW_ahb_cc_constants.v.NUM_IAHB_SLAVES 2 
//               -1])
// Values:       -2147483648, ..., 2147483647
// 
// InternalBusWidth
`define INTERNAL_HSEL 4


// Name:         SPLITBUS_WIDTH
// Default:      32 ([<functionof> * work.DW_ahb_cc_constants.v.NUM_IAHB_SLAVES 16 
//               -1])
// Values:       -2147483648, ..., 2147483647
// 
// HWRITE Address Bus Width
`define SPLITBUS_WIDTH 32


// Name:         HSPLIT_BUSWIDTH
// Default:      4 ([<functionof> * work.DW_ahb_cc_constants.v.NUM_IAHB_SLAVES 
//               NUM_INT_MASTERS -1])
// Values:       -2147483648, ..., 2147483647
// 
// HWRITE Address Bus Width
`define HSPLIT_BUSWIDTH 4


// Name:         BUS_AHB_CCL_WIDTH
// Default:      480 ([<functionof> * work.DW_ahb_cc_constants.v.AHB_CCL_WIDTH 15 
//               -1])
// Values:       -2147483648, ..., 2147483647
// 
// Bussed Counter Width
`define BUS_AHB_CCL_WIDTH 480


// Name:         AHB_CCL_BUS_WIDTH
// Default:      32 ([<functionof> * work.DW_ahb_cc_constants.v.AHB_CCL_WIDTH 
//               work.DW_ahb_cc_constants.v.NUM_AHB_MASTERS -1])
// Values:       -2147483648, ..., 2147483647
// 
// Required bus width for icl bus.
`define AHB_CCL_BUS_WIDTH 32

`define NC_NB_NP_O  4'b0000
`define NC_NB_NP_D  4'b0001
`define NC_NB_P_O   4'b0010
`define NC_NB_P_D   4'b0011

`define NC_B_NP_O   4'b0100
`define NC_B_NP_D   4'b0101
`define NC_B_P_O    4'b0110
`define NC_B_P_D    4'b0111

`define C_NB_NP_O   4'b1000
`define C_NB_NP_D   4'b1001
`define C_NP_P_O    4'b1010
`define C_NP_P_D    4'b1011

`define C_B_NP_O    4'b1100
`define C_B_NP_D    4'b1101
`define C_B_P_O     4'b1110
`define C_B_P_D     4'b1111
