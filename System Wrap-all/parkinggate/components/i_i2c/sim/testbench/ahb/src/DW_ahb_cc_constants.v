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
// Revision: $Id: //dwh/DW_ocb/DW_apb_i2c/amba_dev/sim/testbench/ahb/src/DW_ahb_cc_constants.v#4 $ 
--
-- File :                      DW_ahb_cc_constants.v
-- Author:                     Peter Gillen 
-- Date :                      $DateTime: 2013/04/15 09:45:24 $ 
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


// Description:  If set to True (1), the system is configured with only 
//               one master that never requests ownership of the bus, but is 
//               always granted the bus. No dummy master is required, as the 
//               slaves are not split-capable so the only master is always 
//               the bus owner. The master will drive IDLE cycles when it  
//               does not want the bus. 
//                
//               In addition 
//                 - Pause mode is not enabled 
//                 - The default master number is changed to 1 
//                 - The number of masters is changed to 1 
//                 - The arbiter interface is removed 
//                 - All slaves are made non split capable
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_LITE 0


// Description:  The number of AHB Masters contained in the system. 
//               When AMBA Lite is configured, then this is set to 1. 
//               One can have a system which only has one master but is not AMBA Lite. 
//               This allows the user to program the default master to be the dummy 
//               master or the only existing master. The dummy master is the master  
//               who owns the bus when no one wants it. 
//               There can be up to 15 masters connected to the DW_ahb.
// DefaultValue: 2
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define NUM_AHB_MASTERS 3


// Description:  Chooses the address width for the AHB address bus; 
//               32-bit addressing or 64-bit addressing.
// DefaultValue: 32
// EnumValues:   32 64
// ValueRange:   32 64
`define HADDR_WIDTH 32


// Description:  Selects the width of the AHB data bus.  
//               The maximum 256-bit width is an arbitrary limitation enforced by coreConsultant.
// DefaultValue: 32
// EnumValues:   32 64 128 256
`define AHB_DATA_WIDTH 32


// Description:  If True (1), the endian type of the DW_ahb is 
//               controlled by the external pin, ahb_big_endian. 
//               ahb_big_endian = 1 => Big Endian 
//               ahb_big_endian = 0 => Little Endian 
//               If False (0), the endian type is set at configuration  
//               by the BIG_ENDIAN parameter. 
//               If controlled externally, the endian type is deemed bootable. 
//               If controlled internally, there is no way to change the endian type after  
//               the component has been configured.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_XENDIAN 0


// Description:  By default, the DW_ahb is configured as a Little- 
//               Endian system. The user can choose the endianness of the 
//               system if endian control is not external. 
//               The endian setting affects the byte-lane routing to or 
//               from the arbiter slave.  This parameter is relevant only 
//               when the internal arbiter slave is included within 
//               the DW_ahb; that is, when AHB_HAS_ARBIF = 1 and when 
//               the endian control is internal.
// DefaultValue: Little-Endian
// EnumValues:   0 1
// ValueRange:   Little-Endian Big-Endian
`define BIG_ENDIAN 0


// Description:  If True (1), the decoder is external to the DW_ahb. 
//               If False (0), the decoder is internal to the DW_ahb. 
//               For an internal decoder, the addresses need to be supplied  
//               by the DW_ahb at configuration. 
//               An external decoder allows users to connect any decoder with any 
//               number of remap options.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_HAS_XDCDR 0


// Description:  Allows the memory map to be swapped. When set, the 
//               system supports the AMBA memory remap functionality. 
//               Remap allows one set of addresses for boot, and another 
//               for normal operation. This setting must be set if two 
//               addressing modes are required. This parameter is relevant 
//               only when there is an internal decoder; that is, 
//               when AHB_HAS_XDCDR = 0.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define REMAP 0


// Description:  If set to True (1), the system supports the arbiter 
//               pause mode. This setting allows the granting of the 
//               bus to the Dummy master when the system is entering 
//               low-power mode. When AHB_LITE = 1, pause mode is 
//               disabled.
// DefaultValue: true
// EnumValues:   0 1
// ValueRange:   false true
`define PAUSE 1


// Description:  When the delayed pause action is supported, the 
//               pause signal, when set, will not take effect until hready 
//               is high and htrans is IDLE. If delayed pause action is 
//               not supported, the DW_ahb enters pause mode at the next hclk 
//               edge once the pause signal is set. By delaying the action 
//               on pause, any other transfers on the bus can be completed 
//               before the system is paused.
// DefaultValue: true
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_DELAYED_PAUSE 1


// Description:  If the user decides that there is no requirement 
//               for the programmability features within the AHB arbiter 
//               interface, this feature can be disabled (set to False). 
//               The peripheral slot (s0) is not available to other slaves, 
//               meaning it is unused. There is no arbiter interface when 
//               the system is an AHB Lite system.
// DefaultValue: true
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_HAS_ARBIF 1


// Description:  Enables the inclusion of a weighted token 
//               priority arbitration scheme. When the scheme is enabled, 
//               it is a third tier of arbitration. Each master is given  
//               a certain number of clock tokens for access to the bus. 
//               The output hmaster indicates which master is the bus  
//               owner. Each time a master is on the bus it uses up a token 
//               and the corresponding token counter is decremented. 
//               A master with clock tokens remaining, although of a lower 
//               priority than a master with no clock tokens left to use 
//               will be granted the bus. When masters have all clock tokens 
//               used, the arbitration reverts to a two-tier arbitration.  
//               When a master has used all of its tokens, it will be granted  
//               the bus when masters with tokens are not requesting the bus.  
//               The internal arbiter slave must be included in order to use  
//               the weighted token arbitration mode and to generate outputs 
//               which show the current count of each masters token counter.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_WTEN 0


// Description:  Enables the inclusion of weighted token clock 
//               token counter outputs as top-level outputs that can help 
//               fine tune the number of tokens that one can assign to 
//               a master. These debug outputs show the number of tokens 
//               a master has left.  This parameter is unavailable when 
//               AHB_WTEN = False (0).By providing them as outputs allows 
//               the system designer to trace them during development.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_WTEN_DEBUG 0


// Description:  When a burst of unspecified length is issued from 
//               a master, the updating of the internal arbiter can 
//               be controlled. By supporting full incrementing bursts, 
//               the arbiter will not "early terminate" a burst transfer 
//               that is of an unspecified length. The entire burst is 
//               allowed to complete. Not supporting full incrementing 
//               bursts (the default mode of operation) makes the arbiter 
//               free to update the grants to the highest priority 
//               master when a master issues a burst transfer of an 
//               unspecified length. This, in effect, early terminates the 
//               currently granted transfer on the bus. This will not override 
//               the updating of the grants if a SPLIT or a RETRy is received.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_FULL_INCR 0


// Description:  This number is the total number of slave select 
//               lines in the system. There may be slaves that are 
//               visible in one of the modes. There is still a slave 
//               select generated for the slave, so that in either 
//               of the addressing modes there can be 15 assigned 
//               slaves. If there is only one addressing mode, then 
//               this is the number of slaves in the system.
// DefaultValue: 4
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define NUM_IAHB_SLAVES 2


// Description:  Specifies the number of slave select lines in the system 
//               in Normal mode, which is controlled by the slave's 
//               visibility. Slaves can be visible in both Normal and 
//               Boot modes. This parameter option is active only if 
//               you enable the Memory Remap Feature.
// DefaultValue: 2
// EnumValues:   0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define NUM_NAHB_SLAVES 2


// Description:  Specifies the number of slave select lines contained 
//               in the system in Boot mode, which is controlled by the 
//               slave's visibility. Slaves can be visible in both Normal 
//               and Boot modes. This parameter option is only active if 
//               you enable the Memory Remap Feature.
// DefaultValue: 0
// EnumValues:   0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define NUM_BAHB_SLAVES 0


// Description:  Normal Mode start address for AHB Arbiter. The Arbiter 
//               Slave Interface must be included in the design 
//               (that is, when AHB_HAS_ARBIF = 1), and the decoder must 
//               be configured as internal (when AHB_HAS_XDCDR = 0).
// DefaultValue: 0x1000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_N_SA_0 32'h0


// Description:  Normal Mode end address for AHB Arbiter. The Arbiter 
//               Slave Interface must be included in the design 
//               (that is, when AHB_HAS_ARBIF = 1), and the decoder must 
//               be configured as internal (when AHB_HAS_XDCDR = 0).
// DefaultValue: 0x10003ff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_N_EA_0 32'hffffff


// Description:  Boot Mode start address for AHB Arbiter. This parameter 
//               option is only active if you enable the Memory Remap 
//               Feature (that is, when REMAP = 1) in the top-level parameter 
//               options, include the Arbiter Slave Interface in the design, 
//               (AHB_HAS_ARBIF = 1), and configure the decoder as internal 
//               (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x26000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_B_SA_0 32'h26000000


// Description:  Boot Mode start address for AHB Arbiter. This parameter 
//               option is active only if you enable the Memory Remap 
//               Feature (that is, when REMAP = 1) in the top-level 
//               parameter options, include the Arbiter Slave Interface in 
//               the design (AHB_HAS_ARBIF = 1), and configure the 
//               decoder as internal (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x260003ff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_B_EA_0 32'h260003ff


// Description:  If this parameter is set to Yes, the priorities will 
//               be read only. If it is set to No, the priorities can be 
//               programmed during runtime. If there is no Arbiter Slave 
//               Interface, this parameter is dimmed and hardcoded to Yes.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HC_PRIORITIES 0


// Description:  Specifies the ID Number of the System Default Master. 
//               A default master is required according to the 
//               AMBA Specification (Rev. 2.0). You can set this to 
//               0 if you want the Dummy Master to act as the Default 
//               Master. The value must be less than or equal to the 
//               value of NUM_AHB_MASTERS. If weighted token arbitration 
//               is enabled, then this value is hardcoded to 0.
// DefaultValue: 0
// EnumValues:   0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define DFLT_MSTR_NUM 0


// Description:  If you set this parameter to Yes, the ID of the 
//               Default Master will be read only. If there is no 
//               Arbiter Slave Interface, this parameter is dimmed 
//               and hardcoded to Yes.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HC_DFLT_MSTR 0


// Description:  The Early Burst Termination logic is included 
//               when this parameter is set; otherwise the ahbarbint 
//               signal is removed. If there is no Arbiter Slave 
//               Interface, this parameter is dimmed and set to No. 
//               This allows long transfers to be broken up by the arbiter. 
//               If this is set to False (0) it will not prevent the 
//               arbiter from breaking up a burst transfer cause by SPLIT 
//               or RETRY. This should be used to break up long bursts. 
//               It is not possible to terminate a locked transfer.
// DefaultValue: true
// EnumValues:   0 1
// ValueRange:   false true
`define EBTEN 1


// Description:  Select line for the internal arbiter slave. When 
//               there is an internal decoder, the select is 
//               hsel_s0. When there is an external decoder, the 
//               select is xhsel_s0. If there is no Arbiter Slave 
//               Interface, this parameter is dimmed and set to No. 
//               The the DW_ahb configured as AMBA Lite, then this 
//               signal is removed from the I/O.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define GEN_HSEL0 0


// Description:  Arbitration priority associated with Master 1. 
//               Priority 1 (0x1) is the lowest and Priority 15 (0xf) 
//               is the highest. It is not possible to configure a 
//               priority of zero (0x0), which disables the master. 
//               However, it is possible to program it, provided the 
//               priority values are not hardcoded. The default value 
//               is 1 (0x1).
// DefaultValue: 0x1
// EnumValues:   0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf
`define PRIORITY_1 4'h1


// Description:  Arbitration priority associated with Master 2. 
//               Priority 1 (0x1) is the lowest and Priority 15 (0xf) 
//               is the highest. It is not possible to configure a 
//               priority of zero (0x0), which disables the master. 
//               However, it is possible to program it, provided the 
//               priority values are not hardcoded. The default value 
//               is 2 (0x2).
// DefaultValue: 0x2
// EnumValues:   0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf
`define PRIORITY_2 4'h2


// Description:  Arbitration priority associated with Master 3. 
//               Priority 1 (0x1) is the lowest and Priority 15 (0xf) 
//               is the highest. It is not possible to configure a 
//               priority of zero (0x0), which disables the master. 
//               However, it is possible to program it, provided the 
//               priority values are not hardcoded. The default value 
//               is 3 (0x3).
// DefaultValue: 0x3
// EnumValues:   0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf
`define PRIORITY_3 4'h3


// Description:  Arbitration priority associated with Master 4. 
//               Priority 1 (0x1) is the lowest and Priority 15 (0xf) 
//               is the highest. It is not possible to configure a 
//               priority of zero (0x0), which disables the master. 
//               However, it is possible to program it, provided the 
//               priority values are not hardcoded. The default value 
//               is 4 (0x4).
// DefaultValue: 0x4
// EnumValues:   0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf
`define PRIORITY_4 4'h4


// Description:  Arbitration priority associated with Master 5. 
//               Priority 1 (0x1) is the lowest and Priority 15 (0xf) 
//               is the highest. It is not possible to configure a 
//               priority of zero (0x0), which disables the master. 
//               However, it is possible to program it, provided the 
//               priority values are not hardcoded. The default value 
//               is 5 (0x5).
// DefaultValue: 0x5
// EnumValues:   0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf
`define PRIORITY_5 4'h5


// Description:  Arbitration priority associated with Master 6. 
//               Priority 1 (0x1) is the lowest and Priority 15 (0xf) 
//               is the highest. It is not possible to configure a 
//               priority of zero (0x0), which disables the master. 
//               However, it is possible to program it, provided the 
//               priority values are not hardcoded. The default value 
//               is 6 (0x6).
// DefaultValue: 0x6
// EnumValues:   0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf
`define PRIORITY_6 4'h6


// Description:  Arbitration priority associated with Master 7. 
//               Priority 1 (0x1) is the lowest and Priority 15 (0xf) 
//               is the highest. It is not possible to configure a 
//               priority of zero (0x0), which disables the master. 
//               However, it is possible to program it, provided the 
//               priority values are not hardcoded. The default value 
//               is 7 (0x7).
// DefaultValue: 0x7
// EnumValues:   0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf
`define PRIORITY_7 4'h7


// Description:  Arbitration priority associated with Master 8. 
//               Priority 1 (0x1) is the lowest and Priority 15 (0xf) 
//               is the highest. It is not possible to configure a 
//               priority of zero (0x0), which disables the master. 
//               However, it is possible to program it, provided the 
//               priority values are not hardcoded. The default value 
//               is 8 (0x8).
// DefaultValue: 0x8
// EnumValues:   0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf
`define PRIORITY_8 4'h8


// Description:  Arbitration priority associated with Master 9. 
//               Priority 1 (0x1) is the lowest and Priority 15 (0xf) 
//               is the highest. It is not possible to configure a 
//               priority of zero (0x0), which disables the master. 
//               However, it is possible to program it, provided the 
//               priority values are not hardcoded. The default value 
//               is 9 (0x9).
// DefaultValue: 0x9
// EnumValues:   0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf
`define PRIORITY_9 4'h9


// Description:  Arbitration priority associated with Master 10. 
//               Priority 1 (0x1) is the lowest and Priority 15 (0xf) 
//               is the highest. It is not possible to configure a 
//               priority of zero (0x0), which disables the master. 
//               However, it is possible to program it, provided the 
//               priority values are not hardcoded. The default value 
//               is 10 (0xa).
// DefaultValue: 0xa
// EnumValues:   0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf
`define PRIORITY_10 4'ha


// Description:  Arbitration priority associated with Master 11. 
//               Priority 1 (0x1) is the lowest and Priority 15 (0xf) 
//               is the highest. It is not possible to configure a 
//               priority of zero (0x0), which disables the master. 
//               However, it is possible to program it, provided the 
//               priority values are not hardcoded. The default value 
//               is 11 (0xb).
// DefaultValue: 0xb
// EnumValues:   0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf
`define PRIORITY_11 4'hb


// Description:  Arbitration priority associated with Master 13. 
//               Priority 1 (0x1) is the lowest and Priority 15 (0xf) 
//               is the highest. It is not possible to configure a 
//               priority of zero (0x0), which disables the master. 
//               However, it is possible to program it, provided the 
//               priority values are not hardcoded. The default value 
//               is 13 (0xd).
// DefaultValue: 0xc
// EnumValues:   0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf
`define PRIORITY_12 4'hc


// Description:  Arbiter Priority.  Priority 15 (0xf) is highest 
//               Priority 1 (0x1) is lowest. Set to 0 will disable this master. 
//               Can only configure 1 to 15, 0 can be programmed through interface.
// DefaultValue: 0xd
// EnumValues:   0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf
`define PRIORITY_13 4'hd


// Description:  Arbitration priority associated with Master 14. 
//               Priority 1 (0x1) is the lowest and Priority 15 (0xf) 
//               is the highest. It is not possible to configure a 
//               priority of zero (0x0), which disables the master. 
//               However, it is possible to program it, provided the 
//               priority values are not hardcoded. The default value 
//               is 14 (0xe).
// DefaultValue: 0xe
// EnumValues:   0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf
`define PRIORITY_14 4'he


// Description:  Arbitration priority associated with Master 15. 
//               Priority 1 (0x1) is the lowest and Priority 15 (0xf) 
//               is the highest. It is not possible to configure a 
//               priority of zero (0x0), which disables the master. 
//               However, it is possible to program it, provided the 
//               priority values are not hardcoded. The default value 
//               is 15 (0xf).
// DefaultValue: 0xf
// EnumValues:   0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf
`define PRIORITY_15 4'hf


// Description:  Visibility of first Slave, which may be visible in 
//               Boot Mode, Normal Mode, or both modes. The number of 
//               slaves visible in the system may vary depending on the 
//               operating mode. This parameter option is active only 
//               if you enable the Memory Remap Feature (REMAP = 1) 
//               and have configured to use an internal decoder 
//               (AHB_HAS_XDCDR = 0) in the top-level parameter options.
// DefaultValue: Normal
// EnumValues:   1 2 3
// ValueRange:   Normal Boot {Normal & Boot}
`define VISIBLE_1 1


// Description:  The number of memory regions in Normal Mode for Slave #1. 
//               This parameter option is available only for Slave #1 and 
//               if the Slave Visibility Mode is set to "Normal" or "Normal 
//               & Boot". Additionally, this option applies only if you have 
//               an internal decoder (AHB_HAS_XDCDR = 0).
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


// Description:  Number of memory regions in Boot Mode for Slave #1. 
//               This parameter option is available only for Slave #1 
//               and if the Slave Visibility Mode is set to "Boot" or 
//               "Normal & Boot". Additionally, this option applies 
//               only if you have an internal decoder (AHB_HAS_XDCDR = 0).
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


// Description:  Generates only hsel for this slave; requires an aliases 
//               for data and response from another slave.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HSEL_ONLY_S1 0


// Description:  Slave number that supplies the data and 
//               response. The value must be less than, or equal 
//               to the value of NUM_IAHB_SLAVES. The value of this 
//               parameter cannot equal i, meaning you cannot alias 
//               this slave to itself. This parameter option is 
//               available only if the HSEL_ONLY_S1 is set to Yes.
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_S1 1


// Description:  If the slave has an hsplit bus, then set this parameter 
//               to True (1). When a slave is aliased, it takes its split 
//               capability from the slave it is aliased to. Therefore, 
//               this option will be dimmed if the HSEL_ONLY_S1 is set to Yes.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define SPLIT_CAPABLE_1 0


// Description:  Region 1, normal addressing mode, start address for Slave 1. 
//               This parameter option is available only if the 
//               "Slave Visibility Mode" is set to "Normal" or "Normal & Boot" 
//               and if you have an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x2000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_N_SA_1 32'h1000000


// Description:  Region 1, normal addressing mode, end address for 
//               Slave 1. This parameter option is available only if the 
//               "Slave Visibility Mode" is set to "Normal" or "Normal & Boot" 
//               and if you have an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x200ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_N_EA_1 32'h1ffffff


// Description:  Region 2, normal addressing mode, start address for 
//               Slave 1. Specified if the peripheral address region is 
//               spread over multiple regions. This parameter option is 
//               available only if the "Multiple Memory Regions in Normal Mode" 
//               is set to True (1) and if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x3000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_N_SA_1 32'h3000000


// Description:  Region 2, normal addressing mode, end address for 
//               Slave 1. Specified if the peripheral address region 
//               is spread over multiple regions. This parameter option 
//               is available only if the "Multiple Memory Regions in 
//               Normal Mode" is set to True (1) and if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x300ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_N_EA_1 32'h300ffff


// Description:  Region 3, normal addressing mode, start address for 
//               Slave 1. Specified if the peripheral address region is 
//               spread over multiple regions. This parameter option is 
//               available only if the "Multiple Memory Regions in Normal Mode" 
//               is set to True (1) and if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x4000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R3_N_SA_1 32'h4000000


// Description:  Region 3, normal addressing mode, end address for 
//               Slave 1. Specified if the peripheral address region 
//               is spread over multiple regions. This parameter option 
//               is available only if the "Multiple Memory Regions in 
//               Normal Mode" is set to True (1) and if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x400ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R3_N_EA_1 32'h400ffff


// Description:  Region 4, normal addressing mode, start address for 
//               Slave 1. Specified if the peripheral address region is 
//               spread over multiple regions. This parameter option is 
//               available only if the "Multiple Memory Regions in Normal Mode" 
//               is set to True (1) and if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x5000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R4_N_SA_1 32'h5000000


// Description:  Region 4, normal addressing mode, end address for 
//               Slave 1. Specified if the peripheral address region 
//               is spread over multiple regions. This parameter option 
//               is available only if the "Multiple Memory Regions in 
//               Normal Mode" is set to True (1) and if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x500ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R4_N_EA_1 32'h500ffff


// Description:  Region 5, normal addressing mode, start address for 
//               Slave 1. Specified if the peripheral address region is 
//               spread over multiple regions. This parameter option is 
//               available only if the "Multiple Memory Regions in Normal Mode" 
//               is set to True (1) and if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x6000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R5_N_SA_1 32'h6000000


// Description:  Region 5, normal addressing mode, end address for 
//               Slave 1. Specified if the peripheral address region 
//               is spread over multiple regions. This parameter option 
//               is available only if the "Multiple Memory Regions in 
//               Normal Mode" is set to True (1) and if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x600ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R5_N_EA_1 32'h600ffff


// Description:  Region 6, normal addressing mode, start address for 
//               Slave 1. Specified if the peripheral address region is 
//               spread over multiple regions. This parameter option is 
//               available only if the "Multiple Memory Regions in Normal Mode" 
//               is set to True (1) and if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x7000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R6_N_SA_1 32'h7000000


// Description:  Region 6, normal addressing mode, end address for 
//               Slave 1. Specified if the peripheral address region 
//               is spread over multiple regions. This parameter option 
//               is available only if the "Multiple Memory Regions in 
//               Normal Mode" is set to True (1) and if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x700ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R6_N_EA_1 32'h700ffff


// Description:  Region 7, normal addressing mode, start address for 
//               Slave 1. Specified if the peripheral address region is 
//               spread over multiple regions. This parameter option is 
//               available only if the "Multiple Memory Regions in Normal Mode" 
//               is set to True (1) and if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x8000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R7_N_SA_1 32'h8000000


// Description:  Region 7, normal addressing mode, end address for 
//               Slave 1. Specified if the peripheral address region 
//               is spread over multiple regions. This parameter option 
//               is available only if the "Multiple Memory Regions in 
//               Normal Mode" is set to True (1) and if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x800ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R7_N_EA_1 32'h800ffff


// Description:  Region 8, normal addressing mode, start address for 
//               Slave 1. Specified if the peripheral address region is 
//               spread over multiple regions. This parameter option is 
//               available only if the "Multiple Memory Regions in Normal Mode" 
//               is set to True (1) and if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x9000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R8_N_SA_1 32'h9000000


// Description:  Region 8, normal addressing mode, end address for 
//               Slave 1. Specified if the peripheral address region 
//               is spread over multiple regions. This parameter option 
//               is available only if the "Multiple Memory Regions in 
//               Normal Mode" is set to True (1) and if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x900ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R8_N_EA_1 32'h900ffff


// Description:  Region 1, boot addressing mode, start address for 
//               Slave 1. This option is applicable only if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0) and if REMAP = 1.
// DefaultValue: 0x27000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_B_SA_1 32'h27000000


// Description:  Region 1 boot, addressing mode, end address for 
//               Slave 1. This option is applicable only if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0) and if REMAP = 1.
// DefaultValue: 0x2700ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_B_EA_1 32'h2700ffff


// Description:  Region 2, boot addressing mode, start address for 
//               Slave 1. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x28000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_B_SA_1 32'h28000000


// Description:  Region 2, boot addressing mode, end address for 
//               Slave 1. This parameter option is available only 
//               if "Support Multiple Memory Regions in Boot Mode" 
//               is set to True (1), if you have an internal 
//               decoder (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x2800ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_B_EA_1 32'h2800ffff


// Description:  Region 3, boot addressing mode, start address for 
//               Slave 1. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x29000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R3_B_SA_1 32'h29000000


// Description:  Region 3, boot addressing mode, end address for 
//               Slave 1. This parameter option is available only 
//               if "Support Multiple Memory Regions in Boot Mode" 
//               is set to True (1), if you have an internal 
//               decoder (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x2900ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R3_B_EA_1 32'h2900ffff


// Description:  Region 4, boot addressing mode, start address for 
//               Slave 1. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x2a000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R4_B_SA_1 32'h2a000000


// Description:  Region 4, boot addressing mode, end address for 
//               Slave 1. This parameter option is available only 
//               if "Support Multiple Memory Regions in Boot Mode" 
//               is set to True (1), if you have an internal 
//               decoder (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x2a00ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R4_B_EA_1 32'h2a00ffff


// Description:  Region 5, boot addressing mode, start address for 
//               Slave 1. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x2b000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R5_B_SA_1 32'h2b000000


// Description:  Region 5, boot addressing mode, end address for 
//               Slave 1. This parameter option is available only 
//               if "Support Multiple Memory Regions in Boot Mode" 
//               is set to True (1), if you have an internal 
//               decoder (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x2b00ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R5_B_EA_1 32'h2b00ffff


// Description:  Region 6, boot addressing mode, start address for 
//               Slave 1. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x2c000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R6_B_SA_1 32'h2c000000


// Description:  Region 6, boot addressing mode, end address for 
//               Slave 1. This parameter option is available only 
//               if "Support Multiple Memory Regions in Boot Mode" 
//               is set to True (1), if you have an internal 
//               decoder (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x2c00ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R6_B_EA_1 32'h2c00ffff


// Description:  Region 7, boot addressing mode, start address for 
//               Slave 1. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x2d000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R7_B_SA_1 32'h2d000000


// Description:  Region 7, boot addressing mode, end address for 
//               Slave 1. This parameter option is available only 
//               if "Support Multiple Memory Regions in Boot Mode" 
//               is set to True (1), if you have an internal 
//               decoder (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x2d00ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R7_B_EA_1 32'h2d00ffff


// Description:  Region 8, boot addressing mode, start address for 
//               Slave 1. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x2e000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R8_B_SA_1 32'h2e000000


// Description:  Region 8, boot addressing mode, end address for 
//               Slave 1. This parameter option is available only 
//               if "Support Multiple Memory Regions in Boot Mode" 
//               is set to True (1), if you have an internal 
//               decoder (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x2e00ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R8_B_EA_1 32'h2e00ffff


// Description:  Visibility of second Slave, which is visible in 
//               Boot Mode, Normal Mode, or both modes.  The number of 
//               slaves visible in the system may vary depending on the 
//               operating mode. This parameter option is active only 
//               if you enable the Memory Remap Feature and have 
//               configured to use an internal decoder (AHB_HAS_XDCDR = 0) 
//               in the top-level parameter options.
// DefaultValue: Normal
// EnumValues:   1 2 3
// ValueRange:   Normal Boot {Normal & Boot}
`define VISIBLE_2 1


// Description:  Number of regions in Normal Mode for Slave 2. 
//               This parameter option is available only if the Slave 
//               Visibility Mode is set to "Normal" or "Normal & Boot". 
//               Additionally, this option only applies if you have 
//               an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_N2 0


// Description:  Region 1, normal addressing mode, start address for Slave 2. 
//               This parameter option is available only if the 
//               "Slave Visibility Mode" is set to "Normal" or "Normal & Boot" 
//               and if you have an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0xa000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_N_SA_2 32'h2000000


// Description:  Region 1, normal addressing mode, end address for 
//               Slave 2. This parameter option is available only if the 
//               "Slave Visibility Mode" is set to "Normal" or "Normal & Boot" 
//               and if you have an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0xa00ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_N_EA_2 32'h2ffffff


// Description:  Region 2, normal addressing mode, start address for 
//               Slave 2. Specified if the peripheral address region is 
//               spread over multiple regions. This parameter option is 
//               available only if the "Multiple Memory Regions in Normal Mode" 
//               is set to True (1) and if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0).
// DefaultValue: 0xb000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_N_SA_2 32'hb000000


// Description:  Region 2, normal addressing mode, end address for 
//               Slave 2. Specified if the peripheral address region 
//               is spread over multiple regions. This parameter option 
//               is available only if the "Multiple Memory Regions in Normal 
//               Mode" is set to True (1) and if you have an internal decoder 
//               AHB_HAS_XDCDR = 0).
// DefaultValue: 0xb00ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_N_EA_2 32'hb00ffff


// Description:  Number of regions in Boot Mode for Slave 2. This parameter 
//               option is available only if the Slave Visibility Mode is set to 
//               "Boot" or "Normal & Boot". This option applies only if you have 
//               an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_B2 0


// Description:  Region 1, boot addressing mode, start address for 
//               Slave 2. This option is applicable only if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0) and if REMAP = 1.
// DefaultValue: 0x2f000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_B_SA_2 32'h2f000000


// Description:  Region 1 boot, addressing mode, end address for 
//               Slave 2. This option is applicable only if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0) and if REMAP = 1.
// DefaultValue: 0x2f00ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_B_EA_2 32'h2f00ffff


// Description:  Region 2, boot addressing mode, start address for 
//               Slave 2. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x30000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_B_SA_2 32'h30000000


// Description:  Region 2, boot addressing mode, end address for 
//               Slave 2. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x3000ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_B_EA_2 32'h3000ffff


// Description:  When this is active, only the slave select port is 
//               generated on the interface. The corresponding data, 
//               and response ports are taken from another slave, which is 
//               specified by the "Number of slave which returns data 
//               and response". Even with an external decoder, 
//               the generation of select lines only is possible.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HSEL_ONLY_S2 0


// Description:  The value must be less than or equal to the value of 
//               NUM_IAHB_SLAVES. The value of this parameter cannot equal 2, 
//               meaning you cannot alias this slave to itself. This parameter 
//               option is available only if the HSEL_ONLY_S2 = 1.
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_S2 1


// Description:  If the slave has an hsplit bus, then set this parameter to True(1). 
//               When a slave is aliased, it takes its split capability 
//               from the aliased slave number. Therefore, this option will be 
//               dimmed if the HSEL_ONLY_S2 = 1.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define SPLIT_CAPABLE_2 1


// Description:  Visibility of third Slave, which is visible in 
//               Boot Mode, Normal Mode, or both modes.  The number of 
//               slaves visible in the system may vary depending on the 
//               operating mode. This parameter option is active only 
//               if you enable the Memory Remap Feature and have 
//               configured to use an internal decoder (AHB_HAS_XDCDR = 0) 
//               in the top-level parameter options.
// DefaultValue: Normal
// EnumValues:   1 2 3
// ValueRange:   Normal Boot {Normal & Boot}
`define VISIBLE_3 1


// Description:  Number of regions in Normal Mode for Slave 3. 
//               This parameter option is available only if the Slave 
//               Visibility Mode is set to "Normal" or "Normal & Boot". 
//               Additionally, this option only applies if you have 
//               an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_N3 0


// Description:  Region 1, normal addressing mode, start address for Slave 3. 
//               This parameter option is available only if the 
//               "Slave Visibility Mode" is set to "Normal" or "Normal & Boot" 
//               and if you have an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0xc000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_N_SA_3 32'hc000000


// Description:  Region 1, normal addressing mode, end address for 
//               Slave 3. This parameter option is available only if the 
//               "Slave Visibility Mode" is set to "Normal" or "Normal & Boot" 
//               and if you have an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0xc00ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_N_EA_3 32'hc00ffff


// Description:  Region 2, normal addressing mode, start address for 
//               Slave 3. Specified if the peripheral address region is 
//               spread over multiple regions. This parameter option is 
//               available only if the "Multiple Memory Regions in Normal Mode" 
//               is set to True (1) and if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0).
// DefaultValue: 0xd000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_N_SA_3 32'hd000000


// Description:  Region 2, normal addressing mode, end address for 
//               Slave 3. Specified if the peripheral address region 
//               is spread over multiple regions. This parameter option 
//               is available only if the "Multiple Memory Regions in Normal 
//               Mode" is set to True (1) and if you have an internal decoder 
//               AHB_HAS_XDCDR = 0).
// DefaultValue: 0xd00ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_N_EA_3 32'hd00ffff


// Description:  Number of regions in Boot Mode for Slave 3. This parameter 
//               option is available only if the Slave Visibility Mode is set to 
//               "Boot" or "Normal & Boot". This option applies only if you have 
//               an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_B3 0


// Description:  Region 1, boot addressing mode, start address for 
//               Slave 3. This option is applicable only if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0) and if REMAP = 1.
// DefaultValue: 0x31000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_B_SA_3 32'h31000000


// Description:  Region 1 boot, addressing mode, end address for 
//               Slave 3. This option is applicable only if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0) and if REMAP = 1.
// DefaultValue: 0x3100ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_B_EA_3 32'h3100ffff


// Description:  Region 2, boot addressing mode, start address for 
//               Slave 3. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x32000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_B_SA_3 32'h32000000


// Description:  Region 2, boot addressing mode, end address for 
//               Slave 3. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x3200ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_B_EA_3 32'h3200ffff


// Description:  When this is active, only the slave select port is 
//               generated on the interface. The corresponding data, 
//               and response ports are taken from another slave, which is 
//               specified by the "Number of slave which returns data 
//               and response". Even with an external decoder, 
//               the generation of select lines only is possible.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HSEL_ONLY_S3 0


// Description:  The value must be less than or equal to the value of 
//               NUM_IAHB_SLAVES. The value of this parameter cannot equal 3, 
//               meaning you cannot alias this slave to itself. This parameter 
//               option is available only if the HSEL_ONLY_S3 = 1.
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_S3 1


// Description:  If the slave has an hsplit bus, then set this parameter to True(1). 
//               When a slave is aliased, it takes its split capability 
//               from the aliased slave number. Therefore, this option will be 
//               dimmed if the HSEL_ONLY_S3 = 1.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define SPLIT_CAPABLE_3 0


// Description:  Visibility of fourth Slave, which is visible in 
//               Boot Mode, Normal Mode, or both modes.  The number of 
//               slaves visible in the system may vary depending on the 
//               operating mode. This parameter option is active only 
//               if you enable the Memory Remap Feature and have 
//               configured to use an internal decoder (AHB_HAS_XDCDR = 0) 
//               in the top-level parameter options.
// DefaultValue: Normal
// EnumValues:   1 2 3
// ValueRange:   Normal Boot {Normal & Boot}
`define VISIBLE_4 1


// Description:  Number of regions in Normal Mode for Slave 4. 
//               This parameter option is available only if the Slave 
//               Visibility Mode is set to "Normal" or "Normal & Boot". 
//               Additionally, this option only applies if you have 
//               an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_N4 0


// Description:  Region 1, normal addressing mode, start address for Slave 4. 
//               This parameter option is available only if the 
//               "Slave Visibility Mode" is set to "Normal" or "Normal & Boot" 
//               and if you have an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0xe000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_N_SA_4 32'he000000


// Description:  Region 1, normal addressing mode, end address for 
//               Slave 4. This parameter option is available only if the 
//               "Slave Visibility Mode" is set to "Normal" or "Normal & Boot" 
//               and if you have an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0xe00ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_N_EA_4 32'he00ffff


// Description:  Region 2, normal addressing mode, start address for 
//               Slave 4. Specified if the peripheral address region is 
//               spread over multiple regions. This parameter option is 
//               available only if the "Multiple Memory Regions in Normal Mode" 
//               is set to True (1) and if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0).
// DefaultValue: 0xf000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_N_SA_4 32'hf000000


// Description:  Region 2, normal addressing mode, end address for 
//               Slave 4. Specified if the peripheral address region 
//               is spread over multiple regions. This parameter option 
//               is available only if the "Multiple Memory Regions in Normal 
//               Mode" is set to True (1) and if you have an internal decoder 
//               AHB_HAS_XDCDR = 0).
// DefaultValue: 0xf00ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_N_EA_4 32'hf00ffff


// Description:  Number of regions in Boot Mode for Slave 4. This parameter 
//               option is available only if the Slave Visibility Mode is set to 
//               "Boot" or "Normal & Boot". This option applies only if you have 
//               an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_B4 0


// Description:  Region 1, boot addressing mode, start address for 
//               Slave 4. This option is applicable only if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0) and if REMAP = 1.
// DefaultValue: 0x33000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_B_SA_4 32'h33000000


// Description:  Region 1 boot, addressing mode, end address for 
//               Slave 4. This option is applicable only if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0) and if REMAP = 1.
// DefaultValue: 0x3300ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_B_EA_4 32'h3300ffff


// Description:  Region 2, boot addressing mode, start address for 
//               Slave 4. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x34000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_B_SA_4 32'h34000000


// Description:  Region 2, boot addressing mode, end address for 
//               Slave 4. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x3400ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_B_EA_4 32'h3400ffff


// Description:  When this is active, only the slave select port is 
//               generated on the interface. The corresponding data, 
//               and response ports are taken from another slave, which is 
//               specified by the "Number of slave which returns data 
//               and response". Even with an external decoder, 
//               the generation of select lines only is possible.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HSEL_ONLY_S4 0


// Description:  The value must be less than or equal to the value of 
//               NUM_IAHB_SLAVES. The value of this parameter cannot equal 4, 
//               meaning you cannot alias this slave to itself. This parameter 
//               option is available only if the HSEL_ONLY_S4 = 1.
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_S4 1


// Description:  If the slave has an hsplit bus, then set this parameter to True(1). 
//               When a slave is aliased, it takes its split capability 
//               from the aliased slave number. Therefore, this option will be 
//               dimmed if the HSEL_ONLY_S4 = 1.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define SPLIT_CAPABLE_4 0


// Description:  Visibility of fifth Slave, which is visible in 
//               Boot Mode, Normal Mode, or both modes.  The number of 
//               slaves visible in the system may vary depending on the 
//               operating mode. This parameter option is active only 
//               if you enable the Memory Remap Feature and have 
//               configured to use an internal decoder (AHB_HAS_XDCDR = 0) 
//               in the top-level parameter options.
// DefaultValue: Normal
// EnumValues:   1 2 3
// ValueRange:   Normal Boot {Normal & Boot}
`define VISIBLE_5 1


// Description:  Number of regions in Normal Mode for Slave 5. 
//               This parameter option is available only if the Slave 
//               Visibility Mode is set to "Normal" or "Normal & Boot". 
//               Additionally, this option only applies if you have 
//               an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_N5 0


// Description:  Region 1, normal addressing mode, start address for Slave 5. 
//               This parameter option is available only if the 
//               "Slave Visibility Mode" is set to "Normal" or "Normal & Boot" 
//               and if you have an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x10000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_N_SA_5 32'h10000000


// Description:  Region 1, normal addressing mode, end address for 
//               Slave 5. This parameter option is available only if the 
//               "Slave Visibility Mode" is set to "Normal" or "Normal & Boot" 
//               and if you have an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x1000ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_N_EA_5 32'h1000ffff


// Description:  Region 2, normal addressing mode, start address for 
//               Slave 5. Specified if the peripheral address region is 
//               spread over multiple regions. This parameter option is 
//               available only if the "Multiple Memory Regions in Normal Mode" 
//               is set to True (1) and if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x11000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_N_SA_5 32'h11000000


// Description:  Region 2, normal addressing mode, end address for 
//               Slave 5. Specified if the peripheral address region 
//               is spread over multiple regions. This parameter option 
//               is available only if the "Multiple Memory Regions in Normal 
//               Mode" is set to True (1) and if you have an internal decoder 
//               AHB_HAS_XDCDR = 0).
// DefaultValue: 0x1100ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_N_EA_5 32'h1100ffff


// Description:  Number of regions in Boot Mode for Slave 5. This parameter 
//               option is available only if the Slave Visibility Mode is set to 
//               "Boot" or "Normal & Boot". This option applies only if you have 
//               an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_B5 0


// Description:  Region 1, boot addressing mode, start address for 
//               Slave 4. This option is applicable only if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0) and if REMAP = 1.
// DefaultValue: 0x35000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_B_SA_5 32'h35000000


// Description:  Region 1 boot, addressing mode, end address for 
//               Slave 5. This option is applicable only if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0) and if REMAP = 1.
// DefaultValue: 0x3500ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_B_EA_5 32'h3500ffff


// Description:  Region 2, boot addressing mode, start address for 
//               Slave 5. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x36000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_B_SA_5 32'h36000000


// Description:  Region 2, boot addressing mode, end address for 
//               Slave 5. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x3600ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_B_EA_5 32'h3600ffff


// Description:  When this is active, only the slave select port is 
//               generated on the interface. The corresponding data, 
//               and response ports are taken from another slave, which is 
//               specified by the "Number of slave which returns data 
//               and response". Even with an external decoder, 
//               the generation of select lines only is possible.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HSEL_ONLY_S5 0


// Description:  The value must be less than or equal to the value of 
//               NUM_IAHB_SLAVES. The value of this parameter cannot equal 5, 
//               meaning you cannot alias this slave to itself. This parameter 
//               option is available only if the HSEL_ONLY_S5 = 1.
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_S5 1


// Description:  If the slave has an hsplit bus, then set this parameter to True(1). 
//               When a slave is aliased, it takes its split capability 
//               from the aliased slave number. Therefore, this option will be 
//               dimmed if the HSEL_ONLY_S5 = 1.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define SPLIT_CAPABLE_5 0


// Description:  Visibility of sixth Slave, which is visible in 
//               Boot Mode, Normal Mode, or both modes.  The number of 
//               slaves visible in the system may vary depending on the 
//               operating mode. This parameter option is active only 
//               if you enable the Memory Remap Feature and have 
//               configured to use an internal decoder (AHB_HAS_XDCDR = 0) 
//               in the top-level parameter options.
// DefaultValue: Normal
// EnumValues:   1 2 3
// ValueRange:   Normal Boot {Normal & Boot}
`define VISIBLE_6 1


// Description:  Number of regions in Normal Mode for Slave 6. 
//               This parameter option is available only if the Slave 
//               Visibility Mode is set to "Normal" or "Normal & Boot". 
//               Additionally, this option only applies if you have 
//               an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_N6 0


// Description:  Region 1, normal addressing mode, start address for Slave 6. 
//               This parameter option is available only if the 
//               "Slave Visibility Mode" is set to "Normal" or "Normal & Boot" 
//               and if you have an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x12000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_N_SA_6 32'h12000000


// Description:  Region 1, normal addressing mode, end address for 
//               Slave 6. This parameter option is available only if the 
//               "Slave Visibility Mode" is set to "Normal" or "Normal & Boot" 
//               and if you have an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x1200ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_N_EA_6 32'h1200ffff


// Description:  Region 2, normal addressing mode, start address for 
//               Slave 6. Specified if the peripheral address region is 
//               spread over multiple regions. This parameter option is 
//               available only if the "Multiple Memory Regions in Normal Mode" 
//               is set to True (1) and if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x13000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_N_SA_6 32'h13000000


// Description:  Region 2, normal addressing mode, end address for 
//               Slave 6. Specified if the peripheral address region 
//               is spread over multiple regions. This parameter option 
//               is available only if the "Multiple Memory Regions in Normal 
//               Mode" is set to True (1) and if you have an internal decoder 
//               AHB_HAS_XDCDR = 0).
// DefaultValue: 0x1300ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_N_EA_6 32'h1300ffff


// Description:  Number of regions in Boot Mode for Slave 6. This parameter 
//               option is available only if the Slave Visibility Mode is set to 
//               "Boot" or "Normal & Boot". This option applies only if you have 
//               an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_B6 0


// Description:  Region 1, boot addressing mode, start address for 
//               Slave 6. This option is applicable only if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0) and if REMAP = 1.
// DefaultValue: 0x37000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_B_SA_6 32'h37000000


// Description:  Region 1 boot, addressing mode, end address for 
//               Slave 6. This option is applicable only if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0) and if REMAP = 1.
// DefaultValue: 0x3700ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_B_EA_6 32'h3700ffff


// Description:  Region 2, boot addressing mode, start address for 
//               Slave 6. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x38000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_B_SA_6 32'h38000000


// Description:  Region 2, boot addressing mode, end address for 
//               Slave 6. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x3800ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_B_EA_6 32'h3800ffff


// Description:  When this is active, only the slave select port is 
//               generated on the interface. The corresponding data, 
//               and response ports are taken from another slave, which is 
//               specified by the "Number of slave which returns data 
//               and response". Even with an external decoder, 
//               the generation of select lines only is possible.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HSEL_ONLY_S6 0


// Description:  The value must be less than or equal to the value of 
//               NUM_IAHB_SLAVES. The value of this parameter cannot equal 6, 
//               meaning you cannot alias this slave to itself. This parameter 
//               option is available only if the HSEL_ONLY_S6 = 1.
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_S6 1


// Description:  If the slave has an hsplit bus, then set this parameter to True(1). 
//               When a slave is aliased, it takes its split capability 
//               from the aliased slave number. Therefore, this option will be 
//               dimmed if the HSEL_ONLY_S6 = 1.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define SPLIT_CAPABLE_6 0


// Description:  Visibility of seventh Slave, which is visible in 
//               Boot Mode, Normal Mode, or both modes.  The number of 
//               slaves visible in the system may vary depending on the 
//               operating mode. This parameter option is active only 
//               if you enable the Memory Remap Feature and have 
//               configured to use an internal decoder (AHB_HAS_XDCDR = 0) 
//               in the top-level parameter options.
// DefaultValue: Normal
// EnumValues:   1 2 3
// ValueRange:   Normal Boot {Normal & Boot}
`define VISIBLE_7 1


// Description:  Number of regions in Normal Mode for Slave 7. 
//               This parameter option is available only if the Slave 
//               Visibility Mode is set to "Normal" or "Normal & Boot". 
//               Additionally, this option only applies if you have 
//               an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_N7 0


// Description:  Region 1, normal addressing mode, start address for Slave 7. 
//               This parameter option is available only if the 
//               "Slave Visibility Mode" is set to "Normal" or "Normal & Boot" 
//               and if you have an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x14000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_N_SA_7 32'h14000000


// Description:  Region 1, normal addressing mode, end address for 
//               Slave 7. This parameter option is available only if the 
//               "Slave Visibility Mode" is set to "Normal" or "Normal & Boot" 
//               and if you have an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x1400ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_N_EA_7 32'h1400ffff


// Description:  Region 2, normal addressing mode, start address for 
//               Slave 7. Specified if the peripheral address region is 
//               spread over multiple regions. This parameter option is 
//               available only if the "Multiple Memory Regions in Normal Mode" 
//               is set to True (1) and if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x15000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_N_SA_7 32'h15000000


// Description:  Region 2, normal addressing mode, end address for 
//               Slave 7. Specified if the peripheral address region 
//               is spread over multiple regions. This parameter option 
//               is available only if the "Multiple Memory Regions in Normal 
//               Mode" is set to True (1) and if you have an internal decoder 
//               AHB_HAS_XDCDR = 0).
// DefaultValue: 0x1500ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_N_EA_7 32'h1500ffff


// Description:  Number of regions in Boot Mode for Slave 7. This parameter 
//               option is available only if the Slave Visibility Mode is set to 
//               "Boot" or "Normal & Boot". This option applies only if you have 
//               an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_B7 0


// Description:  Region 1, boot addressing mode, start address for 
//               Slave 7. This option is applicable only if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0) and if REMAP = 1.
// DefaultValue: 0x39000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_B_SA_7 32'h39000000


// Description:  Region 1 boot, addressing mode, end address for 
//               Slave 7. This option is applicable only if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0) and if REMAP = 1.
// DefaultValue: 0x3900ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_B_EA_7 32'h3900ffff


// Description:  Region 2, boot addressing mode, start address for 
//               Slave 7. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x3a000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_B_SA_7 32'h3a000000


// Description:  Region 2, boot addressing mode, end address for 
//               Slave 7. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x3a00ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_B_EA_7 32'h3a00ffff


// Description:  When this is active, only the slave select port is 
//               generated on the interface. The corresponding data, 
//               and response ports are taken from another slave, which is 
//               specified by the "Number of slave which returns data 
//               and response". Even with an external decoder, 
//               the generation of select lines only is possible.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HSEL_ONLY_S7 0


// Description:  The value must be less than or equal to the value of 
//               NUM_IAHB_SLAVES. The value of this parameter cannot equal 7, 
//               meaning you cannot alias this slave to itself. This parameter 
//               option is available only if the HSEL_ONLY_S7 = 1.
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_S7 1


// Description:  If the slave has an hsplit bus, then set this parameter to True(1). 
//               When a slave is aliased, it takes its split capability 
//               from the aliased slave number. Therefore, this option will be 
//               dimmed if the HSEL_ONLY_S7 = 1.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define SPLIT_CAPABLE_7 0


// Description:  Visibility of eighth Slave, which is visible in 
//               Boot Mode, Normal Mode, or both modes.  The number of 
//               slaves visible in the system may vary depending on the 
//               operating mode. This parameter option is active only 
//               if you enable the Memory Remap Feature and have 
//               configured to use an internal decoder (AHB_HAS_XDCDR = 0) 
//               in the top-level parameter options.
// DefaultValue: Normal
// EnumValues:   1 2 3
// ValueRange:   Normal Boot {Normal & Boot}
`define VISIBLE_8 1


// Description:  Number of regions in Normal Mode for Slave 8. 
//               This parameter option is available only if the Slave 
//               Visibility Mode is set to "Normal" or "Normal & Boot". 
//               Additionally, this option only applies if you have 
//               an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_N8 0


// Description:  Region 1, normal addressing mode, start address for Slave 8. 
//               This parameter option is available only if the 
//               "Slave Visibility Mode" is set to "Normal" or "Normal & Boot" 
//               and if you have an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x16000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_N_SA_8 32'h16000000


// Description:  Region 1, normal addressing mode, end address for 
//               Slave 8. This parameter option is available only if the 
//               "Slave Visibility Mode" is set to "Normal" or "Normal & Boot" 
//               and if you have an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x1600ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_N_EA_8 32'h1600ffff


// Description:  Region 2, normal addressing mode, start address for 
//               Slave 8. Specified if the peripheral address region is 
//               spread over multiple regions. This parameter option is 
//               available only if the "Multiple Memory Regions in Normal Mode" 
//               is set to True (1) and if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x17000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_N_SA_8 32'h17000000


// Description:  Region 2, normal addressing mode, end address for 
//               Slave 8. Specified if the peripheral address region 
//               is spread over multiple regions. This parameter option 
//               is available only if the "Multiple Memory Regions in Normal 
//               Mode" is set to True (1) and if you have an internal decoder 
//               AHB_HAS_XDCDR = 0).
// DefaultValue: 0x1700ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_N_EA_8 32'h1700ffff


// Description:  Number of regions in Boot Mode for Slave 8. This parameter 
//               option is available only if the Slave Visibility Mode is set to 
//               "Boot" or "Normal & Boot". This option applies only if you have 
//               an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_B8 0


// Description:  Region 1, boot addressing mode, start address for 
//               Slave 8. This option is applicable only if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0) and if REMAP = 1.
// DefaultValue: 0x3b000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_B_SA_8 32'h3b000000


// Description:  Region 1 boot, addressing mode, end address for 
//               Slave 8. This option is applicable only if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0) and if REMAP = 1.
// DefaultValue: 0x3b00ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_B_EA_8 32'h3b00ffff


// Description:  Region 2, boot addressing mode, start address for 
//               Slave 8. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x3c000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_B_SA_8 32'h3c000000


// Description:  Region 2, boot addressing mode, end address for 
//               Slave 8. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x3c00ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_B_EA_8 32'h3c00ffff


// Description:  When this is active, only the slave select port is 
//               generated on the interface. The corresponding data, 
//               and response ports are taken from another slave, which is 
//               specified by the "Number of slave which returns data 
//               and response". Even with an external decoder, 
//               the generation of select lines only is possible.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HSEL_ONLY_S8 0


// Description:  The value must be less than or equal to the value of 
//               NUM_IAHB_SLAVES. The value of this parameter cannot equal 8, 
//               meaning you cannot alias this slave to itself. This parameter 
//               option is available only if the HSEL_ONLY_S8 = 1.
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_S8 1


// Description:  If the slave has an hsplit bus, then set this parameter to True(1). 
//               When a slave is aliased, it takes its split capability 
//               from the aliased slave number. Therefore, this option will be 
//               dimmed if the HSEL_ONLY_S8 = 1.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define SPLIT_CAPABLE_8 0


// Description:  Visibility of ninth Slave, which is visible in 
//               Boot Mode, Normal Mode, or both modes.  The number of 
//               slaves visible in the system may vary depending on the 
//               operating mode. This parameter option is active only 
//               if you enable the Memory Remap Feature and have 
//               configured to use an internal decoder (AHB_HAS_XDCDR = 0) 
//               in the top-level parameter options.
// DefaultValue: Normal
// EnumValues:   1 2 3
// ValueRange:   Normal Boot {Normal & Boot}
`define VISIBLE_9 1


// Description:  Number of regions in Normal Mode for Slave 9. 
//               This parameter option is available only if the Slave 
//               Visibility Mode is set to "Normal" or "Normal & Boot". 
//               Additionally, this option only applies if you have 
//               an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_N9 0


// Description:  Region 1, normal addressing mode, start address for Slave 9. 
//               This parameter option is available only if the 
//               "Slave Visibility Mode" is set to "Normal" or "Normal & Boot" 
//               and if you have an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x18000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_N_SA_9 32'h18000000


// Description:  Region 1, normal addressing mode, end address for 
//               Slave 9. This parameter option is available only if the 
//               "Slave Visibility Mode" is set to "Normal" or "Normal & Boot" 
//               and if you have an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x1800ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_N_EA_9 32'h1800ffff


// Description:  Region 2, normal addressing mode, start address for 
//               Slave 9. Specified if the peripheral address region is 
//               spread over multiple regions. This parameter option is 
//               available only if the "Multiple Memory Regions in Normal Mode" 
//               is set to True (1) and if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x19000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_N_SA_9 32'h19000000


// Description:  Region 2, normal addressing mode, end address for 
//               Slave 9. Specified if the peripheral address region 
//               is spread over multiple regions. This parameter option 
//               is available only if the "Multiple Memory Regions in Normal 
//               Mode" is set to True (1) and if you have an internal decoder 
//               AHB_HAS_XDCDR = 0).
// DefaultValue: 0x1900ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_N_EA_9 32'h1900ffff


// Description:  Number of regions in Boot Mode for Slave 9. This parameter 
//               option is available only if the Slave Visibility Mode is set to 
//               "Boot" or "Normal & Boot". This option applies only if you have 
//               an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_B9 0


// Description:  Region 1, boot addressing mode, start address for 
//               Slave 9. This option is applicable only if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0) and if REMAP = 1.
// DefaultValue: 0x3d000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_B_SA_9 32'h3d000000


// Description:  Region 1 boot, addressing mode, end address for 
//               Slave 9. This option is applicable only if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0) and if REMAP = 1.
// DefaultValue: 0x3d00ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_B_EA_9 32'h3d00ffff


// Description:  Region 2, boot addressing mode, start address for 
//               Slave 9. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x3e000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_B_SA_9 32'h3e000000


// Description:  Region 2, boot addressing mode, end address for 
//               Slave 9. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x3e00ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_B_EA_9 32'h3e00ffff


// Description:  When this is active, only the slave select port is 
//               generated on the interface. The corresponding data, 
//               and response ports are taken from another slave, which is 
//               specified by the "Number of slave which returns data 
//               and response". Even with an external decoder, 
//               the generation of select lines only is possible.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HSEL_ONLY_S9 0


// Description:  The value must be less than or equal to the value of 
//               NUM_IAHB_SLAVES. The value of this parameter cannot equal 9, 
//               meaning you cannot alias this slave to itself. This parameter 
//               option is available only if the HSEL_ONLY_S9 = 1.
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_S9 1


// Description:  If the slave has an hsplit bus, then set this parameter to True(1). 
//               When a slave is aliased, it takes its split capability 
//               from the aliased slave number. Therefore, this option will be 
//               dimmed if the HSEL_ONLY_S9 = 1.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define SPLIT_CAPABLE_9 0


// Description:  Visibility of tenth Slave, which is visible in 
//               Boot Mode, Normal Mode, or both modes.  The number of 
//               slaves visible in the system may vary depending on the 
//               operating mode. This parameter option is active only 
//               if you enable the Memory Remap Feature and have 
//               configured to use an internal decoder (AHB_HAS_XDCDR = 0) 
//               in the top-level parameter options.
// DefaultValue: Normal
// EnumValues:   1 2 3
// ValueRange:   Normal Boot {Normal & Boot}
`define VISIBLE_10 1


// Description:  Number of regions in Normal Mode for Slave 10. 
//               This parameter option is available only if the Slave 
//               Visibility Mode is set to "Normal" or "Normal & Boot". 
//               Additionally, this option only applies if you have 
//               an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_N10 0


// Description:  Region 1, normal addressing mode, start address for Slave 10. 
//               This parameter option is available only if the 
//               "Slave Visibility Mode" is set to "Normal" or "Normal & Boot" 
//               and if you have an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x1a000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_N_SA_10 32'h1a000000


// Description:  Region 1, normal addressing mode, end address for 
//               Slave 10. This parameter option is available only if the 
//               "Slave Visibility Mode" is set to "Normal" or "Normal & Boot" 
//               and if you have an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x1a00ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_N_EA_10 32'h1a00ffff


// Description:  Region 2, normal addressing mode, start address for 
//               Slave 10. Specified if the peripheral address region is 
//               spread over multiple regions. This parameter option is 
//               available only if the "Multiple Memory Regions in Normal Mode" 
//               is set to True (1) and if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x1b000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_N_SA_10 32'h1b000000


// Description:  Region 2, normal addressing mode, end address for 
//               Slave 10. Specified if the peripheral address region 
//               is spread over multiple regions. This parameter option 
//               is available only if the "Multiple Memory Regions in Normal 
//               Mode" is set to True (1) and if you have an internal decoder 
//               AHB_HAS_XDCDR = 0).
// DefaultValue: 0x1b00ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_N_EA_10 32'h1b00ffff


// Description:  Number of regions in Boot Mode for Slave 10. This parameter 
//               option is available only if the Slave Visibility Mode is set to 
//               "Boot" or "Normal & Boot". This option applies only if you have 
//               an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_B10 0


// Description:  Region 1, boot addressing mode, start address for 
//               Slave 10. This option is applicable only if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0) and if REMAP = 1.
// DefaultValue: 0x3f000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_B_SA_10 32'h3f000000


// Description:  Region 1 boot, addressing mode, end address for 
//               Slave 10. This option is applicable only if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0) and if REMAP = 1.
// DefaultValue: 0x3f00ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_B_EA_10 32'h3f00ffff


// Description:  Region 2, boot addressing mode, start address for 
//               Slave 10. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x40000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_B_SA_10 32'h40000000


// Description:  Region 2, boot addressing mode, end address for 
//               Slave 10. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x4000ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_B_EA_10 32'h4000ffff


// Description:  When this is active, only the slave select port is 
//               generated on the interface. The corresponding data 
//               and response ports are taken from another slave, which is 
//               specified by the "Number of slave which returns data 
//               and response". Even with an external decoder, 
//               the generation of select lines only is possible.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HSEL_ONLY_S10 0


// Description:  The value must be less than or equal to the value of 
//               NUM_IAHB_SLAVES. The value of this parameter cannot equal 10, 
//               meaning you cannot alias this slave to itself. This parameter 
//               option is available only if the HSEL_ONLY_S10 = 1.
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_S10 1


// Description:  If the slave has an hsplit bus, then set this parameter to True(1). 
//               When a slave is aliased, it takes its split capability 
//               from the aliased slave number. Therefore, this option will be 
//               dimmed if the HSEL_ONLY_S10 = 1.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define SPLIT_CAPABLE_10 0


// Description:  Visibility of eleventh Slave, which is visible in 
//               Boot Mode, Normal Mode, or both modes.  The number of 
//               slaves visible in the system may vary depending on the 
//               operating mode. This parameter option is active only 
//               if you enable the Memory Remap Feature and have 
//               configured to use an internal decoder (AHB_HAS_XDCDR = 0) 
//               in the top-level parameter options.
// DefaultValue: Normal
// EnumValues:   1 2 3
// ValueRange:   Normal Boot {Normal & Boot}
`define VISIBLE_11 1


// Description:  Number of regions in Normal Mode for Slave 11. 
//               This parameter option is available only if the Slave 
//               Visibility Mode is set to "Normal" or "Normal & Boot". 
//               Additionally, this option only applies if you have 
//               an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_N11 0


// Description:  Region 1, normal addressing mode, start address for Slave 11. 
//               This parameter option is available only if the 
//               "Slave Visibility Mode" is set to "Normal" or "Normal & Boot" 
//               and if you have an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x1c000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_N_SA_11 32'h1c000000


// Description:  Region 1, normal addressing mode, end address for 
//               Slave 11. This parameter option is available only if the 
//               "Slave Visibility Mode" is set to "Normal" or "Normal & Boot" 
//               and if you have an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x1c00ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_N_EA_11 32'h1c00ffff


// Description:  Region 2, normal addressing mode, start address for 
//               Slave 11. Specified if the peripheral address region is 
//               spread over multiple regions. This parameter option is 
//               available only if the "Multiple Memory Regions in Normal Mode" 
//               is set to True (1) and if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x1d000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_N_SA_11 32'h1d000000


// Description:  Region 2, normal addressing mode, end address for 
//               Slave 11. Specified if the peripheral address region 
//               is spread over multiple regions. This parameter option 
//               is available only if the "Multiple Memory Regions in Normal 
//               Mode" is set to True (1) and if you have an internal decoder 
//               AHB_HAS_XDCDR = 0).
// DefaultValue: 0x1d00ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_N_EA_11 32'h1d00ffff


// Description:  Number of regions in Boot Mode for Slave 11. This parameter 
//               option is available only if the Slave Visibility Mode is set to 
//               "Boot" or "Normal & Boot". This option applies only if you have 
//               an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_B11 0


// Description:  Region 1, boot addressing mode, start address for 
//               Slave 11. This option is applicable only if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0) and if REMAP = 1.
// DefaultValue: 0x41000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_B_SA_11 32'h41000000


// Description:  Region 1 boot, addressing mode, end address for 
//               Slave 11. This option is applicable only if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0) and if REMAP = 1.
// DefaultValue: 0x4100ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_B_EA_11 32'h4100ffff


// Description:  Region 2, boot addressing mode, start address for 
//               Slave 11. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x42000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_B_SA_11 32'h42000000


// Description:  Region 2, boot addressing mode, end address for 
//               Slave 11. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x4200ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_B_EA_11 32'h4200ffff


// Description:  When this is active, only the slave select port is 
//               generated on the interface. The corresponding data 
//               and response ports are taken from another slave, which is 
//               specified by the "Number of slave which returns data 
//               and response". Even with an external decoder, 
//               the generation of select lines only is possible.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HSEL_ONLY_S11 0


// Description:  The value must be less than or equal to the value of 
//               NUM_IAHB_SLAVES. The value of this parameter cannot equal 11, 
//               meaning you cannot alias this slave to itself. This parameter 
//               option is available only if the HSEL_ONLY_S11 = 1.
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_S11 1


// Description:  If the slave has an hsplit bus, then set this parameter to True(1). 
//               When a slave is aliased, it takes its split capability 
//               from the aliased slave number. Therefore, this option will be 
//               dimmed if the HSEL_ONLY_S11 = 1.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define SPLIT_CAPABLE_11 0


// Description:  Visibility of twelvth Slave, which is visible in 
//               Boot Mode, Normal Mode, or both modes.  The number of 
//               slaves visible in the system may vary depending on the 
//               operating mode. This parameter option is active only 
//               if you enable the Memory Remap Feature and have 
//               configured to use an internal decoder (AHB_HAS_XDCDR = 0) 
//               in the top-level parameter options.
// DefaultValue: Normal
// EnumValues:   1 2 3
// ValueRange:   Normal Boot {Normal & Boot}
`define VISIBLE_12 1


// Description:  Number of regions in Normal Mode for Slave 12. 
//               This parameter option is available only if the Slave 
//               Visibility Mode is set to "Normal" or "Normal & Boot". 
//               Additionally, this option only applies if you have 
//               an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_N12 0


// Description:  Region 1, normal addressing mode, start address for Slave 12. 
//               This parameter option is available only if the 
//               "Slave Visibility Mode" is set to "Normal" or "Normal & Boot" 
//               and if you have an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x1e000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_N_SA_12 32'h1e000000


// Description:  Region 1, normal addressing mode, end address for 
//               Slave 12. This parameter option is available only if the 
//               "Slave Visibility Mode" is set to "Normal" or "Normal & Boot" 
//               and if you have an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x1e00ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_N_EA_12 32'h1e00ffff


// Description:  Region 2, normal addressing mode, start address for 
//               Slave 12. Specified if the peripheral address region is 
//               spread over multiple regions. This parameter option is 
//               available only if the "Multiple Memory Regions in Normal Mode" 
//               is set to True (1) and if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x1f000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_N_SA_12 32'h1f000000


// Description:  Region 2, normal addressing mode, end address for 
//               Slave 12. Specified if the peripheral address region 
//               is spread over multiple regions. This parameter option 
//               is available only if the "Multiple Memory Regions in Normal 
//               Mode" is set to True (1) and if you have an internal decoder 
//               AHB_HAS_XDCDR = 0).
// DefaultValue: 0x1f00ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_N_EA_12 32'h1f00ffff


// Description:  Number of regions in Boot Mode for Slave 12. This parameter 
//               option is available only if the Slave Visibility Mode is set to 
//               "Boot" or "Normal & Boot". This option applies only if you have 
//               an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_B12 0


// Description:  Region 1, boot addressing mode, start address for 
//               Slave 12. This option is applicable only if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0) and if REMAP = 1.
// DefaultValue: 0x43000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_B_SA_12 32'h43000000


// Description:  Region 1 boot, addressing mode, end address for 
//               Slave 12. This option is applicable only if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0) and if REMAP = 1.
// DefaultValue: 0x4300ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_B_EA_12 32'h4300ffff


// Description:  Region 2, boot addressing mode, start address for 
//               Slave 12. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x44000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_B_SA_12 32'h44000000


// Description:  Region 2, boot addressing mode, end address for 
//               Slave 12. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x4400ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_B_EA_12 32'h4400ffff


// Description:  When this is active, only the slave select port is 
//               generated on the interface. The corresponding data 
//               and response ports are taken from another slave, which is 
//               specified by the "Number of slave which returns data 
//               and response". Even with an external decoder, 
//               the generation of select lines only is possible.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HSEL_ONLY_S12 0


// Description:  The value must be less than or equal to the value of 
//               NUM_IAHB_SLAVES. The value of this parameter cannot equal 12, 
//               meaning you cannot alias this slave to itself. This parameter 
//               option is available only if the HSEL_ONLY_S12 = 1.
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_S12 1


// Description:  If the slave has an hsplit bus, then set this parameter to True(1). 
//               When a slave is aliased, it takes its split capability 
//               from the aliased slave number. Therefore, this option will be 
//               dimmed if the HSEL_ONLY_S12 = 1.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define SPLIT_CAPABLE_12 0


// Description:  Visibility of thirteenth Slave, which is visible in 
//               Boot Mode, Normal Mode, or both modes.  The number of 
//               slaves visible in the system may vary depending on the 
//               operating mode. This parameter option is active only 
//               if you enable the Memory Remap Feature and have 
//               configured to use an internal decoder (AHB_HAS_XDCDR = 0) 
//               in the top-level parameter options.
// DefaultValue: Normal
// EnumValues:   1 2 3
// ValueRange:   Normal Boot {Normal & Boot}
`define VISIBLE_13 1


// Description:  Number of regions in Normal Mode for Slave 13. 
//               This parameter option is available only if the Slave 
//               Visibility Mode is set to "Normal" or "Normal & Boot". 
//               Additionally, this option only applies if you have 
//               an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_N13 0


// Description:  Region 1, normal addressing mode, start address for Slave 13. 
//               This parameter option is available only if the 
//               "Slave Visibility Mode" is set to "Normal" or "Normal & Boot" 
//               and if you have an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x20000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_N_SA_13 32'h20000000


// Description:  Region 1, normal addressing mode, end address for 
//               Slave 13. This parameter option is available only if the 
//               "Slave Visibility Mode" is set to "Normal" or "Normal & Boot" 
//               and if you have an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x2000ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_N_EA_13 32'h2000ffff


// Description:  Region 2, normal addressing mode, start address for 
//               Slave 13. Specified if the peripheral address region is 
//               spread over multiple regions. This parameter option is 
//               available only if the "Multiple Memory Regions in Normal Mode" 
//               is set to True (1) and if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x21000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_N_SA_13 32'h21000000


// Description:  Region 2, normal addressing mode, end address for 
//               Slave 13. Specified if the peripheral address region 
//               is spread over multiple regions. This parameter option 
//               is available only if the "Multiple Memory Regions in Normal 
//               Mode" is set to True (1) and if you have an internal decoder 
//               AHB_HAS_XDCDR = 0).
// DefaultValue: 0x2100ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_N_EA_13 32'h2100ffff


// Description:  Number of regions in Boot Mode for Slave 13. This parameter 
//               option is available only if the Slave Visibility Mode is set to 
//               "Boot" or "Normal & Boot". This option applies only if you have 
//               an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_B13 0


// Description:  Region 1, boot addressing mode, start address for 
//               Slave 13. This option is applicable only if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0) and if REMAP = 1.
// DefaultValue: 0x45000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_B_SA_13 32'h45000000


// Description:  Region 1 boot, addressing mode, end address for 
//               Slave 13. This option is applicable only if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0) and if REMAP = 1.
// DefaultValue: 0x4500ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_B_EA_13 32'h4500ffff


// Description:  Region 2, boot addressing mode, start address for 
//               Slave 13. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x46000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_B_SA_13 32'h46000000


// Description:  Region 2, boot addressing mode, end address for 
//               Slave 13. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x4600ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_B_EA_13 32'h4600ffff


// Description:  When this is active, only the slave select port is 
//               generated on the interface. The corresponding data 
//               and response ports are taken from another slave, which is 
//               specified by the "Number of slave which returns data 
//               and response". Even with an external decoder, 
//               the generation of select lines only is possible.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HSEL_ONLY_S13 0


// Description:  The value must be less than or equal to the value of 
//               NUM_IAHB_SLAVES. The value of this parameter cannot equal 13, 
//               meaning you cannot alias this slave to itself. This parameter 
//               option is available only if the HSEL_ONLY_S13 = 1.
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_S13 1


// Description:  If the slave has an hsplit bus, then set this parameter to True(1). 
//               When a slave is aliased, it takes its split capability 
//               from the aliased slave number. Therefore, this option will be 
//               dimmed if the HSEL_ONLY_S13 = 1.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define SPLIT_CAPABLE_13 0


// Description:  Visibility of fourteenth Slave, which is visible in 
//               Boot Mode, Normal Mode, or both modes.  The number of 
//               slaves visible in the system may vary depending on the 
//               operating mode. This parameter option is active only 
//               if you enable the Memory Remap Feature and have 
//               configured to use an internal decoder (AHB_HAS_XDCDR = 0) 
//               in the top-level parameter options.
// DefaultValue: Normal
// EnumValues:   1 2 3
// ValueRange:   Normal Boot {Normal & Boot}
`define VISIBLE_14 1


// Description:  Number of regions in Normal Mode for Slave 14. 
//               This parameter option is available only if the Slave 
//               Visibility Mode is set to "Normal" or "Normal & Boot". 
//               Additionally, this option only applies if you have 
//               an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_N14 0


// Description:  Region 1, normal addressing mode, start address for Slave 14. 
//               This parameter option is available only if the 
//               "Slave Visibility Mode" is set to "Normal" or "Normal & Boot" 
//               and if you have an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x22000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_N_SA_14 32'h22000000


// Description:  Region 1, normal addressing mode, end address for 
//               Slave 14. This parameter option is available only if the 
//               "Slave Visibility Mode" is set to "Normal" or "Normal & Boot" 
//               and if you have an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x2200ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_N_EA_14 32'h2200ffff


// Description:  Region 2, normal addressing mode, start address for 
//               Slave 14. Specified if the peripheral address region is 
//               spread over multiple regions. This parameter option is 
//               available only if the "Multiple Memory Regions in Normal Mode" 
//               is set to True (1) and if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x23000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_N_SA_14 32'h23000000


// Description:  Region 2, normal addressing mode, end address for 
//               Slave 14. Specified if the peripheral address region 
//               is spread over multiple regions. This parameter option 
//               is available only if the "Multiple Memory Regions in Normal 
//               Mode" is set to True (1) and if you have an internal decoder 
//               AHB_HAS_XDCDR = 0).
// DefaultValue: 0x2300ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_N_EA_14 32'h2300ffff


// Description:  Number of regions in Boot Mode for Slave 14. This parameter 
//               option is available only if the Slave Visibility Mode is set to 
//               "Boot" or "Normal & Boot". This option applies only if you have 
//               an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_B14 0


// Description:  Region 1, boot addressing mode, start address for 
//               Slave 14. This option is applicable only if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0) and if REMAP = 1.
// DefaultValue: 0x47000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_B_SA_14 32'h47000000


// Description:  Region 1 boot, addressing mode, end address for 
//               Slave 14. This option is applicable only if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0) and if REMAP = 1.
// DefaultValue: 0x4700ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_B_EA_14 32'h4700ffff


// Description:  Region 2, boot addressing mode, start address for 
//               Slave 14. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x48000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_B_SA_14 32'h48000000


// Description:  Region 2, boot addressing mode, end address for 
//               Slave 14. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x4800ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_B_EA_14 32'h4800ffff


// Description:  When this is active, only the slave select port is 
//               generated on the interface. The corresponding data 
//               and response ports are taken from another slave, which is 
//               specified by the "Number of slave which returns data 
//               and response". Even with an external decoder, 
//               the generation of select lines only is possible.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HSEL_ONLY_S14 0


// Description:  The value must be less than or equal to the value of 
//               NUM_IAHB_SLAVES. The value of this parameter cannot equal 14, 
//               meaning you cannot alias this slave to itself. This parameter 
//               option is available only if the HSEL_ONLY_S14 = 1.
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_S14 1


// Description:  If the slave has an hsplit bus, then set this parameter to True(1). 
//               When a slave is aliased, it takes its split capability 
//               from the aliased slave number. Therefore, this option will be 
//               dimmed if the HSEL_ONLY_S14 = 1.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define SPLIT_CAPABLE_14 0


// Description:  Visibility of sixteenth Slave, which is visible in 
//               Boot Mode, Normal Mode, or both modes.  The number of 
//               slaves visible in the system may vary depending on the 
//               operating mode. This parameter option is active only 
//               if you enable the Memory Remap Feature and have 
//               configured to use an internal decoder (AHB_HAS_XDCDR = 0) 
//               in the top-level parameter options.
// DefaultValue: Normal
// EnumValues:   1 2 3
// ValueRange:   Normal Boot {Normal & Boot}
`define VISIBLE_15 1


// Description:  Number of regions in Normal Mode for Slave 15. 
//               This parameter option is available only if the Slave 
//               Visibility Mode is set to "Normal" or "Normal & Boot". 
//               Additionally, this option only applies if you have 
//               an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_N15 0


// Description:  Region 1, normal addressing mode, start address for Slave 15. 
//               This parameter option is available only if the 
//               "Slave Visibility Mode" is set to "Normal" or "Normal & Boot" 
//               and if you have an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x24000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_N_SA_15 32'h24000000


// Description:  Region 1, normal addressing mode, end address for 
//               Slave 15. This parameter option is available only if the 
//               "Slave Visibility Mode" is set to "Normal" or "Normal & Boot" 
//               and if you have an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x2400ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_N_EA_15 32'h2400ffff


// Description:  Region 2, normal addressing mode, start address for 
//               Slave 15. Specified if the peripheral address region is 
//               spread over multiple regions. This parameter option is 
//               available only if the "Multiple Memory Regions in Normal Mode" 
//               is set to True (1) and if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0).
// DefaultValue: 0x25000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_N_SA_15 32'h25000000


// Description:  Region 2, normal addressing mode, end address for 
//               Slave 15. Specified if the peripheral address region 
//               is spread over multiple regions. This parameter option 
//               is available only if the "Multiple Memory Regions in Normal 
//               Mode" is set to True (1) and if you have an internal decoder 
//               AHB_HAS_XDCDR = 0).
// DefaultValue: 0x2500ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_N_EA_15 32'h2500ffff


// Description:  Number of regions in Boot Mode for Slave 15. This parameter 
//               option is available only if the Slave Visibility Mode is set to 
//               "Boot" or "Normal & Boot". This option applies only if you have 
//               an internal decoder (AHB_HAS_XDCDR = 0).
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define MR_B15 0


// Description:  Region 1, boot addressing mode, start address for 
//               Slave 15. This option is applicable only if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0) and if REMAP = 1.
// DefaultValue: 0x49000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_B_SA_15 32'h49000000


// Description:  Region 1 boot, addressing mode, end address for 
//               Slave 15. This option is applicable only if you have an 
//               internal decoder (AHB_HAS_XDCDR = 0) and if REMAP = 1.
// DefaultValue: 0x4900ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R1_B_EA_15 32'h4900ffff


// Description:  Region 2, boot addressing mode, start address for 
//               Slave 15. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x4a000000
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_B_SA_15 32'h4a000000


// Description:  Region 2, boot addressing mode, end address for 
//               Slave 15. This parameter option is available only if 
//               "Support Multiple Memory Regions in Boot Mode" is set to 
//               True (1), if you have an internal decoder 
//               (AHB_HAS_XDCDR = 0), and if REMAP = 1.
// DefaultValue: 0x4a00ffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define R2_B_EA_15 32'h4a00ffff


// Description:  When this is active, only the slave select port is 
//               generated on the interface. The corresponding data 
//               and response ports are taken from another slave, which is 
//               specified by the "Number of slave which returns data 
//               and response". Even with an external decoder, 
//               the generation of select lines only is possible.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define HSEL_ONLY_S15 0


// Description:  The value must be less than or equal to the value of 
//               NUM_IAHB_SLAVES. The value of this parameter cannot equal 15, 
//               meaning you cannot alias this slave to itself. This parameter 
//               option is available only if the HSEL_ONLY_S15 = 1.
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_S15 1


// Description:  If the slave has an hsplit bus, then set this parameter to True(1). 
//               When a slave is aliased, it takes its split capability 
//               from the aliased slave number. Therefore, this option will be 
//               dimmed if the HSEL_ONLY_S15 = 1.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define SPLIT_CAPABLE_15 0


// Description:  The token counters can count on clock cycles or 
//               on bus cycles to calculate the number of tokens a master is using. 
//               Configured AHB is not an AMBA Lite AHB. Enabled if an Arbiter 
//               Slave Interface is included and weighted token arbitration 
//               has been enabled.
// DefaultValue: Clock-Cycle
// EnumValues:   0 1
// ValueRange:   Clock-Cycle Bus-Cycle
`define AHB_TPS_MODE 0


// Description:  The width of the total counter is configurable and is 
//               used to reduce the number of registers required when 
//               the design is configured. The counter should be wide 
//               enough to count the sum of all the individual master 
//               tokens.  
//               Enabled if the configured AHB is not an AMBA Lite AHB. 
//               Enabled if an Arbiter Slave Interface is included and 
//               weighted token arbitration has been enabled.
// DefaultValue: 32
// MinValue:     4
// MaxValue:     32
`define AHB_TCL_WIDTH 32


// Description:  The width of the master counter is configurable and 
//               is used to reduce the number of registers required 
//               when the design is configured. Each master counter is 
//               the same width and needs to be wide enough to count 
//               the correct number of tokens for a master. Enabled 
//               if the configured AHB is not an AMBA Lite AHB. 
//               Enabled if an Arbiter Slave Interface is included and  
//               weighted token arbitration has been enabled. 
//               The number of bits in the arbitration counter must  
//               not be less than the number of bits in the master  
//               token counter.
// DefaultValue: 32
// MinValue:     4
// MaxValue:     32
`define AHB_CCL_WIDTH 32


// Description:  Hardcoded values 
//               Hardcoding programmable registers allows the register count to be redcued. 
//               The length of the arbitration period can be hardcoded. 
//               The number of tokens for each master can be hard coded. 
//               Enabled if the configured AHB is not an AMBA Lite AHB. 
//               Enabled if an Arbiter Slave Interface is included and weighted 
//               token arbitration has been enabled.
// DefaultValue: true
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_HC_TOKENS 1


// Description:  An arbitration period is defined over this number of 
//               tokens. When a new arbitration period starts, the master 
//               counters are reloaded. On the interface, the output 
//               ahb_wt_aps gives a one cycle pulse when a new arbitration 
//               period begins. Enabled if the configured AHB is not an AMBA Lite AHB. 
//               Enabled if an Arbiter Slave Interface is included and weighted 
//               token arbitration has been enabled. The maximum value is 
//               controlled by the number of bits in the arbitration counter.
// DefaultValue: 0xffff
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define AHB_TCL 32'hffff


// Description:  Each master is assigned a number of clock tokens that it can 
//               use and be guaranteed to get this number of cycles over 
//               an arbitration period. Masters with tokens remaining have 
//               priority over masters that have used all of their tokens. 
//               User-configured token values are summed to ensure that they 
//               do not exceed the total allocated number of tokens. A user 
//               can specify any number of tokens for a master. The larger 
//               the value, the more the number of tokens. To facilitate an 
//               infinite number of tokens, the value of 0 represents infinite 
//               tokens. Configured AHB is not an AMBA Lite AHB. Enabled if an 
//               Arbiter Slave Interface is included and weighted token 
//               arbitration has been enabled. The maximum value is controlled 
//               by the number of bits in a master token counter.
// DefaultValue: 0xf
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define AHB_CL_M1 32'hf


// Description:  Each master is assigned a number of clock tokens that it can 
//               use and be guaranteed to get this number of cycles over 
//               an arbitration period. Masters with tokens remaining have 
//               priority over masters that have used all of their tokens. 
//               User-configured token values are summed to ensure that they 
//               do not exceed the total allocated number of tokens. A user 
//               can specify any number of tokens for a master. The larger 
//               the value, the more the number of tokens. To facilitate an 
//               infinite number of tokens, the value of 0 represents infinite 
//               tokens. Configured AHB is not an AMBA Lite AHB. Enabled if an 
//               Arbiter Slave Interface is included and weighted token 
//               arbitration has been enabled. The maximum value is controlled 
//               by the number of bits in a master token counter.
// DefaultValue: 0xf
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define AHB_CL_M2 32'hf


// Description:  Each master is assigned a number of clock tokens that it can 
//               use and be guaranteed to get this number of cycles over 
//               an arbitration period. Masters with tokens remaining have 
//               priority over masters that have used all of their tokens. 
//               User-configured token values are summed to ensure that they 
//               do not exceed the total allocated number of tokens. A user 
//               can specify any number of tokens for a master. The larger 
//               the value, the more the number of tokens. To facilitate an 
//               infinite number of tokens, the value of 0 represents infinite 
//               tokens. Configured AHB is not an AMBA Lite AHB. Enabled if an 
//               Arbiter Slave Interface is included and weighted token 
//               arbitration has been enabled. The maximum value is controlled 
//               by the number of bits in a master token counter.
// DefaultValue: 0xf
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define AHB_CL_M3 32'hf


// Description:  Each master is assigned a number of clock tokens that it can 
//               use and be guaranteed to get this number of cycles over 
//               an arbitration period. Masters with tokens remaining have 
//               priority over masters that have used all of their tokens. 
//               User-configured token values are summed to ensure that they 
//               do not exceed the total allocated number of tokens. A user 
//               can specify any number of tokens for a master. The larger 
//               the value, the more the number of tokens. To facilitate an 
//               infinite number of tokens, the value of 0 represents infinite 
//               tokens. Configured AHB is not an AMBA Lite AHB. Enabled if an 
//               Arbiter Slave Interface is included and weighted token 
//               arbitration has been enabled. The maximum value is controlled 
//               by the number of bits in a master token counter.
// DefaultValue: 0xf
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define AHB_CL_M4 32'hf


// Description:  Each master is assigned a number of clock tokens that it can 
//               use and be guaranteed to get this number of cycles over 
//               an arbitration period. Masters with tokens remaining have 
//               priority over masters that have used all of their tokens. 
//               User-configured token values are summed to ensure that they 
//               do not exceed the total allocated number of tokens. A user 
//               can specify any number of tokens for a master. The larger 
//               the value, the more the number of tokens. To facilitate an 
//               infinite number of tokens, the value of 0 represents infinite 
//               tokens. Configured AHB is not an AMBA Lite AHB. Enabled if an 
//               Arbiter Slave Interface is included and weighted token 
//               arbitration has been enabled. The maximum value is controlled 
//               by the number of bits in a master token counter.
// DefaultValue: 0xf
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define AHB_CL_M5 32'hf


// Description:  Each master is assigned a number of clock tokens that it can 
//               use and be guaranteed to get this number of cycles over 
//               an arbitration period. Masters with tokens remaining have 
//               priority over masters that have used all of their tokens. 
//               User-configured token values are summed to ensure that they 
//               do not exceed the total allocated number of tokens. A user 
//               can specify any number of tokens for a master. The larger 
//               the value, the more the number of tokens. To facilitate an 
//               infinite number of tokens, the value of 0 represents infinite 
//               tokens. Configured AHB is not an AMBA Lite AHB. Enabled if an 
//               Arbiter Slave Interface is included and weighted token 
//               arbitration has been enabled. The maximum value is controlled 
//               by the number of bits in a master token counter.
// DefaultValue: 0xf
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define AHB_CL_M6 32'hf


// Description:  Each master is assigned a number of clock tokens that it can 
//               use and be guaranteed to get this number of cycles over 
//               an arbitration period. Masters with tokens remaining have 
//               priority over masters that have used all of their tokens. 
//               User-configured token values are summed to ensure that they 
//               do not exceed the total allocated number of tokens. A user 
//               can specify any number of tokens for a master. The larger 
//               the value, the more the number of tokens. To facilitate an 
//               infinite number of tokens, the value of 0 represents infinite 
//               tokens. Configured AHB is not an AMBA Lite AHB. Enabled if an 
//               Arbiter Slave Interface is included and weighted token 
//               arbitration has been enabled. The maximum value is controlled 
//               by the number of bits in a master token counter.
// DefaultValue: 0xf
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define AHB_CL_M7 32'hf


// Description:  Each master is assigned a number of clock tokens that it can 
//               use and be guaranteed to get this number of cycles over 
//               an arbitration period. Masters with tokens remaining have 
//               priority over masters that have used all of their tokens. 
//               User-configured token values are summed to ensure that they 
//               do not exceed the total allocated number of tokens. A user 
//               can specify any number of tokens for a master. The larger 
//               the value, the more the number of tokens. To facilitate an 
//               infinite number of tokens, the value of 0 represents infinite 
//               tokens. Configured AHB is not an AMBA Lite AHB. Enabled if an 
//               Arbiter Slave Interface is included and weighted token 
//               arbitration has been enabled. The maximum value is controlled 
//               by the number of bits in a master token counter.
// DefaultValue: 0xf
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define AHB_CL_M8 32'hf


// Description:  Each master is assigned a number of clock tokens that it can 
//               use and be guaranteed to get this number of cycles over 
//               an arbitration period. Masters with tokens remaining have 
//               priority over masters that have used all of their tokens. 
//               User-configured token values are summed to ensure that they 
//               do not exceed the total allocated number of tokens. A user 
//               can specify any number of tokens for a master. The larger 
//               the value, the more the number of tokens. To facilitate an 
//               infinite number of tokens, the value of 0 represents infinite 
//               tokens. Configured AHB is not an AMBA Lite AHB. Enabled if an 
//               Arbiter Slave Interface is included and weighted token 
//               arbitration has been enabled. The maximum value is controlled 
//               by the number of bits in a master token counter.
// DefaultValue: 0xf
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define AHB_CL_M9 32'hf


// Description:  Each master is assigned a number of clock tokens that it can 
//               use and be guaranteed to get this number of cycles over 
//               an arbitration period. Masters with tokens remaining have 
//               priority over masters that have used all of their tokens. 
//               User-configured token values are summed to ensure that they 
//               do not exceed the total allocated number of tokens. A user 
//               can specify any number of tokens for a master. The larger 
//               the value, the more the number of tokens. To facilitate an 
//               infinite number of tokens, the value of 0 represents infinite 
//               tokens. Configured AHB is not an AMBA Lite AHB. Enabled if an 
//               Arbiter Slave Interface is included and weighted token 
//               arbitration has been enabled. The maximum value is controlled 
//               by the number of bits in a master token counter.
// DefaultValue: 0xf
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define AHB_CL_M10 32'hf


// Description:  Each master is assigned a number of clock tokens that it can 
//               use and be guaranteed to get this number of cycles over 
//               an arbitration period. Masters with tokens remaining have 
//               priority over masters that have used all of their tokens. 
//               User-configured token values are summed to ensure that they 
//               do not exceed the total allocated number of tokens. A user 
//               can specify any number of tokens for a master. The larger 
//               the value, the more the number of tokens. To facilitate an 
//               infinite number of tokens, the value of 0 represents infinite 
//               tokens. Configured AHB is not an AMBA Lite AHB. Enabled if an 
//               Arbiter Slave Interface is included and weighted token 
//               arbitration has been enabled. The maximum value is controlled 
//               by the number of bits in a master token counter.
// DefaultValue: 0xf
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define AHB_CL_M11 32'hf


// Description:  Each master is assigned a number of clock tokens that it can 
//               use and be guaranteed to get this number of cycles over 
//               an arbitration period. Masters with tokens remaining have 
//               priority over masters that have used all of their tokens. 
//               User-configured token values are summed to ensure that they 
//               do not exceed the total allocated number of tokens. A user 
//               can specify any number of tokens for a master. The larger 
//               the value, the more the number of tokens. To facilitate an 
//               infinite number of tokens, the value of 0 represents infinite 
//               tokens. Configured AHB is not an AMBA Lite AHB. Enabled if an 
//               Arbiter Slave Interface is included and weighted token 
//               arbitration has been enabled. The maximum value is controlled 
//               by the number of bits in a master token counter.
// DefaultValue: 0xf
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define AHB_CL_M12 32'hf


// Description:  Each master is assigned a number of clock tokens that it can 
//               use and be guaranteed to get this number of cycles over 
//               an arbitration period. Masters with tokens remaining have 
//               priority over masters that have used all of their tokens. 
//               User-configured token values are summed to ensure that they 
//               do not exceed the total allocated number of tokens. A user 
//               can specify any number of tokens for a master. The larger 
//               the value, the more the number of tokens. To facilitate an 
//               infinite number of tokens, the value of 0 represents infinite 
//               tokens. Configured AHB is not an AMBA Lite AHB. Enabled if an 
//               Arbiter Slave Interface is included and weighted token 
//               arbitration has been enabled. The maximum value is controlled 
//               by the number of bits in a master token counter.
// DefaultValue: 0xf
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define AHB_CL_M13 32'hf


// Description:  Each master is assigned a number of clock tokens that it can 
//               use and be guaranteed to get this number of cycles over 
//               an arbitration period. Masters with tokens remaining have 
//               priority over masters that have used all of their tokens. 
//               User-configured token values are summed to ensure that they 
//               do not exceed the total allocated number of tokens. A user 
//               can specify any number of tokens for a master. The larger 
//               the value, the more the number of tokens. To facilitate an 
//               infinite number of tokens, the value of 0 represents infinite 
//               tokens. Configured AHB is not an AMBA Lite AHB. Enabled if an 
//               Arbiter Slave Interface is included and weighted token 
//               arbitration has been enabled. The maximum value is controlled 
//               by the number of bits in a master token counter.
// DefaultValue: 0xf
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define AHB_CL_M14 32'hf


// Description:  Each master is assigned a number of clock tokens that it can 
//               use and be guaranteed to get this number of cycles over 
//               an arbitration period. Masters with tokens remaining have 
//               priority over masters that have used all of their tokens. 
//               User-configured token values are summed to ensure that they 
//               do not exceed the total allocated number of tokens. A user 
//               can specify any number of tokens for a master. The larger 
//               the value, the more the number of tokens. To facilitate an 
//               infinite number of tokens, the value of 0 represents infinite 
//               tokens. Configured AHB is not an AMBA Lite AHB. Enabled if an 
//               Arbiter Slave Interface is included and weighted token 
//               arbitration has been enabled. The maximum value is controlled 
//               by the number of bits in a master token counter.
// DefaultValue: 0xf
// MinValue:     0x0
// MaxValue:     =sHdl::MaxValFromWidth
`define AHB_CL_M15 32'hf


// Description:  Generate only hgrant and hbusreq for this master as the master has a number 
//               of request and grant lines but only one set of control lines.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_REQGNT_ONLY_M1 0


// Description:  ID Number of master which supplies the address and control
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_M1 1


// Description:  Generate only hgrant and hbusreq for this master as the master has a number 
//               of request and grant lines but only one set of control lines.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_REQGNT_ONLY_M2 0


// Description:  ID Number of master which supplies the address and control
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_M2 1


// Description:  Generate only hgrant and hbusreq for this master as the master has a number 
//               of request and grant lines but only one set of control lines.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_REQGNT_ONLY_M3 0


// Description:  ID Number of master which supplies the address and control
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_M3 1


// Description:  Generate only hgrant and hbusreq for this master as the master has a number 
//               of request and grant lines but only one set of control lines.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_REQGNT_ONLY_M4 0


// Description:  ID Number of master which supplies the address and control
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_M4 1


// Description:  Generate only hgrant and hbusreq for this master as the master has a number 
//               of request and grant lines but only one set of control lines.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_REQGNT_ONLY_M5 0


// Description:  ID Number of master which supplies the address and control
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_M5 1


// Description:  Generate only hgrant and hbusreq for this master as the master has a number 
//               of request and grant lines but only one set of control lines.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_REQGNT_ONLY_M6 0


// Description:  ID Number of master which supplies the address and control
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_M6 1


// Description:  Generate only hgrant and hbusreq for this master as the master has a number 
//               of request and grant lines but only one set of control lines.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_REQGNT_ONLY_M7 0


// Description:  ID Number of master which supplies the address and control
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_M7 1


// Description:  Generate only hgrant and hbusreq for this master as the master has a number 
//               of request and grant lines but only one set of control lines.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_REQGNT_ONLY_M8 0


// Description:  ID Number of master which supplies the address and control
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_M8 1


// Description:  Generate only hgrant and hbusreq for this master as the master has a number 
//               of request and grant lines but only one set of control lines.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_REQGNT_ONLY_M9 0


// Description:  ID Number of master which supplies the address and control
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_M9 1


// Description:  Generate only hgrant and hbusreq for this master as the master has a number 
//               of request and grant lines but only one set of control lines.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_REQGNT_ONLY_M10 0


// Description:  ID Number of master which supplies the address and control
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_M10 1


// Description:  Generate only hgrant and hbusreq for this master as the master has a number 
//               of request and grant lines but only one set of control lines.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_REQGNT_ONLY_M11 0


// Description:  ID Number of master which supplies the address and control
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_M11 1


// Description:  Generate only hgrant and hbusreq for this master as the master has a number 
//               of request and grant lines but only one set of control lines.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_REQGNT_ONLY_M12 0


// Description:  ID Number of master which supplies the address and control
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_M12 1


// Description:  Generate only hgrant and hbusreq for this master as the master has a number 
//               of request and grant lines but only one set of control lines.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_REQGNT_ONLY_M13 0


// Description:  ID Number of master which supplies the address and control
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_M13 1


// Description:  Generate only hgrant and hbusreq for this master as the master has a number 
//               of request and grant lines but only one set of control lines.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_REQGNT_ONLY_M14 0


// Description:  ID Number of master which supplies the address and control
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_M14 1


// Description:  Generate only hgrant and hbusreq for this master as the master has a number 
//               of request and grant lines but only one set of control lines.
// DefaultValue: false
// EnumValues:   0 1
// ValueRange:   false true
`define AHB_REQGNT_ONLY_M15 0


// Description:  ID Number of master which supplies the address and control
// DefaultValue: 1
// EnumValues:   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
`define ALIAS_M15 1


// Description:  Allows the arbiter to split on a cycle by cycle basis. 
//               Does not split over locked transfers. 
//               Will allow the arbitration be broken for fixed length bursts.
// DefaultValue: false
// EnumValues:   0x0 0x1
// ValueRange:   false true
`define AHB_SINGLE_CYCLE_ARBITRATION 1'h0


// Description:  Each corekit has a version number. 
//               This is relected in the ascii version number which needs to get translated. 
//                0 => 48 -> 30 
//                1 => 49 -> 31 
//                2 => 50 -> 32 
//                A => 65 -> 41 
//                B => 66 -> 42 
//                C => 67 -> 43 
//                
//               Current Version is 2.01* => 32_30_31_2A
// DefaultValue: 0x3230312a
// MinValue:     0x0
// MaxValue:     0xffffffff
`define AHB_VERSION_ID 32'h3230312a
