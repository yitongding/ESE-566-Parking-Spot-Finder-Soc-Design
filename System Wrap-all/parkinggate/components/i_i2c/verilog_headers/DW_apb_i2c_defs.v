/*
 ------------------------------------------------------------------------
--
//  ------------------------------------------------------------------------
//
//                    (C) COPYRIGHT 2003 - 2014 SYNOPSYS, INC.
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
// Release version :  1.22a
// File Version     :        $Revision: #4 $ 
// Revision: $Id: //dwh/DW_ocb/DW_apb_i2c/amba_dev/sim/verilog_header_file/DW_apb_i2c_defs.v#4 $ 
*/

`define i_i2c_DW_APB_I2C_BASE 32'h00011000


`define i_i2c_IC_CON_OFFSET            8'h00
`define i_i2c_IC_TAR_OFFSET            8'h04
`define i_i2c_IC_SAR_OFFSET            8'h08
`define i_i2c_IC_HS_MADDR_OFFSET       8'h0c
`define i_i2c_IC_DATA_CMD_OFFSET       8'h10
`define i_i2c_IC_SS_HCNT_OFFSET        8'h14
`define i_i2c_IC_SS_LCNT_OFFSET        8'h18
`define i_i2c_IC_FS_HCNT_OFFSET        8'h1c
`define i_i2c_IC_FS_LCNT_OFFSET        8'h20
`define i_i2c_IC_HS_HCNT_OFFSET        8'h24
`define i_i2c_IC_HS_LCNT_OFFSET        8'h28
`define i_i2c_IC_INTR_STAT_OFFSET      8'h2c
`define i_i2c_IC_INTR_MASK_OFFSET      8'h30
`define i_i2c_IC_RAW_INTR_STAT_OFFSET  8'h34
`define i_i2c_IC_RX_TL_OFFSET          8'h38
`define i_i2c_IC_TX_TL_OFFSET          8'h3c
`define i_i2c_IC_CLR_INTR_OFFSET       8'h40
`define i_i2c_IC_CLR_RX_UNDER_OFFSET   8'h44
`define i_i2c_IC_CLR_RX_OVER_OFFSET    8'h48
`define i_i2c_IC_CLR_TX_OVER_OFFSET    8'h4c
`define i_i2c_IC_CLR_RD_REQ_OFFSET     8'h50
`define i_i2c_IC_CLR_TX_ABRT_OFFSET    8'h54
`define i_i2c_IC_CLR_RX_DONE_OFFSET    8'h58
`define i_i2c_IC_CLR_ACTIVITY_OFFSET   8'h5c
`define i_i2c_IC_CLR_STOP_DET_OFFSET   8'h60
`define i_i2c_IC_CLR_START_DET_OFFSET  8'h64
`define i_i2c_IC_CLR_GEN_CALL_OFFSET   8'h68
`define i_i2c_IC_ENABLE_OFFSET         8'h6c
`define i_i2c_IC_STATUS_OFFSET         8'h70
`define i_i2c_IC_TXFLR_OFFSET          8'h74
`define i_i2c_IC_RXFLR_OFFSET          8'h78
`define i_i2c_IC_SRESET_OFFSET         8'h7c
`define i_i2c_IC_TX_ABRT_SOURCE_OFFSET 8'h80
`define i_i2c_IC_VERSION_ID_OFFSET     8'hf8
`define i_i2c_IC_DMA_CR_OFFSET         8'h88
`define i_i2c_IC_DMA_TDLR_OFFSET       8'h8c
`define i_i2c_IC_DMA_RDLR_OFFSET       8'h90
`define i_i2c_IC_PARAM_1_OFFSET        8'hf4
`define i_i2c_IC_COMP_VERSION_OFFSET   8'hf8
`define i_i2c_IC_COMP_TYPE_OFFSET      8'hfc
`define i_i2c_IC_CON            (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_CON_OFFSET)
`define i_i2c_IC_TAR            (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_TAR_OFFSET)
`define i_i2c_IC_SAR            (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_SAR_OFFSET)
`define i_i2c_IC_HS_MADDR       (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_HS_MADDR_OFFSET)
`define i_i2c_IC_DATA_CMD       (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_DATA_CMD_OFFSET)
`define i_i2c_IC_SS_HCNT        (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_SS_HCNT_OFFSET)
`define i_i2c_IC_SS_LCNT        (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_SS_LCNT_OFFSET)
`define i_i2c_IC_FS_HCNT        (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_FS_HCNT_OFFSET)
`define i_i2c_IC_FS_LCNT        (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_FS_LCNT_OFFSET)
`define i_i2c_IC_HS_HCNT        (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_HS_HCNT_OFFSET)
`define i_i2c_IC_HS_LCNT        (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_HS_LCNT_OFFSET)
`define i_i2c_IC_INTR_STAT      (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_INTR_STAT_OFFSET)
`define i_i2c_IC_INTR_MASK      (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_INTR_MASK_OFFSET)
`define i_i2c_IC_RAW_INTR_STAT  (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_RAW_INTR_STAT_OFFSET)
`define i_i2c_IC_RX_TL          (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_RX_TL_OFFSET)
`define i_i2c_IC_TX_TL          (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_TX_TL_OFFSET)
`define i_i2c_IC_CLR_INTR       (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_CLR_INTR_OFFSET)
`define i_i2c_IC_CLR_RX_UNDER   (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_CLR_RX_UNDER_OFFSET)
`define i_i2c_IC_CLR_RX_OVER    (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_CLR_RX_OVER_OFFSET)
`define i_i2c_IC_CLR_TX_OVER    (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_CLR_TX_OVER_OFFSET)
`define i_i2c_IC_CLR_RD_REQ     (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_CLR_RD_REQ_OFFSET)
`define i_i2c_IC_CLR_TX_ABRT    (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_CLR_TX_ABRT_OFFSET)
`define i_i2c_IC_CLR_RX_DONE    (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_CLR_RX_DONE_OFFSET)
`define i_i2c_IC_CLR_ACTIVITY   (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_CLR_ACTIVITY_OFFSET)
`define i_i2c_IC_CLR_STOP_DET   (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_CLR_STOP_DET_OFFSET)
`define i_i2c_IC_CLR_START_DET  (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_CLR_START_DET_OFFSET)
`define i_i2c_IC_CLR_GEN_CALL   (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_CLR_GEN_CALL_OFFSET)
`define i_i2c_IC_ENABLE         (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_ENABLE_OFFSET)
`define i_i2c_IC_STATUS         (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_STATUS_OFFSET)
`define i_i2c_IC_TXFLR          (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_TXFLR_OFFSET)
`define i_i2c_IC_RXFLR          (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_RXFLR_OFFSET)
`define i_i2c_IC_SRESET         (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_SRESET_OFFSET)
`define i_i2c_IC_TX_ABRT_SOURCE (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_TX_ABRT_SOURCE_OFFSET)
`define i_i2c_IC_VERSION_ID     (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_VERSION_ID_OFFSET)
`define i_i2c_IC_DMA_CR         (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_DMA_CR_OFFSET)
`define i_i2c_IC_DMA_TDLR       (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_DMA_TDLR_OFFSET)
`define i_i2c_IC_DMA_RDLR       (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_DMA_RDLR_OFFSET)
`define i_i2c_IC_COMP_PARAM_1   (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_COMP_PARAM_1_OFFSET)
`define i_i2c_IC_COMP_VERSION   (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_COMP_VERSION_OFFSET)
`define i_i2c_IC_COMP_TYPE      (`i_i2c_DW_APB_I2C_BASE + `i_i2c_IC_COMP_TYPE_OFFSET)
`define I2Ci_i2c_PING_1BIT_WR     (`i_i2c_IC_TAR)

