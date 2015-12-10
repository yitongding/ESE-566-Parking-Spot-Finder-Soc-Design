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
// Release version :  2.03a
// File Version     :        $Revision: #5 $ 
// Revision: $Id: //dwh/DW_ocb/DW_apb/amba_dev/src/DW_apb_constants.v#5 $ 
--
-- File :                       DW_apb_constants.v
-- Author:                      Chris Gilbert
-- Date :                       $Date: 2014/05/24 $
-- Abstract     :               This module contains definitions that 
--                              are used by the DW_apb_ahbsif module.
--
--                              These definitions are included as a
--                              separate module as this is the easiest
--                              way of packaging them, since the actual
--                              values of these constants depends on the
--                              configuration of the APB system.
--
-- Modification History:        Refer to CVS log
-- =====================================================================
*/


// Name:         MAX_APB_SLAVES
// Default:      16
// Values:       -2147483648, ..., 2147483647
// 
// Maximum number of slaves in subsystem
`define MAX_APB_SLAVES 16


// Name:         MAX_AHB_DATA_WIDTH
// Default:      256
// Values:       -2147483648, ..., 2147483647
// 
// Maximum AHB Data Width
`define MAX_AHB_DATA_WIDTH 256


// Name:         MAX_APB_DATA_WIDTH
// Default:      32
// Values:       -2147483648, ..., 2147483647
// 
// Maximum APB Data Width
`define MAX_APB_DATA_WIDTH 32

//
// Not defined as a reuse pragma so macro will not be resolved.
// For testbench purposes
//
`define PRDATABUS_WIDTH `APB_DATA_WIDTH*`NUM_APB_SLAVES


// Name:         MAX_PRDATABUS_WIDTH
// Default:      512 ([<functionof> * MAX_APB_DATA_WIDTH MAX_APB_SLAVES 32])
// Values:       -2147483648, ..., 2147483647
// 
// Maximum width of bussed prdata bus
`define MAX_PRDATABUS_WIDTH 512


// Name:         HWDATA32_WIDTH
// Default:      32
// Values:       -2147483648, ..., 2147483647
// 
// Maximum width of data to store
`define HWDATA32_WIDTH 32


// Name:         APB_HAS_APB3
// Default:      0 (APB_IS_APB3_0 || APB_IS_APB3_1 || APB_IS_APB3_2 || APB_IS_APB3_3 
//               || APB_IS_APB3_4 || APB_IS_APB3_5 || APB_IS_APB3_6 || APB_IS_APB3_7 
//               || APB_IS_APB3_8 || APB_IS_APB3_9 || APB_IS_APB3_10 || APB_IS_APB3_11 
//               || APB_IS_APB3_12 || APB_IS_APB3_13 || APB_IS_APB3_14 || 
//               APB_IS_APB3_15)
// Values:       -2147483648, ..., 2147483647
// 
// IF APB HAS A APB3 SLAVE
`define APB_HAS_APB3 0
