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
// File Version     :        $Revision: #16 $ 
// Revision: $Id: //dwh/DW_ocb/DW_apb/amba_dev/src/DW_apb_cc_constants.v#16 $ 
--
-- File :                       DW_apb_cc_constants.v
-- Author:                      Chris Gilbert
-- Date :                       $Date: 2014/05/24 $
-- Abstract     :               This module contains definitions that
--                              are configured by coreConsultant
--
-- Modification History:        Refer to CVS log
-- =====================================================================
*/


// Name:         HADDR_WIDTH
// Default:      32
// Values:       32 64
// 
// AHB System Address Width 
// Note that only the lower 32 bits are used to decode APB slave selects (psel_sX) 
// and only the lower 32 bits are passed to the APB bus.
`define HADDR_WIDTH 32


// Name:         PADDR_WIDTH
// Default:      32
// Values:       32 64
// 
// APB System Address Width
`define PADDR_WIDTH 32


// Name:         AHB_DATA_WIDTH
// Default:      32
// Values:       32 64 128 256
// 
// The AHB Databus Width
`define AHB_DATA_WIDTH 32


// Name:         BIG_ENDIAN
// Default:      Little-Endian
// Values:       Little-Endian (0), Big-Endian (1)
// 
// Define the Endianness (Big-Endian or Little-Endian) of the AHB. 
// The APB subsystem is ALWAYS little endian.
`define BIG_ENDIAN 0


// Name:         APB_DATA_WIDTH
// Default:      32
// Values:       8 16 32
// 
// The APB Databus Width
`define APB_DATA_WIDTH 16


// Name:         NUM_APB_SLAVES
// Default:      4
// Values:       1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
// 
// The Number of Slave Ports (1 to 16)
`define NUM_APB_SLAVES 1


// Name:         START_PADDR_0
// Default:      0x00000400
// Values:       0x00000000, ..., 0xfffffc00
// Enabled:      [<functionof> APB_HAS_XDCDR]
// 
// Start Address for APB Slave #0. 
// This is an absolute address value. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define START_PADDR_0 32'h00011000


// Name:         START_PADDR_1
// Default:      0x00000800
// Values:       0x00000000, ..., 0xfffffc00
// Enabled:      NUM_APB_SLAVES>1 && [<functionof> APB_HAS_XDCDR]
// 
// Start Address for APB Slave #1. 
// This is an absolute address value. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define START_PADDR_1 32'h00000800


// Name:         START_PADDR_2
// Default:      0x00000c00
// Values:       0x00000000, ..., 0xfffffc00
// Enabled:      NUM_APB_SLAVES>2 && [<functionof> APB_HAS_XDCDR]
// 
// Start Address for APB Slave #2. 
// This is an absolute address value. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define START_PADDR_2 32'h00000c00


// Name:         START_PADDR_3
// Default:      0x00001000
// Values:       0x00000000, ..., 0xfffffc00
// Enabled:      NUM_APB_SLAVES>3 && [<functionof> APB_HAS_XDCDR]
// 
// Start Address for APB Slave #3. 
// This is an absolute address value. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define START_PADDR_3 32'h00001000


// Name:         START_PADDR_4
// Default:      0x00001400
// Values:       0x00000000, ..., 0xfffffc00
// Enabled:      NUM_APB_SLAVES>4 && [<functionof> APB_HAS_XDCDR]
// 
// Start Address for APB Slave #4. 
// This is an absolute address value. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define START_PADDR_4 32'h00001400


// Name:         START_PADDR_5
// Default:      0x00001800
// Values:       0x00000000, ..., 0xfffffc00
// Enabled:      NUM_APB_SLAVES>5 && [<functionof> APB_HAS_XDCDR]
// 
// Start Address for APB Slave #5. 
// This is an absolute address value. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define START_PADDR_5 32'h00001800


// Name:         START_PADDR_6
// Default:      0x00001c00
// Values:       0x00000000, ..., 0xfffffc00
// Enabled:      NUM_APB_SLAVES>6 && [<functionof> APB_HAS_XDCDR]
// 
// Start Address for APB Slave #6. 
// This is an absolute address value. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define START_PADDR_6 32'h00001c00

//
//Dependencies: The decoder must be configured as internal
//(when APB_HAS_XDCDR = 0).

// Name:         START_PADDR_7
// Default:      0x00002000
// Values:       0x00000000, ..., 0xfffffc00
// Enabled:      NUM_APB_SLAVES>7 && [<functionof> APB_HAS_XDCDR]
// 
// Start Address for APB Slave #7. 
// This is an absolute address value.
`define START_PADDR_7 32'h00002000


// Name:         START_PADDR_8
// Default:      0x00002400
// Values:       0x00000000, ..., 0xfffffc00
// Enabled:      NUM_APB_SLAVES>8 && [<functionof> APB_HAS_XDCDR]
// 
// Start Address for APB Slave #8. 
// This is an absolute address value. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define START_PADDR_8 32'h00002400


// Name:         START_PADDR_9
// Default:      0x00002800
// Values:       0x00000000, ..., 0xfffffc00
// Enabled:      NUM_APB_SLAVES>9 && [<functionof> APB_HAS_XDCDR]
// 
// Start Address for APB Slave #9. 
// This is an absolute address value. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define START_PADDR_9 32'h00002800


// Name:         START_PADDR_10
// Default:      0x00002c00
// Values:       0x00000000, ..., 0xfffffc00
// Enabled:      NUM_APB_SLAVES>10 && [<functionof> APB_HAS_XDCDR]
// 
// Start Address for APB Slave #10. 
// This is an absolute address value. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define START_PADDR_10 32'h00002c00


// Name:         START_PADDR_11
// Default:      0x00003000
// Values:       0x00000000, ..., 0xfffffc00
// Enabled:      NUM_APB_SLAVES>11 && [<functionof> APB_HAS_XDCDR]
// 
// Start Address for APB Slave #11. 
// This is an absolute address value. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define START_PADDR_11 32'h00003000


// Name:         START_PADDR_12
// Default:      0x00003400
// Values:       0x00000000, ..., 0xfffffc00
// Enabled:      NUM_APB_SLAVES>12 && [<functionof> APB_HAS_XDCDR]
// 
// Start Address for APB Slave #12. 
// This is an absolute address value. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define START_PADDR_12 32'h00003400


// Name:         START_PADDR_13
// Default:      0x00003800
// Values:       0x00000000, ..., 0xfffffc00
// Enabled:      NUM_APB_SLAVES>13 && [<functionof> APB_HAS_XDCDR]
// 
// Start Address for APB Slave #13. 
// This is an absolute address value. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define START_PADDR_13 32'h00003800


// Name:         START_PADDR_14
// Default:      0x00003c00
// Values:       0x00000000, ..., 0xfffffc00
// Enabled:      NUM_APB_SLAVES>14 && [<functionof> APB_HAS_XDCDR]
// 
// Start Address for APB Slave #14. 
// This is an absolute address value. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define START_PADDR_14 32'h00003c00


// Name:         START_PADDR_15
// Default:      0x00004000
// Values:       0x00000000, ..., 0xfffffc00
// Enabled:      NUM_APB_SLAVES>15 && [<functionof> APB_HAS_XDCDR]
// 
// Start Address for APB Slave #15. 
// This is an absolute address value. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define START_PADDR_15 32'h00004000


// Name:         END_PADDR_0
// Default:      0x000007ff
// Values:       0x000003ff, ..., 0xffffffff
// Enabled:      [<functionof> APB_HAS_XDCDR]
// 
// End Address for APB Slave #0 
// This is an absolute address value. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define END_PADDR_0 32'h00011fff


// Name:         END_PADDR_1
// Default:      0x00000bff
// Values:       0x000003ff, ..., 0xffffffff
// Enabled:      NUM_APB_SLAVES>1 && [<functionof> APB_HAS_XDCDR]
// 
// End Address for APB Slave #1 
// This is an absolute address value. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define END_PADDR_1 32'h00000bff


// Name:         END_PADDR_2
// Default:      0x00000fff
// Values:       0x000003ff, ..., 0xffffffff
// Enabled:      NUM_APB_SLAVES>2 && [<functionof> APB_HAS_XDCDR]
// 
// End Address for APB Slave #2 
// This is an absolute address value. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define END_PADDR_2 32'h00000fff


// Name:         END_PADDR_3
// Default:      0x000013ff
// Values:       0x000003ff, ..., 0xffffffff
// Enabled:      NUM_APB_SLAVES>3 && [<functionof> APB_HAS_XDCDR]
// 
// End Address for APB Slave #3 
// This is an absolute address value. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define END_PADDR_3 32'h000013ff


// Name:         END_PADDR_4
// Default:      0x000017ff
// Values:       0x000003ff, ..., 0xffffffff
// Enabled:      NUM_APB_SLAVES>4 && [<functionof> APB_HAS_XDCDR]
// 
// End Address for APB Slave #4 
// This is an absolute address value. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define END_PADDR_4 32'h000017ff


// Name:         END_PADDR_5
// Default:      0x00001bff
// Values:       0x000003ff, ..., 0xffffffff
// Enabled:      NUM_APB_SLAVES>5 && [<functionof> APB_HAS_XDCDR]
// 
// End Address for APB Slave #5 
// This is an absolute address value. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define END_PADDR_5 32'h00001bff


// Name:         END_PADDR_6
// Default:      0x00001fff
// Values:       0x000003ff, ..., 0xffffffff
// Enabled:      NUM_APB_SLAVES>6 && [<functionof> APB_HAS_XDCDR]
// 
// End Address for APB Slave #6 
// This is an absolute address value. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define END_PADDR_6 32'h00001fff


// Name:         END_PADDR_7
// Default:      0x000023ff
// Values:       0x000003ff, ..., 0xffffffff
// Enabled:      NUM_APB_SLAVES>7 && [<functionof> APB_HAS_XDCDR]
// 
// End Address for APB Slave #7 
// This is an absolute address value. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define END_PADDR_7 32'h000023ff


// Name:         END_PADDR_8
// Default:      0x000027ff
// Values:       0x000003ff, ..., 0xffffffff
// Enabled:      NUM_APB_SLAVES>8 && [<functionof> APB_HAS_XDCDR]
// 
// End Address for APB Slave #8 
// This is an absolute address value. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define END_PADDR_8 32'h000027ff


// Name:         END_PADDR_9
// Default:      0x00002bff
// Values:       0x000003ff, ..., 0xffffffff
// Enabled:      NUM_APB_SLAVES>9 && [<functionof> APB_HAS_XDCDR]
// 
// End Address for APB Slave #9 
// This is an absolute address value. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define END_PADDR_9 32'h00002bff


// Name:         END_PADDR_10
// Default:      0x00002fff
// Values:       0x000003ff, ..., 0xffffffff
// Enabled:      NUM_APB_SLAVES>10 && [<functionof> APB_HAS_XDCDR]
// 
// End Address for APB Slave #10 
// This is an absolute address value. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define END_PADDR_10 32'h00002fff


// Name:         END_PADDR_11
// Default:      0x000033ff
// Values:       0x000003ff, ..., 0xffffffff
// Enabled:      NUM_APB_SLAVES>11 && [<functionof> APB_HAS_XDCDR]
// 
// End Address for APB Slave #11 
// This is an absolute address value. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define END_PADDR_11 32'h000033ff


// Name:         END_PADDR_12
// Default:      0x000037ff
// Values:       0x000003ff, ..., 0xffffffff
// Enabled:      NUM_APB_SLAVES>12 && [<functionof> APB_HAS_XDCDR]
// 
// End Address for APB Slave #12 
// This is an absolute address value. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define END_PADDR_12 32'h000037ff


// Name:         END_PADDR_13
// Default:      0x00003bff
// Values:       0x000003ff, ..., 0xffffffff
// Enabled:      NUM_APB_SLAVES>13 && [<functionof> APB_HAS_XDCDR]
// 
// End Address for APB Slave #13 
// This is an absolute address value. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define END_PADDR_13 32'h00003bff


// Name:         END_PADDR_14
// Default:      0x00003fff
// Values:       0x000003ff, ..., 0xffffffff
// Enabled:      NUM_APB_SLAVES>14 && [<functionof> APB_HAS_XDCDR]
// 
// End Address for APB Slave #14 
// This is an absolute address value. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define END_PADDR_14 32'h00003fff


// Name:         END_PADDR_15
// Default:      0x000043ff
// Values:       0x000003ff, ..., 0xffffffff
// Enabled:      NUM_APB_SLAVES>15 && [<functionof> APB_HAS_XDCDR]
// 
// End Address for APB Slave #15 
// This is an absolute address value. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define END_PADDR_15 32'h000043ff


`define R0_APB_SA 32'h11000


`define R0_APB_EA 32'h11fff


// Name:         APB_IS_APB3_0
// Default:      false
// Values:       false (0), true (1)
// Enabled:      [<functionof> APB_HAS_XDCDR]
// 
// Select between AMBA 3 APB Slave and AMBA 2 APB Slave. 
// If AMBA 3 APB Slave is selected the additional ports 
// PREADY and PSLVERR are included. 
// This slave has the additional ports PREADY and PSLVERR 
// according to the AMBA3 specification. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define APB_IS_APB3_0 0


// `define APB_APB3_0



// Name:         APB_IS_APB3_1
// Default:      false
// Values:       false (0), true (1)
// Enabled:      NUM_APB_SLAVES>1 && [<functionof> APB_HAS_XDCDR]
// 
// Select between AMBA 3 APB Slave and AMBA 2 APB Slave. 
// If AMBA 3 APB Slave is selected the additional ports 
// PREADY and PSLVERR are included. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define APB_IS_APB3_1 0


// `define APB_APB3_1



// Name:         APB_IS_APB3_2
// Default:      false
// Values:       false (0), true (1)
// Enabled:      NUM_APB_SLAVES>2 && [<functionof> APB_HAS_XDCDR]
// 
// Select between AMBA 3 APB Slave and AMBA 2 APB Slave. 
// If AMBA 3 APB Slave is selected the additional ports 
// PREADY and PSLVERR are included. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define APB_IS_APB3_2 0


// `define APB_APB3_2



// Name:         APB_IS_APB3_3
// Default:      false
// Values:       false (0), true (1)
// Enabled:      NUM_APB_SLAVES>3 && [<functionof> APB_HAS_XDCDR]
// 
// Select between AMBA 3 APB Slave and AMBA 2 APB Slave. 
// If AMBA 3 APB Slave is selected the additional ports 
// PREADY and PSLVERR are included. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define APB_IS_APB3_3 0


// `define APB_APB3_3



// Name:         APB_IS_APB3_4
// Default:      false
// Values:       false (0), true (1)
// Enabled:      NUM_APB_SLAVES>4 && [<functionof> APB_HAS_XDCDR]
// 
// Select between AMBA 3 APB Slave and AMBA 2 APB Slave. 
// If AMBA 3 APB Slave is selected the additional ports 
// PREADY and PSLVERR are included. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define APB_IS_APB3_4 0


// `define APB_APB3_4



// Name:         APB_IS_APB3_5
// Default:      false
// Values:       false (0), true (1)
// Enabled:      NUM_APB_SLAVES>5 && [<functionof> APB_HAS_XDCDR]
// 
// Select between AMBA 3 APB Slave and AMBA 2 APB Slave. 
// If AMBA 3 APB Slave is selected the additional ports 
// PREADY and PSLVERR are included. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define APB_IS_APB3_5 0


// `define APB_APB3_5



// Name:         APB_IS_APB3_6
// Default:      false
// Values:       false (0), true (1)
// Enabled:      NUM_APB_SLAVES>6 && [<functionof> APB_HAS_XDCDR]
// 
// Select between AMBA 3 APB Slave and AMBA 2 APB Slave. 
// If AMBA 3 APB Slave is selected the additional ports 
// PREADY and PSLVERR are included. 
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define APB_IS_APB3_6 0


// `define APB_APB3_6



// Name:         APB_IS_APB3_7
// Default:      false
// Values:       false (0), true (1)
// Enabled:      NUM_APB_SLAVES>7 && [<functionof> APB_HAS_XDCDR]
// 
// Select between AMBA 3 APB Slave and AMBA 2 APB Slave. 
// If AMBA 3 APB Slave is selected the additional ports 
// PREADY and PSLVERR are included. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define APB_IS_APB3_7 0


// `define APB_APB3_7



// Name:         APB_IS_APB3_8
// Default:      false
// Values:       false (0), true (1)
// Enabled:      NUM_APB_SLAVES>8 && [<functionof> APB_HAS_XDCDR]
// 
// Select between AMBA 3 APB Slave and AMBA 2 APB Slave. 
// If AMBA 3 APB Slave is selected the additional ports 
// PREADY and PSLVERR are included. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define APB_IS_APB3_8 0


// `define APB_APB3_8



// Name:         APB_IS_APB3_9
// Default:      false
// Values:       false (0), true (1)
// Enabled:      NUM_APB_SLAVES>9 && [<functionof> APB_HAS_XDCDR]
// 
// Select between AMBA 3 APB Slave and AMBA 2 APB Slave. 
// If AMBA 3 APB Slave is selected the additional ports 
// PREADY and PSLVERR are included. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define APB_IS_APB3_9 0


// `define APB_APB3_9



// Name:         APB_IS_APB3_10
// Default:      false
// Values:       false (0), true (1)
// Enabled:      NUM_APB_SLAVES>10 && [<functionof> APB_HAS_XDCDR]
// 
// Select between AMBA 3 APB Slave and AMBA 2 APB Slave. 
// If AMBA 3 APB Slave is selected the additional ports 
// PREADY and PSLVERR are included. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define APB_IS_APB3_10 0


// `define APB_APB3_10



// Name:         APB_IS_APB3_11
// Default:      false
// Values:       false (0), true (1)
// Enabled:      NUM_APB_SLAVES>11 && [<functionof> APB_HAS_XDCDR]
// 
// Select between AMBA 3 APB Slave and AMBA 2 APB Slave. 
// If AMBA 3 APB Slave is selected the additional ports 
// PREADY and PSLVERR are included. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define APB_IS_APB3_11 0


// `define APB_APB3_11



// Name:         APB_IS_APB3_12
// Default:      false
// Values:       false (0), true (1)
// Enabled:      NUM_APB_SLAVES>12 && [<functionof> APB_HAS_XDCDR]
// 
// Select between AMBA 3 APB Slave and AMBA 2 APB Slave. 
// If AMBA 3 APB Slave is selected the additional ports 
// PREADY and PSLVERR are included. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define APB_IS_APB3_12 0


// `define APB_APB3_12



// Name:         APB_IS_APB3_13
// Default:      false
// Values:       false (0), true (1)
// Enabled:      NUM_APB_SLAVES>13 && [<functionof> APB_HAS_XDCDR]
// 
// Select between AMBA 3 APB Slave and AMBA 2 APB Slave. 
// If AMBA 3 APB Slave is selected the additional ports 
// PREADY and PSLVERR are included. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define APB_IS_APB3_13 0


// `define APB_APB3_13



// Name:         APB_IS_APB3_14
// Default:      false
// Values:       false (0), true (1)
// Enabled:      NUM_APB_SLAVES>14 && [<functionof> APB_HAS_XDCDR]
// 
// Select between AMBA 3 APB Slave and AMBA 2 APB Slave. 
// If AMBA 3 APB Slave is selected the additional ports 
// PREADY and PSLVERR are included. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define APB_IS_APB3_14 0


// `define APB_APB3_14



// Name:         APB_IS_APB3_15
// Default:      false
// Values:       false (0), true (1)
// Enabled:      NUM_APB_SLAVES>15 && [<functionof> APB_HAS_XDCDR]
// 
// Select between AMBA 3 APB Slave and AMBA 2 APB Slave. 
// If AMBA 3 APB Slave is selected the additional ports 
// PREADY and PSLVERR are included. 
//  
// Dependencies: The decoder must be configured as internal 
// (when APB_HAS_XDCDR = 0).
`define APB_IS_APB3_15 0


// `define APB_APB3_15



`define APB_HAS_S0


// `define APB_HAS_S1


// `define APB_HAS_S2


// `define APB_HAS_S3


// `define APB_HAS_S4


// `define APB_HAS_S5


// `define APB_HAS_S6


// `define APB_HAS_S7


// `define APB_HAS_S8


// `define APB_HAS_S9


// `define APB_HAS_S10


// `define APB_HAS_S11


// `define APB_HAS_S12


// `define APB_HAS_S13


// `define APB_HAS_S14


// `define APB_HAS_S15


// Name:         APB_HAS_XDCDR
// Default:      false
// Values:       false (0), true (1)
// 
// If True (1), the decoder is external to the DW_apb. 
// If False (0), the decoder is internal to the DW_apb. 
// For an internal decoder, the addresses need to be supplied 
// by the DW_apb at configuration. 
// An external decoder allows users to connect any decoder
`define APB_HAS_XDCDR 0


`define APB_ENCRYPT

// Internal HADDR_WIDTH, hardcoded to 32.

`define HADDR_WIDTH_INT 32

//Parameter used to compute the bitwidths of signals based on the AHB_DATA_WIDTH (log2 value).

`define HADDR_SEL_WIDTH 0

//Parameter used to compute the bitwidths of signals based on the APB_DATA_WIDTH (log2 value).

`define PADDR_SEL_WIDTH 0


`define APB_HAS_APB4 0
