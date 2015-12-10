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
// File Version     :        $Revision: #40 $ 
// Revision: $Id: //dwh/DW_ocb/DW_apb_i2c/amba_dev/src/DW_apb_i2c_cc_constants.v#40 $ 
//

//Lower limit of nubmer of clocks used for high count
//
//

`define IC_HCNT_LO_LIMIT 16'h6

//Lower limit of number of clocks used for low count

`define IC_LCNT_LO_LIMIT 16'h8


// Name:         IC_ADD_ENCODED_PARAMS
// Default:      true
// Values:       false (0x0), true (0x1)
// 
// Adding the encoded parameters gives firmware an easy and quick way of identifying 
// the DesignWare component within an I/O memory map. Some critical design-time options 
// determine how a driver should interact with the peripheral. There is a minimal area 
// overhead by including these parameters. Allows a single driver to be developed for each 
// component which will be self-configurable.
`define IC_ADD_ENCODED_PARAMS 1'h1


// Name:         APB_DATA_WIDTH
// Default:      8
// Values:       8 16 32
// 
// Width of the APB data bus
`define APB_DATA_WIDTH 16

//Internal Define for APB Data Width 8

// `define APB_DATA_WIDTH_8

//Internal Define for APB Data Width 16

`define APB_DATA_WIDTH_16

//Internal Define for APB Data Width 32

// `define APB_DATA_WIDTH_32


// Name:         IC_MAX_SPEED_MODE
// Default:      High
// Values:       Standard (0x1), Fast Mode or Fast Mode Plus (0x2), High (0x3)
// 
// Maximum I2C mode supported by DW_apb_i2c. 
// Controls the reset value of the SPEED parameter of Register IC_CON 
// Count registers are used to generate the outgoing clock SCL on the 
// I2C interface.  For unsupported speed modes those registers are not 
// present as described below. 
// If this parameter is set to "Fast Mode" or "Fast Mode Plus" or "standard" then the 
// register IC_HS_MADDR,  register IC_HS_HCNT and 
// register IC_HS_LCNT are not present.  If the parameter is set to "standard" 
// then the register IC_FS_HCNT and register IC_FS_LCNT 
// registers will not be present.
`define IC_MAX_SPEED_MODE 2'h1


// Name:         IC_10BITADDR_MASTER
// Default:      true
// Values:       false (0x0), true (0x1)
// 
// Controls whether DW_apb_i2c supports 7 or 10 bit addressing on the I2C 
// interface after reset when acting as a master. 
// Controls reset value of part of Register IC_CON. 
// Master generated transfers will use this number of address bits, it 
// can be reprogrammed by software.
`define IC_10BITADDR_MASTER 1'h1


// Name:         IC_RESTART_EN
// Default:      true
// Values:       false (0x0), true (0x1)
// 
// Determines whether re-start conditions may be sent when acting as a master. 
// Some older slaves do not support handling re-start conditions.  Re-start 
// condtions are used in several I2C operations.  Disabling re-start will not 
// allow the master to perform these functions: 
// 1) send multiple bytes per transfer; 
// 2) change direction within a transfer; 
// 3) send a start byte; 
// 4) perform any high speed mode operation; 
// 5) perform combined format transfers in 7 or 10 bit addressing modes; 
// 6) perform a read operation with a 10 bit address; 
// Controls the reset value of the IC_RESTART_EN bit in Register IC_CON.
`define IC_RESTART_EN 1'h1


// Name:         IC_10BITADDR_SLAVE
// Default:      true
// Values:       false (0x0), true (0x1)
// 
// Controls whether DW_apb_i2c slave supports 7 or 10 bit addressing on the I2C 
// interface after reset when acting as a slave. 
// Controls reset value of part of Register IC_CON. 
// The DW_apb_i2c module will respond to this number of address bits when 
// acting as a slave, can be reprogrammed by software.
`define IC_10BITADDR_SLAVE 1'h1



// Name:         IC_MASTER_MODE
// Default:      true
// Values:       false (0x0), true (0x1)
// 
// Controls whether DW_apb_i2c has its master enabled to be a master after reset. 
// This parameter controls the reset value of bit 0 of the I2C Control 
// Register (IC_CON). To enable the component to be a master, you must 
// write a 1 in bit 0 of the IC_CON register. 
// NOTE: If this parameter is checked (1), then you must ensure that the 
// parameter IC_SLAVE_DISABLE is checked (1) as well.
`define IC_MASTER_MODE 1'h1


// Name:         IC_SLAVE_DISABLE
// Default:      true
// Values:       false (0x0), true (0x1)
// 
// Controls whether DW_apb_i2c has its slave enabled or disabled after reset. 
// If checked, the DW_apb_i2c slave interface is disabled after reset. 
// The slave also can be disabled by programming a 1 into IC_CON[6] 
// By default the slave is enabled. 
// NOTE: If this parameter is unchecked (0), then you must ensure that the 
// parameter IC_MASTER_MODE is unchecked (0) as well.
`define IC_SLAVE_DISABLE 1'h1


// Name:         IC_DEFAULT_SLAVE_ADDR
// Default:      0x055
// Values:       0x000, ..., 0x3ff
// 
// Reset Value of DW_apb_i2c Slave Address. 
// Controls the reset value of Register IC_SAR. 
// A user is not allowed assign any reserved addresses or have the lower 
// seven bits the same as a reserved address. 
// The reserved address are as follows 
// 0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 
// 0x78 0x79 0x7a 0x7b 0x7c 0x7d 0x7e 0x7f 
// Should be obtained from Phillips as part of licensing agreement. 
// Phillips will assign a slave address.
`define IC_DEFAULT_SLAVE_ADDR 10'h055


// Name:         IC_DEFAULT_TAR_SLAVE_ADDR
// Default:      0x055
// Values:       0x000, ..., 0x3ff
// 
// Reset Value of DW_apb_i2c Target Slave Address. 
// Controls the reset value of Register IC_TAR. 
// A user is not allowed assign any reserved addresses or have the lower 
// seven bits the same as a reserved address. 
// The reserved address are as follows 
// 0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 
// 0x78 0x79 0x7a 0x7b 0x7c 0x7d 0x7e 0x7f
`define IC_DEFAULT_TAR_SLAVE_ADDR 10'h055


// Name:         IC_HS_MASTER_CODE
// Default:      0x1
// Values:       0x0, ..., 0x7
// Enabled:      IC_MAX_SPEED_MODE == 3
// 
// High Speed mode master code of the DW_apb_i2c block. 
// Controls the reset value of Register IC_HS_MADDR.
`define IC_HS_MASTER_CODE 3'h1


// Name:         IC_TX_BUFFER_DEPTH
// Default:      8
// Values:       2, ..., 256
// 
// Depth of transmit buffer, the buffer is 9 bits wide, 
// 8 bits for the data, 1 bit for the command (read or write)
`define IC_TX_BUFFER_DEPTH 8


// Name:         IC_RX_BUFFER_DEPTH
// Default:      8
// Values:       2, ..., 256
// 
// Depth of receive buffer, the buffer is 8 bits wide.
`define IC_RX_BUFFER_DEPTH 8

//Receive data width of FIFO

`define RX_ABW 3

//Write data width of FIFO

`define TX_ABW 3


// Name:         IC_INTR_POL
// Default:      true
// Values:       false (0x0), true (0x1)
// 
// Configures the active level of the output interrupt lines.
`define IC_INTR_POL 1'h1


// Name:         IC_INTR_IO
// Default:      false
// Values:       false (0x0), true (0x1)
// 
// Controls which interrupt outputs are present. 
// Individual: each interrupt source has its own output. 
// Combined: all interrupt sources are combined in to a single output.
`define IC_INTR_IO 1'h0


// Name:         IC_HAS_DMA
// Default:      false
// Values:       false (0x0), true (0x1)
// 
// Configures the inclusion of DMA handshaking interface signals. 
// Check the box to include the DMA interface signals.
`define IC_HAS_DMA 1'h0


//DW_apb_i2c module version ID

`define IC_VERSION_ID 32'h3132322a


// Name:         IC_TX_TL
// Default:      0x0
// Values:       0x0, ..., IC_TX_BUFFER_DEPTH-1
// 
// Reset value for threshold level of transmit buffer. 
// Control reset value of Register IC_TX_TL.
`define IC_TX_TL 8'h0


// Name:         IC_RX_TL
// Default:      0x0
// Values:       0x0, ..., IC_RX_BUFFER_DEPTH-1
// 
// Reset value for threshold level of receive buffer. 
// Controls reset value of Register IC_RX_TL.
`define IC_RX_TL 8'h0


// Name:         IC_USE_COUNTS
// Default:      false
// Values:       false (0x0), true (0x1)
// 
// Determines whether *CNT values are provided directly or by specifying the ic_clk clock frequency  
// and letting coreConsultant (or coreAssembler) calculate the count values. 
// When this parameter is checked, the reset values of the *CNT registers are specified by the corresponding *COUNT 
// configuration parameters, 
// which may be user-defined or derived (see standard, fast, FM+ or high speed mode parameters later in this table).  
// When unchecked (default setting), the reset values of the *CNT registers are calculated from the configuration 
// parameter IC_CLOCK_PERIOD. 
// Note: For FM+ speed user has to reprogram the IC_FS_SCL_*CNT register to achieve FM+ data rate when unchecked.
`define IC_USE_COUNTS 1'h0


// Name:         IC_CLOCK_PERIOD
// Default:      100 ([<functionof> IC_MAX_SPEED_MODE])
// Values:       2, ..., 2147483647
// Enabled:      IC_USE_COUNTS == 0
// 
// Period of incoming ic_clk, used to generate outgoing I2C 
// interface SCL clock. (ns integers only) 
// When the count values are used to generate the IC_CLOCK_PERIOD then 
// the IC_MAX_SPEED_MODE setting determines the actual period 
// IC_MAX_SPEED_MODE = Standard => 500ns 
// IC_MAX_SPEED_MODE = Fast     => 100ns 
// IC_MAX_SPEED_MODE = High     => 10ns 
// Note: For FM+ speed user has to reprogram the IC_FS_SCL_*CNT register to achieve FM+ data rate.
`define IC_CLOCK_PERIOD 500


// Name:         IC_SS_SCL_HIGH_COUNT
// Default:      0x0008 ([<functionof> IC_USE_COUNTS IC_HCNT_LO_LIMIT 
//               IC_CLOCK_PERIOD])
// Values:       0x0006, ..., 0xffff
// Enabled:      IC_USE_COUNTS==1
// 
// Reset value of SCL clock high period count for standard speed mode (Register IC_SS_HCNT). 
// The value must be calculated based on I2C data rate desired and the I2C clock frequency. 
// When parameter IC_USE_COUNTS = 0, this parameter is automatically calculated using the IC_CLOCK_PERIOD parameter.
`define IC_SS_SCL_HIGH_COUNT 16'h0008


// Name:         IC_SS_SCL_LOW_COUNT
// Default:      0x000a ([<functionof> IC_USE_COUNTS IC_LCNT_LO_LIMIT 
//               IC_CLOCK_PERIOD])
// Values:       0x0008, ..., 0xffff
// Enabled:      IC_USE_COUNTS==1
// 
// Reset value of SCL clock low period count for standard speed mode (Register IC_SS_LCNT). 
// Value must be calculated based on I2C data rate desired and I2C clock frequency. 
// When parameter IC_USE_COUNTS = 0, this parameter is automatically calculated using the IC_CLOCK_PERIOD parameter.
`define IC_SS_SCL_LOW_COUNT 16'h000a


// Name:         IC_FS_SCL_HIGH_COUNT
// Default:      0x0006 ([<functionof> IC_MAX_SPEED_MODE IC_USE_COUNTS 
//               IC_HCNT_LO_LIMIT IC_CLOCK_PERIOD])
// Values:       0x0006, ..., 0xffff
// Enabled:      IC_MAX_SPEED_MODE>=2 && IC_USE_COUNTS==1
// 
// Reset value of SCL clock high period count for fast speed mode (Register IC_FS_HCNT). 
// The value must be calculated 
// based on I2C data rate desired and I2C clock frequency. 
// If MAX_SPEED_MODE = standard, this parameter is irrelevant. 
// When parameter IC_USE_COUNTS = 0, this parameter is automatically calculated using the IC_CLOCK_PERIOD parameter.
`define IC_FS_SCL_HIGH_COUNT 16'h0006


// Name:         IC_FS_SCL_LOW_COUNT
// Default:      0x0008 ([<functionof> IC_MAX_SPEED_MODE IC_USE_COUNTS 
//               IC_LCNT_LO_LIMIT IC_CLOCK_PERIOD])
// Values:       0x0008, ..., 0xffff
// Enabled:      IC_MAX_SPEED_MODE>=2 && IC_USE_COUNTS==1
// 
// Reset value of SCL clock low period count for fast speed mode (Register IC_FS_LCNT). 
// The value must be calculated based on I2C data 
// rate desired and I2C clock frequency. 
// If MAX_SPEED_MODE = standard, this parameter is irrelevant. 
// When parameter IC_USE_COUNTS = 0, this parameter is automatically calculated using the IC_CLOCK_PERIOD parameter.
`define IC_FS_SCL_LOW_COUNT 16'h0008


// Name:         IC_CAP_LOADING
// Default:      100
// Values:       100 400
// Enabled:      IC_MAX_SPEED_MODE==3
// 
// For high speed mode, the bus loading affects the high and low 
// pulse width of SCL.  This parameter is not present in non-high speed 
// mode systems (IC_MAX_SPEED_MODE != high)
`define IC_CAP_LOADING 100


// Name:         IC_HS_SCL_HIGH_COUNT
// Default:      0x0006 ([<functionof> IC_MAX_SPEED_MODE IC_USE_COUNTS 
//               IC_HCNT_LO_LIMIT IC_CLOCK_PERIOD IC_CAP_LOADING])
// Values:       0x0006, ..., 0xffff
// Enabled:      IC_MAX_SPEED_MODE==3 && IC_USE_COUNTS==1
// 
// Reset value of SCL clock high period count for high speed mode (Register IC_HS_HCNT). 
// The value must be calculated based on I2C data rate desired and high speed 
// I2C clock frequency. 
// If MAX_SPEED_MODE = standard or fast, this parameter is irrelevant. 
// When parameter IC_USE_COUNTS = 0, this parameter is automatically calculated using the IC_CLOCK_PERIOD parameter.
`define IC_HS_SCL_HIGH_COUNT 16'h0006


// Name:         IC_HS_SCL_LOW_COUNT
// Default:      0x0008 ([<functionof> IC_MAX_SPEED_MODE IC_USE_COUNTS 
//               IC_LCNT_LO_LIMIT IC_CLOCK_PERIOD IC_CAP_LOADING])
// Values:       0x0008, ..., 0xffff
// Enabled:      IC_MAX_SPEED_MODE==3 && IC_USE_COUNTS==1
// 
// Reset value of SCL clock low period count for high speed mode (Register IC_HS_LCNT). 
// The value must be calculated based on I2C data rate and I2C clock frequency. 
// If MAX_SPEED_MODE = standard or fast, this parameter is irrelevant. 
// When parameter IC_USE_COUNTS = 0, this parameter is automatically calculated using the IC_CLOCK_PERIOD parameter.
`define IC_HS_SCL_LOW_COUNT 16'h0008


// Name:         IC_HC_COUNT_VALUES
// Default:      false
// Values:       false (0x0), true (0x1)
// 
// Setting this parameter to 1 will cause the CNT registers to read only. 
// Setting this parameter to 0 will allow the CNT registers to be writeable. 
// Regardless of the setting, the CNT registers are always readable and 
// have reset values from the corresponding configuration parameters, which 
// may be user defined or else derived. 
// NOTE: Since DW_apb_i2c uses the same high and low count registers for FS and FM+ operation,  
// if this parameter is checked (1) the IC_FS_SCL_*CNT registers are hard coded to either one of the FS or FM+.  
// Because of this DW_apb_i2c can either operate in Fast mode or FM+ but not both.  
// For FM+ operation, it is recommended that this parameter be Unchecked (0).
`define IC_HC_COUNT_VALUES 1'h0


`define IDENT 2'h0

//Asynchronous clock relationship

`define ASYNC 2'h1

//Synchronous clock relationship

`define SYNC 2'h3


// Name:         IC_CLK_TYPE
// Default:      Asynchronous (0x1)
// Values:       Identical (0x0), Asynchronous (0x1)
// 
// Specifies the relationship between pclk and ic_clk 
// Identical (0): clocks are identical; no meta-stability flops 
// used for data passing between clock domains. 
// Asynchronous (1): clocks may be completely asynchronous to 
// each other, meta-stability flops are required for data passing 
// between clock domains.
`define IC_CLK_TYPE 2'h1

//Setting up a clock period for the I2C.

`define IC_CLK_FREQ 100

//LHS of Paddr bus

`define IC_ADDR_SLICE_LHS 3'h7

//LHS of Paddr bus

`define MAX_APB_DATA_WIDTH 6'h20


// Name:         I2C_DYNAMIC_TAR_UPDATE
// Default:      false
// Values:       false (0), true (1)
// 
// Enable the dynamic updating of IC_TAR register
`define I2C_DYNAMIC_TAR_UPDATE 0



// Name:         IC_SLV_DATA_NACK_ONLY
// Default:      false
// Values:       false (0x0), true (0x1)
// 
// Enables an additional register which controls whether the DW_apb_i2c generates a NACK 
// after a data byte has been transferred to it. This NACK generation only occurs when 
// the DW_apb_i2c is a Slave/Receiver. If this register is set to a value of 1, it can 
// only generate a NACK after a data byte is received and hence, the data transfer is aborted. 
// Also, the data received is not pushed to the receive buffer. 
// Otherwise, if the register is set to a value of 0, it generates NACK/ACK depending on normal criteria. 
// If this option is selected, the default value of the register IC_SLV_DATA_NACK_ONLY is always 0. 
// It must be explicitly programmed to a value of 1 if NACKs are to be generated. 
// The register can only be written to successfully if DW_apb_i2c is disabled (IC_ENABLE[0] = 0) or 
// the slave part is inactive (IC_STATUS[6] = 0).
`define IC_SLV_DATA_NACK_ONLY 1'h0



//When the Receive buffer is physically full to its RX_BUFFER_DEPTH, this enables a hardware method
//to generate a NACK after each data byte. As a result of the NACK, the data transfer is aborted.
//Also, an attempt to push the data to the already full receive buffer is not attempted.
//This works for when DW_apb_i2c is either a Slave/Receiver (data being written
//to the device) or as a Master/Receiver (device is reading data from a slave).
//Note: if this parameter is set to 1 then the rx_over interrupt is never set to 1 as the criteria
//to set this interrupt is never met i.e. data never written the receive buffer if it is full.
//The rx_over interrupt can be found in IC_INTR_STAT[1] and IC_RAW_INTR_STAT[1].
//It is also an optional output called "ic_rx_over_intr(_n)".
//-------------------NOTE-------------------
//This feature is disabled permanently. See CRM 9000093730, 9000093709
//-------------------NOTE-------------------

`define IC_RX_FULL_GEN_NACK 1'h0




// Name:         IC_EMPTYFIFO_HOLD_MASTER_EN
// Default:      false
// Values:       false (0), true (1)
// 
// If this parameter is set the master will only complete a transfer (issue a STOP) 
// when it finds a Tx FIFO entry tagged with a Stop bit; if the Tx FIFO becomes 
// empty and the last byte did not have the Stop bit set, the master will stall 
// the transfer by holding the SCL line low 
// If this parameter is not set the master will complete a transfer when the Tx 
// FIFO is empty 
// If IC_RX_FULL_HLD_BUS_EN is selected, the master will stall the transfer 
// by holding the SCL line low if Receive FIFO is full
`define IC_EMPTYFIFO_HOLD_MASTER_EN 0



// Name:         IC_DEFAULT_SDA_SETUP
// Default:      0x64
// Values:       0x02, ..., 0xff
// 
// This parameter determines the reset value for the register IC_SDA_SETUP, which in 
// turn controls the time delay (in terms of number of ic_clk clock periods) introduced 
// in the rising edge of SCL, relative to SDA changing, when a read-request is serviced. 
// The relevant I2C requirement is t[su:DAT] as detailed in the I2C Bus Specifications.
`define IC_DEFAULT_SDA_SETUP 8'h64


// Name:         IC_DEFAULT_SDA_HOLD
// Default:      0x000001
// Values:       0x000001, ..., 0xffffff
// 
// This parameter determines the reset value for the register IC_SDA_HOLD, which in 
// turn controls the SDA hold time implemented by DW_apb_i2c when operating 
// as a master/slave transmitter or Master/Slave Reciever. 
// Bits [24:16] represents recieve SDA Hold default Value 
// Bits [15:0] Represents transmit SDA Hold default value. 
// The relevant I2C requirement is tHD;DAT as detailed in the I2C Bus Specifications.
`define IC_DEFAULT_SDA_HOLD 24'h000001


// Name:         IC_DEFAULT_ACK_GENERAL_CALL
// Default:      true
// Values:       false (0x0), true (0x1)
// 
// This parameter determines the reset value for the register IC_ACK_GENERAL_CALL, which 
// in turn controls whether I2C general call addresses are to responded or not.
`define IC_DEFAULT_ACK_GENERAL_CALL 1'h1


// Name:         IC_RX_FULL_HLD_BUS_EN
// Default:      false
// Values:       false (0x0), true (0x1)
// 
// When the Receive fifo is physically full to its RX_BUFFER_DEPTH, this enables a hardware method 
// to hold the bus till receive fifo data has read out to make space available in it. 
// This works for when DW_apb_i2c is either a Slave/Receiver (data being written 
// to the device) or as a Master/Receiver (device is reading data from a slave). 
// Note: if this parameter is set to 1 then the rx_over interrupt is never set to 1 as the criteria 
// to set this interrupt is never met i.e. data never written the receive buffer if it is full. 
// The rx_over interrupt can be found in IC_INTR_STAT[1] and IC_RAW_INTR_STAT[1]. 
// It is also an optional output called "ic_rx_over_intr(_n)".
`define IC_RX_FULL_HLD_BUS_EN 1'h0





// Name:         IC_SLV_RESTART_DET_EN
// Default:      false
// Values:       false (0x0), true (0x1)
// 
// When checked, allows the slave to detect and issue the restart interrupt when slave is addressed.  
// Setting this parameter affects the operation of DW_apb_i2c when it is in slave mode.  
// This  controls the  "RESTART_DET" bit  in IC_RAW_INTR_STAT, IC_INTR_MASK, IC_INTR_STAT and IC_CLR_RESTART_DET 
// registers. 
// This also controls the ic_restart_det_intr(_n) and ic_intr(_n) signals.
`define IC_SLV_RESTART_DET_EN 1'h0




// Name:         IC_STOP_DET_IF_MASTER_ACTIVE
// Default:      false
// Values:       false (0x0), true (0x1)
// 
// Controls whether DW_apb_i2c generates STOP_DET interrupt if master is active or not. 
// When checked, allows the master to detect and issue the stop interrupt when master is active. 
// When unchecked the master always dectects and issues the stop interrupt irrespective of whether it’s an active master 
// or not. 
// This parameter affects the operation of DW_apb_i2c when it is in master mode.  
// This controls the "STOP_DET" bit in IC_RAW_INTR_STAT, IC_INTR_MASK, IC_INTR_STAT and IC_CLR_STOP_DET registers. 
// This also controls the ic_stop_det_intr(_n) and ic_intr(_n) signals.
`define IC_STOP_DET_IF_MASTER_ACTIVE 1'h0




// Name:         IC_STAT_FOR_CLK_STRETCH
// Default:      false
// Values:       false (0x0), true (0x1)
// 
// If this parameter is set, the DW_apb_i2c consists of status bits indicating  
// the reason for clock stretching in IC_STATUS Register.
`define IC_STAT_FOR_CLK_STRETCH 1'h0





// Name:         IC_TX_CMD_BLOCK
// Default:      false
// Values:       false (0x0), true (0x1)
// 
// Controls whether DW_apb_i2c transmits data on I2C bus as soon as data is available in Tx FIFO or not. 
// When checked, allows the master to hold the transmission of data on I2C bus when Tx FIFO has data to  
// transmit.
`define IC_TX_CMD_BLOCK 1'h0



// Name:         IC_TX_CMD_BLOCK_DEFAULT
// Default:      false
// Values:       false (0x0), true (0x1)
// Enabled:      IC_TX_CMD_BLOCK==1
// 
// Controls whether DW_apb_i2c has its transmit command block enabled or disabled after reset. 
// if checked, the DW_apb_i2c blocks the transmission of data on I2C bus.
`define IC_TX_CMD_BLOCK_DEFAULT 1'h0


// Name:         IC_FIRST_DATA_BYTE_STATUS
// Default:      false
// Values:       false (0x0), true (0x1)
// 
// Controls whether DW_apb_i2c generates FIRST_DATA_BYTE status bit in IC_DATA_CMD register 
// or not. When checked, allows the master/slave receiver to set the FIRST_DATA_BYTE status bit 
// in IC_DATA_CMD register to indicate whether the data present in IC_DATA_CMD register is  
// first data byte after the address phase of a receive transfer or not.
`define IC_FIRST_DATA_BYTE_STATUS 1'h0



// Name:         IC_AVOID_RX_FIFO_FLUSH_ON_TX_ABRT
// Default:      false
// Values:       false (0x0), true (0x1)
// 
// This Parameter is used to control the Rx FIFO Flush during the Transmit Abort 
// If this parameter is set to true, only Tx FIFO will Flush and Rx FIFO will not Flush on Transmit Abort. 
// If this Parameter is set to false. both Tx FIFO and Rx FIFO will Flush on Transmit Abort
`define IC_AVOID_RX_FIFO_FLUSH_ON_TX_ABRT 1'h0



// -----------------------------------------------------------
// -- Regsiter bit Width macros
// -----------------------------------------------------------
//ic_con register bit width

`define IC_CON_RS 9

//ic_tar register bit width

`define IC_TAR_RS 12


`define IC_TAR_RS_INT 12

//ic_sar register bit width

`define IC_SAR_RS 10

//ic_hs_maddr register bit width

`define IC_HS_MADDR_RS 3

//ic_data_cmd Receiver register bit width

`define IC_DATA_CMD_RS 9

//ic_data_cmd Transmit register bit width

`define IC_DATA_TX_CMD_RS 9

//ic_data_cmd register valid data bit width

`define IC_DATA_RS 8

//ic_data_cmd register register fifo bit width

`define IC_DATA_FIFO_RS 8

//ic_ss_hcnt register bit width

`define IC_SS_HCNT_RS 16

//ic_ss_lcnt register bit width

`define IC_SS_LCNT_RS 16

//ic_fs_hcnt register bit width

`define IC_FS_HCNT_RS 16

//ic_fs_lcnt register bit width

`define IC_FS_LCNT_RS 16

//ic_hs_hcnt register bit width

`define IC_HS_HCNT_RS 16

//ic_hs_lcnt register bit width

`define IC_HS_LCNT_RS 16

//ic_intr_stat register bit width

`define IC_INTR_STAT_RS 14

//ic_intr_mask register bit width

`define IC_INTR_MASK_RS 14

//ic_raw_intr_stat register bit width

`define IC_RAW_INTR_STAT_RS 14

//ic_rx_tl register bit width

`define IC_RX_TL_RS 8

//ic_tx_tl register bit width

`define IC_TX_TL_RS 8

//ic_clr_intr register bit width

`define IC_CLR_INTR_RS 1

//ic_clr_rx_under register bit width

`define IC_CLR_RX_UNDER_RS 1

//ic_clr_rx_over register bit width

`define IC_CLR_RX_OVER_RS 1

//ic_clr_tx_over register bit width

`define IC_CLR_TX_OVER_RS 1

//ic_clr_rd_req register bit width

`define IC_CLR_RD_REQ_RS 1

//ic_clr_tx_abrt register bit width

`define IC_CLR_TX_ABRT_RS 1

//ic_clr_rx_done register bit width

`define IC_CLR_RX_DONE_RS 1

//ic_clr_activity register bit width

`define IC_CLR_ACTIVITY_RS 1

//ic_clr_stop_det register bit width

`define IC_CLR_STOP_DET_RS 1

//ic_clr_stop_det register bit width

`define IC_CLR_RESTART_DET_RS 1

//ic_clr_start_det register bit width

`define IC_CLR_START_DET_RS 1

//ic_clr_gen_call register bit width

`define IC_CLR_GEN_CALL_RS 1

//ic_enable register bit width

`define IC_ENABLE_RS 2

//ic_enable internal register bit width for sync module

`define IC_ENABLE_RS_INT 2

// ic_status register bit width

`define IC_STATUS_RS 7

//ic_sreset register bit width

`define IC_SRESET_RS 3

//ic_tx_abrt_source register bit width

`define IC_TX_ABRT_SOURCE_RS 17

//PAT START
//ic_slv_data_nack_only register bit width

`define IC_SLV_DATA_NACK_ONLY_RS 1
//PAT END

//ic_version_id register bit width

`define IC_VERSION_ID_RS 32

//ic_version_id register bit width

`define IC_DMA_CR_RS 2

//ic_version_id register bit width

`define IC_DMA_TDLR_RS 3

//ic_version_id register bit width

`define IC_DMA_RDLR_RS 3

//SDA setup time setting; used when SCL is held

`define IC_SDA_SETUP_RS 8

//internal SDA hold time setting; used when I2C acts as transmitter

`define IC_SDA_TX_HOLD_RS 16

//internal SDA hold time setting; used when I2C acts as reciever

`define IC_SDA_RX_HOLD_RS 8

//SDA hold time setting; used when I2cis acting as either Master or reciever

`define IC_SDA_HOLD_RS 24

//Acknowledgement of General Call addresses

`define IC_ACK_GENERAL_CALL_RS 1

//IC_ENABLE_STATUS

`define IC_ENABLE_STATUS_RS 3

// -----------------------------------------------------------
// -- Register reset value  macros
// -----------------------------------------------------------
//ic_con register reset value

`define IC_CON_IN 11'h7b

//ic_tar register reset value

`define IC_TAR_IN 13'h1055

//ic_tar register reset value

`define IC_TAR_IN_RAL 44'h55

//ic_sar register reset value

`define IC_SAR_IN 10'h55

//ic_hs_maddr register reset value

`define IC_HS_MADDR_IN 3'h1

//ic_ss_hcnt register reset value

`define IC_SS_HCNT_IN 16'h8

//ic_ss_lcnt register reset value

`define IC_SS_LCNT_IN 16'ha

//ic_fs_hcnt register reset value

`define IC_FS_HCNT_IN 16'h6

//ic_fs_lcnt register reset value

`define IC_FS_LCNT_IN 16'h8

//ic_hs_hcnt register reset value

`define IC_HS_HCNT_IN 16'h6

//ic_hs_lcnt register reset value

`define IC_HS_LCNT_IN 16'h8

//ic_rx_tl register reset value

`define IC_RX_TL_IN 8'h0

//ic_tx_tl register reset value

`define IC_TX_TL_IN 8'h0

//IC_ENABLE register reset value

`define IC_ENABLE_IN 3'h0

//Indicates a High Speed Mode Address value

`define IC_HS_CODE 5'h1

//Indicates a 10 bit address transfer

`define IC_SLV_ADDR_10BIT 5'h1e

//General Call I2C bus Code

`define IC_GENERAL_CALL 8'h0

//Start Byte I2C bus Code

`define IC_START_BYTE 8'h1

//I2C Version ID

`define IC_VERSION_ID_IN 32'h3132322a

//Speed up my simulation

`define IC_SPEED_SIM 1'h1

//Random Seed For Simulations. Anything between 1 and 31.

`define IC_RAND_SEED 1

//Determines if simulation max is one hour

`define IC_RUN_FOR_ONE_HOUR 1'h1

//Determines if the I2C VIP VMT models are instaniated

`define IC_VMT_MODEL_INCLUDED 1'h0

//Encoded APB Data Width

`define ENCODED_APB_DATA_WIDTH 2'h1

//Encoded value of the transmit buffer depth

`define ENCODED_IC_TX_BUFFER_DEPTH 8'h7

//Encoded value of the receiver buffer depth

`define ENCODED_IC_RX_BUFFER_DEPTH 8'h7

//ic_comp_param_1 register reset value

`define IC_COMP_PARAM_1_IN 24'h70785


`define I2C_ENCRYPT

//Lower limit of number of clocks used for spike suppression in SS and FS

`define IC_FS_SPKLEN_LO_LIMIT 8'h1

//Lower limit of number of clocks used for spike suppression in HS

`define IC_HS_SPKLEN_LO_LIMIT 8'h1

//Duration (in ns) of longest spike to be suppressed in SS and FS

`define IC_FS_MAX_SPKLEN 50

//Duration (in ns) of longest spike to be suppressed in HS

`define IC_HS_MAX_SPKLEN 10


// Name:         IC_DEFAULT_FS_SPKLEN
// Default:      0x1 ([<functionof> IC_CLOCK_PERIOD IC_FS_MAX_SPKLEN])
// Values:       0x1, ..., 0xff
// 
// Reset value of maximum suppressed spike length register in SS and FS/FM+ modes (Register IC_FS_SPKLEN). 
// Spike length is expressed in ic_clk cycles and this value is calculated based on the value of IC_CLOCK_PERIOD
`define IC_DEFAULT_FS_SPKLEN 8'h1


// Name:         IC_DEFAULT_HS_SPKLEN
// Default:      0x1 ([<functionof> IC_CLOCK_PERIOD IC_HS_MAX_SPKLEN])
// Values:       0x1, ..., 0xff
// Enabled:      IC_MAX_SPEED_MODE==3
// 
// Reset value of maximum suppressed spike length register in HS modes (Register IC_HS_SPKLEN). 
// Spike length is expressed in ic_clk cycles and this value is calculated based on the value of IC_CLOCK_PERIOD 
// If MAX_SPEED_MODE = standard or Fast Mode or Fast Mode Plus, this parameter is irrelevant.
`define IC_DEFAULT_HS_SPKLEN 8'h1

//ic_fs_spklen width

`define IC_FS_SPKLEN_RS 8

//ic_hs_spklen width

`define IC_HS_SPKLEN_RS 8

//Larger of IC_HS_SPKLEN_RS and IC_FS_SPKLEN_RS

`define IC_SPKLEN_RS 8

//Creates a define for enabling low power interface

// `define IC_HIGHSPEED_MODE_EN

//Include SVA assertions


