/*
------------------------------------------------------------------------
--
--  This confidential and proprietary software may be used only
--  as authorized by a licensing agreement from Synopsys Inc.
--  In the event of publication, the following notice is applicable:
--
// reuse-pragma startSub [::RCE::insert_copyright] endSub 
// 
// reuse-pragma startSub [format "// Release version :  %s" [get_attribute [current_design -quiet] -attr {SpiritVersion}]] 
// Release version  : 
// File Version     :        $Revision: #4 $ 
// Revision: $Id: //dwh/DW_ocb/DW_apb/amba_dev/sim/testbench/ahb/src/DW_ahb_cc_constants.v#4 $ 
--
-- File :                      DW_ahb_cc_constants.v
-- Author:                     Ray Beechinor 
-- Date :                      $DateTime: 2013/04/15 09:30:09 $ 
-- Abstract     :              Parameter File for DW_ahb
--                             Contains all parameters used to configure
--                             AHB BusIP in coreConsultant
--
-- Modification History:
-- Date                 By      Version Change  Description
-- =====================================================================
-- See CVS log
-- =====================================================================
*/
//top-level parameters for DW_ahb


// Description:  By selecting the system to be an AMBA Lite system the user is saying there
//               is only one master in the system and this master never requests for the bus
//               and is always granted the bus. No dummy master is required as the slaves  
//               are not split capable. A master will drive IDLEs when it does not want the bus.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_LITE 0


// Description:  AHB System Address Width
// DefaultValue: 32
// EnumValues:   32 64
// ValueRange:   32 64
`define HADDR_WIDTH 32


// Description:  Specify AHB Databus Width - 32, 64, 128 or 256 bits
// DefaultValue: 32
// EnumValues:   32 64 128 256
`define AHB_DATA_WIDTH 32


// Description:  Specify System Endianness (Big-Endian or Little-Endian)
// DefaultValue: Little-Endian
// EnumValues:   0 1
// ValueRange:   Little-Endian Big-Endian
`define BIG_ENDIAN 0


// Description:  Support AMBA Memory Remap Functionality
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define REMAP 0


// Description:  Support Arbiter Pause Mode. This allows
//                the granting of the bus to the dummy master when the system is
//                entering a low power mode.
// DefaultValue: true
// EnumValues:   0 1
// ValueRange:   false true
`define PAUSE 1


// Description:  If the user decides that they do not want any of the programmability features
//               within the AHB arbiter interface they can select that it is not available.
//               The address slot is not available to other slaves, it is unused.
//               There is no arbiter interface when the system is an AHB Lite system.
// DefaultValue: true
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_HAS_ARBIF 1


// Description:  Enables the inclusion of a weighted token prioirty arbitration
//               scheme. When the scheme is enabled, it is a third tier of arbitration. A master with clock tokens
//               although of a lower priority that a master with all clock tokens used will be granted the bus.
//               When masters have all clock tokens used the arbitration reverts to a two tier arbitration. When a
//               master has used all its tokens it will be granted the bus when masters with tokens are not requesting
//               the bus.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_WTEN 0


// Description:  Specify Number of Master Ports (1 to 15)
// DefaultValue: 2
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define NUM_AHB_MASTERS 1


// Description:  This is the total number of hsel select lines
//               in the system. There may be slaves that are visible in only one of the modes.
//               There is still a slave select generated for the slave. So that in either of the
//               addressing modes there can be 15 slaves assigned. If there is only one addressing
//               mode then this is the number of slaves in the system.
// DefaultValue: 4
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define NUM_IAHB_SLAVES 2

//xxreuse-pragma attr CheckExpr[@REMAP==0] {@NUM_NAHB_SLAVES == @NUM_IAHB_SLAVES}

// Description:  This specifies the Number of Slave Ports in Normal Mode(0 to 15).
//               The number of slave ports in normal mode is controlled by the slaves
//               visibility. Slaves can be visible in both normal and boot mode.
// DefaultValue: =@NUM_IAHB_SLAVES
// EnumValues:   0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define NUM_NAHB_SLAVES 2


// Description:  This specifies the Number of Slave Ports in Boot Mode(0 to 15).
//               The number of slave ports in boot mode is controlled by the slaves
//               visibility. Slaves can be visible in both normal and boot modes.
// DefaultValue: =[calc_bahb @REMAP]
// EnumValues:   0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define NUM_BAHB_SLAVES 0


// Description:  Start Address for AHB Arbiter - Must be entered in Hex.
// DefaultValue: 0x01000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R1_N_SA_0 32'h00000000


// Description:  End Address for AHB Arbiter - Must be entered in Hex.
// DefaultValue: 0x010003ff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R1_N_EA_0 32'h00ffffff


// Description:  Boot Start Address for AHB Arbiter 
//               Must be entered in hex.
// DefaultValue: 0x26000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R1_B_SA_0 32'h26000000


// Description:  Boot End Address for AHB Arbiter 
//               Must be entered in Hex.
// DefaultValue: 0x260003ff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R1_B_EA_0 32'h260003ff


// Description:  If this parameter is set to "Yes"
//               Arbiter Priorities will be read-only.
//                If this parameter is set to "No",
//                Arbiter Priorities can be reprogrammed during runtime
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HC_PRIORITIES 0


// Description:  Specify the ID Number of the
//               System Default Master.  A Default Master is required under the AMBA
//               Specification.  Set this parameter to 0 if you want the Dummy Master
//               to act as the Default Master. If one wants to use the weighted token
//               arbitration scheme then the dummy master should be the default master
// DefaultValue: 0
// EnumValues:   0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define DFLT_MSTR_NUM 0


// Description:  If this paramter is set to "Yes"
//               the ID of the Default Master will be read-only.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HC_DFLT_MSTR 0


// Description:  Set this parameter to "Yes" if
//               you want the system to support Early Burst Termination
// DefaultValue: true
// EnumValues:   0 1
// ValueRange:   false true
`define EBTEN 1


// Description:  Generate slave select on the interface.
//                If signal is on the interface then when there is no hsel active, the
//                default slave is active. hsel_s0 is for the arbiter slave interface.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define GEN_HSEL0 0


// Description:  Arbiter Priority.  Priority 15 (0xf) is highest
//               Priority 1 (0x1) is lowest. Set to 0 will disable this master.
//               Can only configure 1 to 15, 0 can be programmed through interface.
// DefaultValue: 0x1
// EnumValues:   0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf
`define PRIORITY_1 4'h1


// Description:  Arbiter Priority.  Priority 15 (0xf) is highest
//               Priority 1 (0x1) is lowest. Set to 0 will disable this master.
//               Can only configure 1 to 15, 0 can be programmed through interface.
// DefaultValue: 0x2
// EnumValues:   0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf
`define PRIORITY_2 4'h2


// Description:  Arbiter Priority.  Priority 15 (0xf) is highest
//               Priority 1 (0x1) is lowest. Set to 0 will disable this master.
//               Can only configure 1 to 15, 0 can be programmed through interface.
// DefaultValue: 0x3
// EnumValues:   0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf
`define PRIORITY_3 4'h3


// Description:  Arbiter Priority.  Priority 15 (0xf) is highest
//               Priority 1 (0x1) is lowest. Set to 0 will disable this master.
//               Can only configure 1 to 15, 0 can be programmed through interface.
// DefaultValue: 0x4
// EnumValues:   0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf
`define PRIORITY_4 4'h4


// Description:  Arbiter Priority.  Priority 15 (0xf) is highest
//               Priority 1 (0x1) is lowest. Set to 0 will disable this master.
//               Can only configure 1 to 15, 0 can be programmed through interface.
// DefaultValue: 0x5
// EnumValues:   0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf
`define PRIORITY_5 4'h5


// Description:  Arbiter Priority.  Priority 15 (0xf) is highest
//               Priority 1 (0x1) is lowest. Set to 0 will disable this master.
//               Can only configure 1 to 15, 0 can be programmed through interface.
// DefaultValue: 0x6
// EnumValues:   0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf
`define PRIORITY_6 4'h6


// Description:  Arbiter Priority.  Priority 15 (0xf) is highest
//               Priority 1 (0x1) is lowest. Set to 0 will disable this master.
//               Can only configure 1 to 15, 0 can be programmed through interface.
// DefaultValue: 0x7
// EnumValues:   0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf
`define PRIORITY_7 4'h7


// Description:  Arbiter Priority.  Priority 15 (0xf) is highest
//               Priority 1 (0x1) is lowest. Set to 0 will disable this master.
//               Can only configure 1 to 15, 0 can be programmed through interface.
// DefaultValue: 0x8
// EnumValues:   0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf
`define PRIORITY_8 4'h8


// Description:  Arbiter Priority.  Priority 15 (0xf) is highest
//               Priority 1 (0x1) is lowest. Set to 0 will disable this master.
//               Can only configure 1 to 15, 0 can be programmed through interface.
// DefaultValue: 0x9
// EnumValues:   0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf
`define PRIORITY_9 4'h9


// Description:  Arbiter Priority.  Priority 15 (0xf) is highest
//               Priority 1 (0x1) is lowest. Set to 0 will disable this master.
//               Can only configure 1 to 15, 0 can be programmed through interface.
// DefaultValue: 0xa
// EnumValues:   0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf
`define PRIORITY_10 4'ha


// Description:  Arbiter Priority.  Priority 15 (0xf) is highest
//               Priority 1 (0x1) is lowest. Set to 0 will disable this master.
//               Can only configure 1 to 15, 0 can be programmed through interface.
// DefaultValue: 0xb
// EnumValues:   0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf
`define PRIORITY_11 4'hb


// Description:  Arbiter Priority.  Priority 15 (0xf) is highest
//               Priority 1 (0x1) is lowest. Set to 0 will disable this master.
//               Can only configure 1 to 15, 0 can be programmed through interface.
// DefaultValue: 0xc
// EnumValues:   0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf
`define PRIORITY_12 4'hc


// Description:  Arbiter Priority.  Priority 15 (0xf) is highest
//               Priority 1 (0x1) is lowest. Set to 0 will disable this master.
//               Can only configure 1 to 15, 0 can be programmed through interface.
// DefaultValue: 0xd
// EnumValues:   0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf
`define PRIORITY_13 4'hd


// Description:  Arbiter Priority.  Priority 15 (0xf) is highest
//               Priority 1 (0x1) is lowest. Set to 0 will disable this master.
//               Can only configure 1 to 15, 0 can be programmed through interface.
// DefaultValue: 0xe
// EnumValues:   0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf
`define PRIORITY_14 4'he


// Description:  Arbiter Priority.  Priority 15 (0xf) is highest
//               Priority 1 (0x1) is lowest. Set to 0 will disable this master.
//               Can only configure 1 to 15, 0 can be programmed through interface.
// DefaultValue: 0xf
// EnumValues:   0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf
`define PRIORITY_15 4'hf


// Description:  Visibility of first Slave - is the slave visible in Normal or Bo ...
// DefaultValue: Normal
// EnumValues:   1 2 3
// ValueRange:   Normal Boot {Normal & Boot}
`define VISIBLE_1 1


// Description:  Will this slave occupy multiple memory regions in Normal Mode, i ...
// DefaultValue: 1 Region
// EnumValues:   0 1 2 3 4 5 6 7
// ValueRange:   1 Region
//               2 Regions
//               3 Regions
//               4 Regions
//               5 Regions
//               6 Regions
//               7 Regions
//               8 Regions
`define MR_N1 0


// Description:  Will this slave occupy multiple memory regions in Boot Mode, if  ...
// DefaultValue: 1 Region
// EnumValues:   0 1 2 3 4 5 6 7
// ValueRange:   1 Region
//               2 Regions
//               3 Regions
//               4 Regions
//               5 Regions
//               6 Regions
//               7 Regions
//               8 Regions
`define MR_B1 0


// Description:  Generate only hsel for this slave and alias to another slave
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HSEL_ONLY_S1 0


// Description:  ID Number of slave which returns data and response
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_S1 1


// Description:  If slave has a hsplit bus then set to Yes
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define SPLIT_CAPABLE_1 0


// Description:  Normal Mode Region 1 Start Address in hex
// DefaultValue: 0x02000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R1_N_SA_1 32'h01000000


// Description:  Normal Mode Region 1 End Address in hex
// DefaultValue: 0x0200ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R1_N_EA_1 32'h01ffffff


// Description:  Normal Mode Region 2 Start Address in hex
// DefaultValue: 0x03000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R2_N_SA_1 32'h03000000


// Description:  Normal Mode Region 2 End Address in hex
// DefaultValue: 0x0300ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R2_N_EA_1 32'h0300ffff


// Description:  Normal Mode Region 3 Start Address in hex
// DefaultValue: 0x04000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R3_N_SA_1 32'h04000000


// Description:  Normal Mode Region 3 End Address in hex
// DefaultValue: 0x0400ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R3_N_EA_1 32'h0400ffff


// Description:  Normal Mode Region 4 Start Address in hex
// DefaultValue: 0x05000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R4_N_SA_1 32'h05000000


// Description:  Normal Mode Region 4 End Address in hex
// DefaultValue: 0x0500ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R4_N_EA_1 32'h0500ffff


// Description:  Normal Mode Region 5 Start Address in hex
// DefaultValue: 0x06000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R5_N_SA_1 32'h06000000


// Description:  Normal Mode Region 5 End Address in hex
// DefaultValue: 0x0600ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R5_N_EA_1 32'h0600ffff


// Description:  Normal Mode Region 6 Start Address in hex
// DefaultValue: 0x07000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R6_N_SA_1 32'h07000000


// Description:  Normal Mode Region 6 End Address in hex
// DefaultValue: 0x0700ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R6_N_EA_1 32'h0700ffff


// Description:  Normal Mode Region 7 Start Address in hex
// DefaultValue: 0x08000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R7_N_SA_1 32'h08000000


// Description:  Normal Mode Region 7 End Address in hex
// DefaultValue: 0x0800ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R7_N_EA_1 32'h0800ffff


// Description:  Normal Mode Region 8 Start Address in hex
// DefaultValue: 0x09000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R8_N_SA_1 32'h09000000


// Description:  Normal Mode Region 8 End Address in hex
// DefaultValue: 0x0900ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R8_N_EA_1 32'h0900ffff


// Description:  Boot Mode Region 1 Start Address in hex
// DefaultValue: 0x27000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R1_B_SA_1 32'h27000000


// Description:  Boot Mode Region 1 End Address in hex
// DefaultValue: 0x2700ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R1_B_EA_1 32'h2700ffff


// Description:  Boot Mode Region 2 Start Address in hex
// DefaultValue: 0x28000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R2_B_SA_1 32'h28000000


// Description:  Boot Mode Region 2 End Address in hex
// DefaultValue: 0x2800ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R2_B_EA_1 32'h2800ffff


// Description:  Boot Mode Region 3 Start Address in hex
// DefaultValue: 0x29000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R3_B_SA_1 32'h29000000


// Description:  Boot Mode Region 3 End Address in hex
// DefaultValue: 0x2900ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R3_B_EA_1 32'h2900ffff


// Description:  Boot Mode Region 4 Start Address in hex
// DefaultValue: 0x2a000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R4_B_SA_1 32'h2a000000


// Description:  Boot Mode Region 4 End Address in hex
// DefaultValue: 0x2a00ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R4_B_EA_1 32'h2a00ffff


// Description:  Boot Mode Region 5 Start Address in hex
// DefaultValue: 0x2b000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R5_B_SA_1 32'h2b000000


// Description:  Boot Mode Region 5 End Address in hex
// DefaultValue: 0x2b00ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R5_B_EA_1 32'h2b00ffff


// Description:  Boot Mode Region 6 Start Address in hex
// DefaultValue: 0x2c000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R6_B_SA_1 32'h2c000000


// Description:  Boot Mode Region 6 End Address in hex
// DefaultValue: 0x2c00ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R6_B_EA_1 32'h2c00ffff


// Description:  Boot Mode Region 7 Start Address in hex
// DefaultValue: 0x2d000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R7_B_SA_1 32'h2d000000


// Description:  Boot Mode Region 7 End Address in hex
// DefaultValue: 0x2d00ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R7_B_EA_1 32'h2d00ffff


// Description:  Boot Mode Region 8 Start Address in hex
// DefaultValue: 0x2e000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R8_B_SA_1 32'h2e000000


// Description:  Boot Mode Region 8 End Address in hex
// DefaultValue: 0x2e00ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R8_B_EA_1 32'h2e00ffff


// Description:  Visibility of Second Slave - is the slave visible in Normal or B ...
// DefaultValue: Normal
// EnumValues:   1 2 3
// ValueRange:   Normal Boot {Normal & Boot}
`define VISIBLE_2 1


// Description:  Will this slave occupy multiple memory regions in Normal Mode?
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_N2 0


// Description:  Normal Mode Region 1 Start Address in hex
// DefaultValue: 0x0a000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R1_N_SA_2 32'h02000000


// Description:  Normal Mode Region 1 End Address in hex
// DefaultValue: 0x0a00ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R1_N_EA_2 32'h02ffffff


// Description:  Normal Mode Region 2 Start Address in hex
// DefaultValue: 0x0b000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R2_N_SA_2 32'h0b000000


// Description:  Normal Mode Region 2 End Address in hex
// DefaultValue: 0x0b00ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R2_N_EA_2 32'h0b00ffff


// Description:  Will this slave occupy multiple memory regions in Boot Mode?
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_B2 0


// Description:  Boot Mode Region 1 Start Address in hex
// DefaultValue: 0x2f000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R1_B_SA_2 32'h2f000000


// Description:  Boot Mode Region 1 End Address in hex
// DefaultValue: 0x2f00ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R1_B_EA_2 32'h2f00ffff


// Description:  Boot Mode Region 2 Start Address in hex
// DefaultValue: 0x30000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R2_B_SA_2 32'h30000000


// Description:  Boot Mode Region 2 End Address in hex
// DefaultValue: 0x3000ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R2_B_EA_2 32'h3000ffff


// Description:  Generate only hsel for this slave and alias to another slave
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HSEL_ONLY_S2 0


// Description:  ID Number of slave which returns data and response
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_S2 1


// Description:  If slave has a hsplit bus then set to Yes
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define SPLIT_CAPABLE_2 0


// Description:  Visibility of Third Slave - is the slave visible in Normal or Bo ...
// DefaultValue: Normal
// EnumValues:   1 2 3
// ValueRange:   Normal Boot {Normal & Boot}
`define VISIBLE_3 1


// Description:  Will this slave occupy multiple memory regions in Normal Mode?
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_N3 0


// Description:  Normal Mode Region 1 Start Address in hex
// DefaultValue: 0x0c000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R1_N_SA_3 32'h0c000000


// Description:  Normal Mode Region 1 End Address in hex
// DefaultValue: 0x0c00ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R1_N_EA_3 32'h0c00ffff


// Description:  Normal Mode Region 2 Start Address in hex
// DefaultValue: 0x0d000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R2_N_SA_3 32'h0d000000


// Description:  Normal Mode Region 2 End Address in hex
// DefaultValue: 0x0d00ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R2_N_EA_3 32'h0d00ffff


// Description:  Will this slave occupy multiple memory regions in Boot Mode?
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_B3 0


// Description:  Boot Mode Region 1 Start Address in hex
// DefaultValue: 0x31000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R1_B_SA_3 32'h31000000


// Description:  Boot Mode Region 1 End Address in hex
// DefaultValue: 0x3100ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R1_B_EA_3 32'h3100ffff


// Description:  Boot Mode Region 2 Start Address in hex
// DefaultValue: 0x32000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R2_B_SA_3 32'h32000000


// Description:  Boot Mode Region 2 End Address in hex
// DefaultValue: 0x3200ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R2_B_EA_3 32'h3200ffff


// Description:  Generate only hsel for this slave and alias to another slave
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HSEL_ONLY_S3 0


// Description:  ID Number of slave which returns data and response
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_S3 1


// Description:  If slave has a hsplit bus then set to Yes
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define SPLIT_CAPABLE_3 0


// Description:  Visibility of Fourth Slave - is the slave visible in Normal or B ...
// DefaultValue: Normal
// EnumValues:   1 2 3
// ValueRange:   Normal Boot {Normal & Boot}
`define VISIBLE_4 1


// Description:  Will this slave occupy multiple memory regions in Normal Mode?
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_N4 0


// Description:  Normal Mode Region 1 Start Address in hex
// DefaultValue: 0x0e000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R1_N_SA_4 32'h0e000000


// Description:  Normal Mode Region 1 End Address in hex
// DefaultValue: 0x0e00ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R1_N_EA_4 32'h0e00ffff


// Description:  Normal Mode Region 2 Start Address in hex
// DefaultValue: 0x0f000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R2_N_SA_4 32'h0f000000


// Description:  Normal Mode Region 2 End Address in hex
// DefaultValue: 0x0f00ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R2_N_EA_4 32'h0f00ffff


// Description:  Will this slave occupy multiple memory regions in Boot Mode?
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_B4 0


// Description:  Boot Mode Region 1 Start Address in hex
// DefaultValue: 0x33000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R1_B_SA_4 32'h33000000


// Description:  Boot Mode Region 1 End Address in hex
// DefaultValue: 0x3300ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R1_B_EA_4 32'h3300ffff


// Description:  Boot Mode Region 2 Start Address in hex
// DefaultValue: 0x34000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R2_B_SA_4 32'h34000000


// Description:  Boot Mode Region 2 End Address in hex
// DefaultValue: 0x3400ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R2_B_EA_4 32'h3400ffff


// Description:  Generate only hsel for this slave and alias to another slave
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HSEL_ONLY_S4 0


// Description:  ID Number of slave which returns data and response
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_S4 1


// Description:  If slave has a hsplit bus then set to Yes
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define SPLIT_CAPABLE_4 0


// Description:  Visibility of Fifth Slave - is the slave visible in Normal or Bo ...
// DefaultValue: Normal
// EnumValues:   1 2 3
// ValueRange:   Normal Boot {Normal & Boot}
`define VISIBLE_5 1


// Description:  Will this slave occupy multiple memory regions in Normal Mode?
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_N5 0


// Description:  Normal Mode Region 1 Start Address in hex
// DefaultValue: 0x10000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R1_N_SA_5 32'h10000000


// Description:  Normal Mode Region 1 End Address in hex
// DefaultValue: 0x1000ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R1_N_EA_5 32'h1000ffff


// Description:  Normal Mode Region 2 Start Address in hex
// DefaultValue: 0x11000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R2_N_SA_5 32'h11000000


// Description:  Normal Mode Region 2 End Address in hex
// DefaultValue: 0x1100ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R2_N_EA_5 32'h1100ffff


// Description:  Will this slave occupy multiple memory regions in Boot Mode?
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_B5 0


// Description:  Boot Mode Region 1 Start Address in hex
// DefaultValue: 0x35000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R1_B_SA_5 32'h35000000


// Description:  Boot Mode Region 1 End Address in hex
// DefaultValue: 0x3500ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R1_B_EA_5 32'h3500ffff


// Description:  Boot Mode Region 2 Start Address in hex
// DefaultValue: 0x36000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R2_B_SA_5 32'h36000000


// Description:  Boot Mode Region 2 End Address in hex
// DefaultValue: 0x3600ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R2_B_EA_5 32'h3600ffff


// Description:  Generate only hsel for this slave and alias to another slave
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HSEL_ONLY_S5 0


// Description:  ID Number of slave which returns data and response
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_S5 1


// Description:  If slave has a hsplit bus then set to Yes
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define SPLIT_CAPABLE_5 0


// Description:  Visibility of Sixth Slave - is the slave visible in Normal or Bo ...
// DefaultValue: Normal
// EnumValues:   1 2 3
// ValueRange:   Normal Boot {Normal & Boot}
`define VISIBLE_6 1


// Description:  Will this slave occupy multiple memory regions in Normal Mode?
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_N6 0


// Description:  Normal Mode Region 1 Start Address in hex
// DefaultValue: 0x12000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R1_N_SA_6 32'h12000000


// Description:  Normal Mode Region 1 End Address in hex
// DefaultValue: 0x1200ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R1_N_EA_6 32'h1200ffff


// Description:  Normal Mode Region 2 Start Address in hex
// DefaultValue: 0x13000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R2_N_SA_6 32'h13000000


// Description:  Normal Mode Region 2 End Address in hex
// DefaultValue: 0x1300ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R2_N_EA_6 32'h1300ffff


// Description:  Will this slave occupy multiple memory regions in Boot Mode?
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_B6 0


// Description:  Boot Mode Region 1 Start Address in hex
// DefaultValue: 0x37000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R1_B_SA_6 32'h37000000


// Description:  Boot Mode Region 1 End Address in hex
// DefaultValue: 0x3700ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R1_B_EA_6 32'h3700ffff


// Description:  Boot Mode Region 2 Start Address in hex
// DefaultValue: 0x38000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R2_B_SA_6 32'h38000000


// Description:  Boot Mode Region 2 End Address in hex
// DefaultValue: 0x3800ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R2_B_EA_6 32'h3800ffff


// Description:  Generate only hsel for this slave and alias to another slave
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HSEL_ONLY_S6 0


// Description:  ID Number of slave which returns data and response
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_S6 1


// Description:  If slave has a hsplit bus then set to Yes
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define SPLIT_CAPABLE_6 0


// Description:  Visibility of Seventh Slave - is the slave visible in Normal or  ...
// DefaultValue: Normal
// EnumValues:   1 2 3
// ValueRange:   Normal Boot {Normal & Boot}
`define VISIBLE_7 1


// Description:  Will this slave occupy multiple memory regions in Normal Mode?
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_N7 0


// Description:  Normal Mode Region 1 Start Address in hex
// DefaultValue: 0x14000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R1_N_SA_7 32'h14000000


// Description:  Normal Mode Region 1 End Address in hex
// DefaultValue: 0x1400ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R1_N_EA_7 32'h1400ffff


// Description:  Normal Mode Region 2 Start Address in hex
// DefaultValue: 0x15000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R2_N_SA_7 32'h15000000


// Description:  Normal Mode Region 2 End Address in hex
// DefaultValue: 0x1500ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R2_N_EA_7 32'h1500ffff


// Description:  Will this slave occupy multiple memory regions in Boot Mode?
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_B7 0


// Description:  Boot Mode Region 1 Start Address in hex
// DefaultValue: 0x39000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R1_B_SA_7 32'h39000000


// Description:  Boot Mode Region 1 End Address in hex
// DefaultValue: 0x3900ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R1_B_EA_7 32'h3900ffff


// Description:  Boot Mode Region 2 Start Address in hex
// DefaultValue: 0x3a000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R2_B_SA_7 32'h3a000000


// Description:  Boot Mode Region 2 End Address in hex
// DefaultValue: 0x3a00ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R2_B_EA_7 32'h3a00ffff


// Description:  Generate only hsel for this slave and alias to another slave
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HSEL_ONLY_S7 0


// Description:  ID Number of slave which returns data and response
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_S7 1


// Description:  If slave has a hsplit bus then set to Yes
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define SPLIT_CAPABLE_7 0


// Description:  Visibility of first Slave - is the slave visible in Normal or Bo ...
// DefaultValue: Normal
// EnumValues:   1 2 3
// ValueRange:   Normal Boot {Normal & Boot}
`define VISIBLE_8 1


// Description:  Will this slave occupy multiple memory regions in Normal Mode?
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_N8 0


// Description:  Normal Mode Region 1 Start Address in hex
// DefaultValue: 0x16000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R1_N_SA_8 32'h16000000


// Description:  Normal Mode Region 1 End Address in hex
// DefaultValue: 0x1600ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R1_N_EA_8 32'h1600ffff


// Description:  Normal Mode Region 2 Start Address in hex
// DefaultValue: 0x17000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R2_N_SA_8 32'h17000000


// Description:  Normal Mode Region 2 End Address in hex
// DefaultValue: 0x1700ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R2_N_EA_8 32'h1700ffff


// Description:  Will this slave occupy multiple memory regions in Boot Mode?
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_B8 0


// Description:  Boot Mode Region 1 Start Address in hex
// DefaultValue: 0x3b000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R1_B_SA_8 32'h3b000000


// Description:  Boot Mode Region 1 End Address in hex
// DefaultValue: 0x3b00ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R1_B_EA_8 32'h3b00ffff


// Description:  Boot Mode Region 2 Start Address in hex
// DefaultValue: 0x3c000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R2_B_SA_8 32'h3c000000


// Description:  Boot Mode Region 2 End Address in hex
// DefaultValue: 0x3c00ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R2_B_EA_8 32'h3c00ffff


// Description:  Generate only hsel for this slave and alias to another slave
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HSEL_ONLY_S8 0


// Description:  ID Number of slave which returns data and response
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_S8 1


// Description:  If slave has a hsplit bus then set to Yes
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define SPLIT_CAPABLE_8 0


// Description:  Visibility of Nineth Slave - is the slave visible in Normal or B ...
// DefaultValue: Normal
// EnumValues:   1 2 3
// ValueRange:   Normal Boot {Normal & Boot}
`define VISIBLE_9 1


// Description:  Will this slave occupy multiple memory regions in Normal Mode?
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_N9 0


// Description:  Normal Mode Region 1 Start Address in hex
// DefaultValue: 0x18000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R1_N_SA_9 32'h18000000


// Description:  Normal Mode Region 1 End Address in hex
// DefaultValue: 0x1800ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R1_N_EA_9 32'h1800ffff


// Description:  Normal Mode Region 2 Start Address in hex
// DefaultValue: 0x19000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R2_N_SA_9 32'h19000000


// Description:  Normal Mode Region 2 End Address in hex
// DefaultValue: 0x1900ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R2_N_EA_9 32'h1900ffff


// Description:  Will this slave occupy multiple memory regions in Boot Mode?
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_B9 0


// Description:  Boot Mode Region 1 Start Address in hex
// DefaultValue: 0x3d000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R1_B_SA_9 32'h3d000000


// Description:  Boot Mode Region 1 End Address in hex
// DefaultValue: 0x3d00ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R1_B_EA_9 32'h3d00ffff


// Description:  Boot Mode Region 2 Start Address in hex
// DefaultValue: 0x3e000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R2_B_SA_9 32'h3e000000


// Description:  Boot Mode Region 2 End Address in hex
// DefaultValue: 0x3e00ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R2_B_EA_9 32'h3e00ffff


// Description:  Generate only hsel for this slave and alias to another slave
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HSEL_ONLY_S9 0


// Description:  ID Number of slave which returns data and response
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_S9 1


// Description:  If slave has a hsplit bus then set to Yes
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define SPLIT_CAPABLE_9 0


// Description:  Visibility of Tenth Slave - is the slave visible in Normal or Bo ...
// DefaultValue: Normal
// EnumValues:   1 2 3
// ValueRange:   Normal Boot {Normal & Boot}
`define VISIBLE_10 1


// Description:  Will this slave occupy multiple memory regions in Normal Mode?
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_N10 0


// Description:  Normal Mode Region 1 Start Address in hex
// DefaultValue: 0x1a000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R1_N_SA_10 32'h1a000000


// Description:  Normal Mode Region 1 End Address in hex
// DefaultValue: 0x1a00ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R1_N_EA_10 32'h1a00ffff


// Description:  Normal Mode Region 2 Start Address in hex
// DefaultValue: 0x1b000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R2_N_SA_10 32'h1b000000


// Description:  Normal Mode Region 2 End Address in hex
// DefaultValue: 0x1b00ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R2_N_EA_10 32'h1b00ffff


// Description:  Will this slave occupy multiple memory regions in Boot Mode?
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_B10 0


// Description:  Boot Mode Region 1 Start Address in hex
// DefaultValue: 0x3f000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R1_B_SA_10 32'h3f000000


// Description:  Boot Mode Region 1 End Address in hex
// DefaultValue: 0x3f00ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R1_B_EA_10 32'h3f00ffff


// Description:  Boot Mode Region 2 Start Address in hex
// DefaultValue: 0x40000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R2_B_SA_10 32'h40000000


// Description:  Boot Mode Region 2 End Address in hex
// DefaultValue: 0x4000ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R2_B_EA_10 32'h4000ffff


// Description:  Generate only hsel for this slave and alias to another slave
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HSEL_ONLY_S10 0


// Description:  ID Number of slave which returns data and response
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_S10 1


// Description:  If slave has a hsplit bus then set to Yes
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define SPLIT_CAPABLE_10 0


// Description:  Visibility of Eleventh Slave - is the slave visible in Normal or ...
// DefaultValue: Normal
// EnumValues:   1 2 3
// ValueRange:   Normal Boot {Normal & Boot}
`define VISIBLE_11 1


// Description:  Will this slave occupy multiple memory regions in Normal Mode?
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_N11 0


// Description:  Normal Mode Region 1 Start Address in hex
// DefaultValue: 0x1c000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R1_N_SA_11 32'h1c000000


// Description:  Normal Mode Region 1 End Address in hex
// DefaultValue: 0x1c00ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R1_N_EA_11 32'h1c00ffff


// Description:  Normal Mode Region 2 Start Address in hex
// DefaultValue: 0x1d000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R2_N_SA_11 32'h1d000000


// Description:  Normal Mode Region 2 End Address in hex
// DefaultValue: 0x1d00ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R2_N_EA_11 32'h1d00ffff


// Description:  Will this slave occupy multiple memory regions in Boot Mode?
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_B11 0


// Description:  Boot Mode Region 1 Start Address in hex
// DefaultValue: 0x41000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R1_B_SA_11 32'h41000000


// Description:  Boot Mode Region 1 End Address in hex
// DefaultValue: 0x4100ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R1_B_EA_11 32'h4100ffff


// Description:  Boot Mode Region 2 Start Address in hex
// DefaultValue: 0x42000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R2_B_SA_11 32'h42000000


// Description:  Boot Mode Region 2 End Address in hex
// DefaultValue: 0x4200ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R2_B_EA_11 32'h4200ffff


// Description:  Generate only hsel for this slave and alias to another slave
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HSEL_ONLY_S11 0


// Description:  ID Number of slave which returns data and response
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_S11 1


// Description:  If slave has a hsplit bus then set to Yes
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define SPLIT_CAPABLE_11 0


// Description:  Visibility of Twelfth Slave - is the slave visible in Normal or  ...
// DefaultValue: Normal
// EnumValues:   1 2 3
// ValueRange:   Normal Boot {Normal & Boot}
`define VISIBLE_12 1


// Description:  Will this slave occupy multiple memory regions in Normal Mode?
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_N12 0


// Description:  Normal Mode Region 1 Start Address in hex
// DefaultValue: 0x1e000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R1_N_SA_12 32'h1e000000


// Description:  Normal Mode Region 1 End Address in hex
// DefaultValue: 0x1e00ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R1_N_EA_12 32'h1e00ffff


// Description:  Normal Mode Region 2 Start Address in hex
// DefaultValue: 0x1f000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R2_N_SA_12 32'h1f000000


// Description:  Normal Mode Region 2 End Address in hex
// DefaultValue: 0x1f00ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R2_N_EA_12 32'h1f00ffff


// Description:  Will this slave occupy multiple memory regions in Boot Mode?
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_B12 0


// Description:  Boot Mode Region 1 Start Address in hex
// DefaultValue: 0x43000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R1_B_SA_12 32'h43000000


// Description:  Boot Mode Region 1 End Address in hex
// DefaultValue: 0x4300ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R1_B_EA_12 32'h4300ffff


// Description:  Boot Mode Region 2 Start Address in hex
// DefaultValue: 0x44000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R2_B_SA_12 32'h44000000


// Description:  Boot Mode Region 2 End Address in hex
// DefaultValue: 0x4400ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R2_B_EA_12 32'h4400ffff


// Description:  Generate only hsel for this slave and alias to another slave
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HSEL_ONLY_S12 0


// Description:  ID Number of slave which returns data and response
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_S12 1


// Description:  If slave has a hsplit bus then set to Yes
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define SPLIT_CAPABLE_12 0


// Description:  Visibility of Thirteenth Slave - is the slave visible in Normal  ...
// DefaultValue: Normal
// EnumValues:   1 2 3
// ValueRange:   Normal Boot {Normal & Boot}
`define VISIBLE_13 1


// Description:  Will this slave occupy multiple memory regions in Normal Mode?
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_N13 0


// Description:  Normal Mode Region 1 Start Address in hex
// DefaultValue: 0x20000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R1_N_SA_13 32'h20000000


// Description:  Normal Mode Region 1 End Address in hex
// DefaultValue: 0x2000ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R1_N_EA_13 32'h2000ffff


// Description:  Normal Mode Region 2 Start Address in hex
// DefaultValue: 0x21000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R2_N_SA_13 32'h21000000


// Description:  Normal Mode Region 2 End Address in hex
// DefaultValue: 0x2100ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R2_N_EA_13 32'h2100ffff


// Description:  Will this slave occupy multiple memory regions in Boot Mode?
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_B13 0


// Description:  Boot Mode Region 1 Start Address in hex
// DefaultValue: 0x45000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R1_B_SA_13 32'h45000000


// Description:  Boot Mode Region 1 End Address in hex
// DefaultValue: 0x4500ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R1_B_EA_13 32'h4500ffff


// Description:  Boot Mode Region 2 Start Address in hex
// DefaultValue: 0x46000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R2_B_SA_13 32'h46000000


// Description:  Boot Mode Region 2 End Address in hex
// DefaultValue: 0x4600ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R2_B_EA_13 32'h4600ffff


// Description:  Generate only hsel for this slave and alias to another slave
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HSEL_ONLY_S13 0


// Description:  ID Number of slave which returns data and response
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_S13 1


// Description:  If slave has a hsplit bus then set to Yes
// DefaultValue: No
// EnumValues:   0 1
// ValueRange:   No Yes
`define SPLIT_CAPABLE_13 0


// Description:  Visibility of Fourteenth Slave - is the slave visible in Normal  ...
// DefaultValue: Normal
// EnumValues:   1 2 3
// ValueRange:   Normal Boot {Normal & Boot}
`define VISIBLE_14 1


// Description:  Will this slave occupy multiple memory regions in Normal Mode?
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_N14 0


// Description:  Normal Mode Region 1 Start Address in hex
// DefaultValue: 0x22000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R1_N_SA_14 32'h22000000


// Description:  Normal Mode Region 1 End Address in hex
// DefaultValue: 0x2200ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R1_N_EA_14 32'h2200ffff


// Description:  Normal Mode Region 2 Start Address in hex
// DefaultValue: 0x23000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R2_N_SA_14 32'h23000000


// Description:  Normal Mode Region 2 End Address in hex
// DefaultValue: 0x2300ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R2_N_EA_14 32'h2300ffff


// Description:  Will this slave occupy multiple memory regions in Boot Mode?
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_B14 0


// Description:  Boot Mode Region 1 Start Address in hex
// DefaultValue: 0x47000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R1_B_SA_14 32'h47000000


// Description:  Boot Mode Region 1 End Address in hex
// DefaultValue: 0x4700ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R1_B_EA_14 32'h4700ffff


// Description:  Boot Mode Region 2 Start Address in hex
// DefaultValue: 0x48000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R2_B_SA_14 32'h48000000


// Description:  Boot Mode Region 2 End Address in hex
// DefaultValue: 0x4800ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R2_B_EA_14 32'h4800ffff


// Description:  Generate only hsel for this slave and alias to another slave
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HSEL_ONLY_S14 0


// Description:  ID Number of slave which returns data and response
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_S14 1


// Description:  If slave has a hsplit bus then set to Yes
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define SPLIT_CAPABLE_14 0


// Description:  Visibility of Fifteenth Slave - is the slave visible in Normal o ...
// DefaultValue: Normal
// EnumValues:   1 2 3
// ValueRange:   Normal Boot {Normal & Boot}
`define VISIBLE_15 1


// Description:  Will this slave occupy multiple memory regions in Normal Mode?
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_N15 0


// Description:  Normal Mode Region 1 Start Address in hex
// DefaultValue: 0x24000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R1_N_SA_15 32'h24000000


// Description:  Normal Mode Region 1 End Address in hex
// DefaultValue: 0x2400ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R1_N_EA_15 32'h2400ffff


// Description:  Normal Mode Region 2 Start Address in hex
// DefaultValue: 0x25000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R2_N_SA_15 32'h25000000


// Description:  Normal Mode Region 2 End Address in hex
// DefaultValue: 0x2500ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R2_N_EA_15 32'h2500ffff


// Description:  Will this slave occupy multiple memory regions in Boot Mode?
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_B15 0


// Description:  Boot Mode Region 1 Start Address in hex
// DefaultValue: 0x49000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R1_B_SA_15 32'h49000000


// Description:  Boot Mode Region 1 End Address in hex
// DefaultValue: 0x4900ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R1_B_EA_15 32'h4900ffff


// Description:  Boot Mode Region 2 Start Address in hex
// DefaultValue: 0x4a000000
// MinValue:     0x00000000
// MaxValue:     0xfffffc00
`define R2_B_SA_15 32'h4a000000


// Description:  Boot Mode Region 2 End Address in hex
// DefaultValue: 0x4a00ffff
// MinValue:     0x00000000
// MaxValue:     0xffffffff
`define R2_B_EA_15 32'h4a00ffff


// Description:  Generate only hsel for this slave and alias to another slave
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HSEL_ONLY_S15 0


// Description:  ID Number of slave which returns data and response
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_S15 1


// Description:  If slave has a hsplit bus then set to Yes
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define SPLIT_CAPABLE_15 0


// Description:  The token counters can count on clock cycles or
//               on bus cycles to calculate the number of tokens a master is using.
// DefaultValue: Clock-Cycle
// EnumValues:   0 1
// ValueRange:   Clock-Cycle Bus-Cycle
`define AHB_TPS_MODE 0


// Description:  Total Period Counter Width
//               The width of the total counter is configurable and is used to reduce the number
//               of registers required when the design is configured. Should be wide enough to count
//               the sum of all the individual master clock tokens.
// DefaultValue: 32
// MinValue:     4
// MaxValue:     32
`define AHB_TCL_WIDTH 32


// Description:  Master Counter Width
//               The width of the master counter is configurable and is used to reduce the number
//               of registers required when the design is configured. Each master counter is the
//               same width. Needs to be wide enough to count the correct number of tokens for
//               a master.
// DefaultValue: 32
// MinValue:     4
// MaxValue:     32
`define AHB_CCL_WIDTH 32


// Description:  Hardcoded values
//               The length of the arbitration period and the number of clock tokens for each
//               master can be hard coded to reduce overall register count.
// DefaultValue: true
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_HC_TOKENS 1


// Description:  Total Cycle Limit
//               An arbitration period is defined over this number of cycles. When a new arbitration
//               period starts the master counters are reloaded. On the interface the output ahb_wt_aps
//               gives a one cycle pulse when a new arbitration period begins.
// DefaultValue: 0xffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define AHB_TCL 32'hffff


// Description:  Each master is assigned a number of clock tokens that it can use and be guaranteed
//               to get this number of cycles over an arbitration period. When these tokens are 
//               used up, masters with tokens remaining have prioirty over masters who have used
//               all their tokens. User configured token values are summed to ensure that they
//               do not exceed the total allocated number of tokens.
//               A value of 0 => infinite tokens for a master
// DefaultValue: 0xf
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define AHB_CL_M1 32'hf


// Description:  Each master is assigned a number of clock tokens that it can use and be guaranteed
//               to get this number of cycles over an arbitration period. When these tokens are 
//               used up, masters with tokens remaining have prioirty over masters who have used
//               all their tokens. User configured token values are summed to ensure that they
//               do not exceed the total allocated number of tokens.
//               A value of 0 => infinite tokens for a master
// DefaultValue: 0xf
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define AHB_CL_M2 32'hf


// Description:  Each master is assigned a number of clock tokens that it can use and be guaranteed
//               to get this number of cycles over an arbitration period. When these tokens are 
//               used up, masters with tokens remaining have prioirty over masters who have used
//               all their tokens. User configured token values are summed to ensure that they
//               do not exceed the total allocated number of tokens.
//               A value of 0 => infinite tokens for a master
// DefaultValue: 0xf
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define AHB_CL_M3 32'hf


// Description:  Each master is assigned a number of clock tokens that it can use and be guaranteed
//               to get this number of cycles over an arbitration period. When these tokens are 
//               used up, masters with tokens remaining have prioirty over masters who have used
//               all their tokens. User configured token values are summed to ensure that they
//               do not exceed the total allocated number of tokens.
//               A value of 0 => infinite tokens for a master
// DefaultValue: 0xf
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define AHB_CL_M4 32'hf


// Description:  Each master is assigned a number of clock tokens that it can use and be guaranteed
//               to get this number of cycles over an arbitration period. When these tokens are 
//               used up, masters with tokens remaining have prioirty over masters who have used
//               all their tokens. User configured token values are summed to ensure that they
//               do not exceed the total allocated number of tokens.
//               A value of 0 => infinite tokens for a master
// DefaultValue: 0xf
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define AHB_CL_M5 32'hf


// Description:  Each master is assigned a number of clock tokens that it can use and be guaranteed
//               to get this number of cycles over an arbitration period. When these tokens are 
//               used up, masters with tokens remaining have prioirty over masters who have used
//               all their tokens. User configured token values are summed to ensure that they
//               do not exceed the total allocated number of tokens.
//               A value of 0 => infinite tokens for a master
// DefaultValue: 0xf
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define AHB_CL_M6 32'hf


// Description:  Each master is assigned a number of clock tokens that it can use and be guaranteed
//               to get this number of cycles over an arbitration period. When these tokens are 
//               used up, masters with tokens remaining have prioirty over masters who have used
//               all their tokens. User configured token values are summed to ensure that they
//               do not exceed the total allocated number of tokens.
//               A value of 0 => infinite tokens for a master
// DefaultValue: 0xf
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define AHB_CL_M7 32'hf


// Description:  Each master is assigned a number of clock tokens that it can use and be guaranteed
//               to get this number of cycles over an arbitration period. When these tokens are 
//               used up, masters with tokens remaining have prioirty over masters who have used
//               all their tokens. User configured token values are summed to ensure that they
//               do not exceed the total allocated number of tokens.
//               A value of 0 => infinite tokens for a master
// DefaultValue: 0xf
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define AHB_CL_M8 32'hf


// Description:  Each master is assigned a number of clock tokens that it can use and be guaranteed
//               to get this number of cycles over an arbitration period. When these tokens are 
//               used up, masters with tokens remaining have prioirty over masters who have used
//               all their tokens. User configured token values are summed to ensure that they
//               do not exceed the total allocated number of tokens.
//               A value of 0 => infinite tokens for a master
// DefaultValue: 0xf
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define AHB_CL_M9 32'hf


// Description:  Each master is assigned a number of clock tokens that it can use and be guaranteed
//               to get this number of cycles over an arbitration period. When these tokens are 
//               used up, masters with tokens remaining have prioirty over masters who have used
//               all their tokens. User configured token values are summed to ensure that they
//               do not exceed the total allocated number of tokens.
//               A value of 0 => infinite tokens for a master
// DefaultValue: 0xf
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define AHB_CL_M10 32'hf


// Description:  Each master is assigned a number of clock tokens that it can use and be guaranteed
//               to get this number of cycles over an arbitration period. When these tokens are 
//               used up, masters with tokens remaining have prioirty over masters who have used
//               all their tokens. User configured token values are summed to ensure that they
//               do not exceed the total allocated number of tokens.
//               A value of 0 => infinite tokens for a master
// DefaultValue: 0xf
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define AHB_CL_M11 32'hf


// Description:  Each master is assigned a number of clock tokens that it can use and be guaranteed
//               to get this number of cycles over an arbitration period. When these tokens are 
//               used up, masters with tokens remaining have prioirty over masters who have used
//               all their tokens. User configured token values are summed to ensure that they
//               do not exceed the total allocated number of tokens.
//               A value of 0 => infinite tokens for a master
// DefaultValue: 0xf
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define AHB_CL_M12 32'hf


// Description:  Each master is assigned a number of clock tokens that it can use and be guaranteed
//               to get this number of cycles over an arbitration period. When these tokens are 
//               used up, masters with tokens remaining have prioirty over masters who have used
//               all their tokens. User configured token values are summed to ensure that they
//               do not exceed the total allocated number of tokens.
//               A value of 0 => infinite tokens for a master
// DefaultValue: 0xf
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define AHB_CL_M13 32'hf


// Description:  Each master is assigned a number of clock tokens that it can use and be guaranteed
//               to get this number of cycles over an arbitration period. When these tokens are 
//               used up, masters with tokens remaining have prioirty over masters who have used
//               all their tokens. User configured token values are summed to ensure that they
//               do not exceed the total allocated number of tokens.
//               A value of 0 => infinite tokens for a master
// DefaultValue: 0xf
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define AHB_CL_M14 32'hf


// Description:  Each master is assigned a number of clock tokens that it can use and be guaranteed
//               to get this number of cycles over an arbitration period. When these tokens are 
//               used up, masters with tokens remaining have prioirty over masters who have used
//               all their tokens. User configured token values are summed to ensure that they
//               do not exceed the total allocated number of tokens.
//               A value of 0 => infinite tokens for a master
// DefaultValue: 0xf
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define AHB_CL_M15 32'hf


// Description:  Generate only hgrant and hbusreq for this master as the master has a number
//               of request and grant kines but only one set of control lines.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_REQGNT_ONLY_M1 0


// Description:  ID Number of master which supplies the address and control
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_M1 1


// Description:  Generate only hgrant and hbusreq for this master as the master has a number
//               of request and grant kines but only one set of control lines.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_REQGNT_ONLY_M2 0


// Description:  ID Number of master which supplies the address and control
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_M2 1


// Description:  Generate only hgrant and hbusreq for this master as the master has a number
//               of request and grant kines but only one set of control lines.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_REQGNT_ONLY_M3 0


// Description:  ID Number of master which supplies the address and control
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_M3 1


// Description:  Generate only hgrant and hbusreq for this master as the master has a number
//               of request and grant kines but only one set of control lines.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_REQGNT_ONLY_M4 0


// Description:  ID Number of master which supplies the address and control
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_M4 1


// Description:  Generate only hgrant and hbusreq for this master as the master has a number
//               of request and grant kines but only one set of control lines.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_REQGNT_ONLY_M5 0


// Description:  ID Number of master which supplies the address and control
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_M5 1


// Description:  Generate only hgrant and hbusreq for this master as the master has a number
//               of request and grant kines but only one set of control lines.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_REQGNT_ONLY_M6 0


// Description:  ID Number of master which supplies the address and control
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_M6 1


// Description:  Generate only hgrant and hbusreq for this master as the master has a number
//               of request and grant kines but only one set of control lines.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_REQGNT_ONLY_M7 0


// Description:  ID Number of master which supplies the address and control
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_M7 1


// Description:  Generate only hgrant and hbusreq for this master as the master has a number
//               of request and grant kines but only one set of control lines.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_REQGNT_ONLY_M8 0


// Description:  ID Number of master which supplies the address and control
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_M8 1


// Description:  Generate only hgrant and hbusreq for this master as the master has a number
//               of request and grant kines but only one set of control lines.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_REQGNT_ONLY_M9 0


// Description:  ID Number of master which supplies the address and control
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_M9 1


// Description:  Generate only hgrant and hbusreq for this master as the master has a number
//               of request and grant kines but only one set of control lines.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_REQGNT_ONLY_M10 0


// Description:  ID Number of master which supplies the address and control
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_M10 1


// Description:  Generate only hgrant and hbusreq for this master as the master has a number
//               of request and grant kines but only one set of control lines.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_REQGNT_ONLY_M11 0


// Description:  ID Number of master which supplies the address and control
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_M11 1


// Description:  Generate only hgrant and hbusreq for this master as the master has a number
//               of request and grant kines but only one set of control lines.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_REQGNT_ONLY_M12 0


// Description:  ID Number of master which supplies the address and control
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_M12 1


// Description:  Generate only hgrant and hbusreq for this master as the master has a number
//               of request and grant kines but only one set of control lines.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_REQGNT_ONLY_M13 0


// Description:  ID Number of master which supplies the address and control
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_M13 1


// Description:  Generate only hgrant and hbusreq for this master as the master has a number
//               of request and grant kines but only one set of control lines.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_REQGNT_ONLY_M14 0


// Description:  ID Number of master which supplies the address and control
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_M14 1


// Description:  Generate only hgrant and hbusreq for this master as the master has a number
//               of request and grant kines but only one set of control lines.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_REQGNT_ONLY_M15 0


// Description:  ID Number of master which supplies the address and control
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_M15 1

