#########################################################
# LEDA Standard Engineering Council Rules
# http://sp-sg/sites/DesignWare/QMS/Policies/
#    (folder: Leda Engineering Council Rules)
#########################################################
# 1.03 March 19th, 2013
#      Removed NTL_CDC01_2 (Protocol Synchronizer Detected, informative only)
#      Removed duplicate rules of FM_2_2:
#        C_1C_R, DCVER_173, DCVER_176
#      Removed rule W126 (Non integer delay)
#      Removed rule W529 (ifdef may not be supported by some synthesis tools)
#        since it conflicts with QMS check: Use "ifndef SYNTHESIS...endif"
#        instead of translate_off and translate_on to hide simulation-only
#        code from synthesis tool 
#
# 1.02 October 9th, 2012
#      Activated rule FM_2_8
#
# 1.01 September 19th, 2012
#      Activated ruleset STATEMENTS from policy LEDA, but 
#      removed rules B_3404, B_3405, B_3431, B_3437, B_3439
#
# 1.00 July 31st, 2012
#      New ruleset released
#########################################################

rule_deselect -all
rule_select   -policy DC
rule_select   -policy DESIGN
rule_select   -policy DESIGNWARE
rule_select   -policy DFT
rule_select   -policy FORMALITY
rule_select   -policy LEDA
rule_select   -policy RMM_RTL_CODING_GUIDELINES
rule_select   -policy VERILINT


#########################################################
#  Exceptions to 'DESIGN' policy rules
#########################################################

# SNPS - Removing nice-to-have rules that are too strict at this moment
rule_deselect -policy DESIGN -ruleset CLOCKS
# SNPS - Following ruleset should be used only with gatelevel netlist
rule_deselect -policy DESIGN -ruleset DFT
# SNPS - Using less restrictive naming conventions
rule_deselect -policy DESIGN -ruleset NAMING
# SNPS - No PADs in digital cores
rule_deselect -policy DESIGN -ruleset PAD
# SNPS - Removing nice-to-have rules that are too strict at this moment
rule_deselect -policy DESIGN -ruleset PARTITIONING
# SNPS - Removing nice-to-have rules that are too strict at this moment
rule_deselect -policy DESIGN -ruleset RESETS
# SNPS - Removing nice-to-have rules that are too strict at this moment
rule_deselect -policy DESIGN -ruleset STRUCTURE
# Rule NTL_RST06 is to Avoid internally generated resets
# CHECK_ASYNCHRONOUS_RESET_ONLY: If you set this parameter to "1",
#   this rule checks only the internally generated asynchronous reset signals.
rule_set_parameter -rule NTL_RST06 -parameter CHECK_ASYNCHRONOUS_RESET_ONLY -value 1
# Type of Synchronizer detected
# SNPS - These rules are informative only
rule_deselect -policy DESIGN  -rule NTL_CDC01_0
rule_deselect -policy DESIGN  -rule NTL_CDC01_1
rule_deselect -policy DESIGN  -rule NTL_CDC01_2
rule_deselect -policy DESIGN  -rule NTL_CDC01_3
rule_deselect -policy DESIGN  -rule NTL_CDC01_4
rule_deselect -policy DESIGN  -rule NTL_CDC01_5
rule_deselect -policy DESIGN  -rule NTL_CDC01_6
# Use only one clock domain 
rule_deselect -policy DESIGN  -rule NTL_CLK01
# Use only one clock signal per unit
rule_deselect -policy DESIGN  -rule NTL_CLK02
# Multiple asynchronous clock domain signals converging on <gate_name> 
rule_deselect -policy DESIGN  -rule NTL_CLK23
# Unconnected top-level input port
# SNPS - This rule is covered by NTL_CON37
rule_deselect -policy DESIGN  -rule NTL_CON01
# Non driving net
# SNPS - This rule is covered by NTL_CON13A, NTL_CON13C, NTL_CON37
rule_deselect -policy DESIGN  -rule NTL_CON13
# non driving hierarchical pin
# SNPS - This rule is covered by B_1011 and NTL_CON13A
rule_deselect -policy DESIGN  -rule NTL_CON13B
# Incorrect connection: Module output is connected to input of its sub-module
# SNPS - We may want to use this type of connection
rule_deselect -policy DESIGN  -rule NTL_CON23
# Number of pin-pairs in design.
rule_deselect -policy DESIGN  -rule NTL_CON25
# Leda flags NTL_CON32 violations when it finds a net that is not connected to any of the output
#   signals and also forms a data loop. You can use the CON32_MERGE_SLICED_SIGNALS parameter to
#   merge the violations with sliced signals reported in the main message.
rule_set_parameter -rule NTL_CON32 -parameter  CON32_MERGE_SLICED_SIGNALS -value 1
# Not all bits of a bus are read
# SNPS - This rule is covered by NTL_CON13, NTL_CON13A
rule_deselect -policy DESIGN  -rule NTL_CON34
# Input to Instance not driven 
# SNPS - This rule does not work when top-level signals are mapped directly to a sub-module
rule_deselect -policy DESIGN  -rule NTL_CON40
# Unused signals
# SNPS - This rule is covered by NTL_CON37+NTL_CON12A
rule_deselect -policy DESIGN  -rule NTL_LAN15
# Use only fully synchronous flip-flops
# SNPS - We do want to use FFs with asynchronous reset
rule_deselect -policy DESIGN -rule NTL_STR01
# Avoid glue logic at top level
rule_deselect -policy DESIGN -rule NTL_STR07
# VDD and GND must not be fed directly into logic
rule_deselect -policy DESIGN -rule NTL_STR11
# Flip-flop not active in test mode 
rule_deselect -policy DESIGN -rule NTL_STR52
# The maximum number of flip-flops that belong to one clock domain should not exceed x
rule_deselect -policy DESIGN  -rule NTL_STR67
# The number of ports in modules
rule_deselect -policy DESIGN  -rule NTL_STR88


#########################################################
#  Exceptions to 'DESIGNWARE' policy rules
#########################################################

# SNPS - Using less restrictive naming conventions
rule_deselect -policy DESIGNWARE -ruleset MODULE_FILE
# SNPS - Using less restrictive naming conventions
rule_deselect -policy DESIGNWARE -ruleset NAMES
# No glue logic at top level
rule_deselect -policy DESIGNWARE -rule A_8C_R
# Naming convention for state variables: name should end in _cs 
rule_deselect -policy DESIGNWARE -rule CS_2C_R
# Case statement must have a default assignment to prevent latch inference
rule_deselect -policy DESIGNWARE -rule C_4C_R_A
# Begin Instance names with U_
rule_deselect -policy DESIGNWARE -rule I_3C_G
# No logical expressions are allowed in port maps
rule_deselect -policy DESIGNWARE -rule I_6C_R
# Only lowercase characters are allowed in input port names
rule_deselect -policy DESIGNWARE -rule PWR_1C_G_A
# Only lowercase characters are allowed in output port names
rule_deselect -policy DESIGNWARE -rule PWR_1C_G_C
# Include comments for each wire or reg declaration
rule_deselect -policy DESIGNWARE -rule PWR_6C_G
# All outputs should be registered.
rule_deselect -policy DESIGNWARE -rule S_6C_R_A 


#########################################################
#  Exceptions to 'DFT' policy rules
#########################################################

# Multiple clocks in the unit
rule_deselect -policy DFT -rule DFT_006
# Register all outputs from the block for improved coverage
rule_deselect -policy DFT -rule DFT_009
# Synchronous reset/set/load detected
rule_deselect -policy DFT -rule DFT_017
# Asynchronous reset/set/load detected
rule_deselect -policy DFT -rule DFT_019


#########################################################
#  Exceptions to 'FORMALITY' policy rules
#########################################################

# Identifier of instance starts with DW. If it is a DesignWare Foundation cell, then Formality requires extra settings
rule_deselect -policy FORMALITY -rule FM_1_3
# Non driven output ports or signals detected
# SNPS - This rule is covered by NTL_CON12A
rule_deselect -policy FORMALITY -rule FM_2_23


#########################################################
#  Check for full_case and parallel_case directives
#########################################################

# Do not use full_case directives in case statements
rule_select -verilog -policy VER_STARC_DSG -ruleset S_2_8_CASE_STATEMENT_DESCRIPTION -rule VER_2_8_1_5
# Do not use parallel_case directives in case statements
rule_select -verilog -policy VER_STARC_DSG -ruleset S_2_8_CASE_STATEMENT_DESCRIPTION -rule VER_2_8_5_1


#########################################################
#  Exceptions to 'LEDA' policy rules
#########################################################

# Removing nice-to-have rules that are too strict at this moment
rule_deselect -policy LEDA -ruleset CLOCKS
rule_deselect -policy LEDA -ruleset DESIGN_STRUCTURE
# Exception to rule B_1011, required to detect missing port connections
rule_select   -policy LEDA -rule B_1011
rule_deselect -policy LEDA -ruleset HDL_NAMING
rule_deselect -policy LEDA -ruleset RESETS
rule_deselect -policy LEDA -ruleset RTL_NAMING
rule_deselect -policy LEDA -ruleset STATE_MACHINES
# Message: Not using the bit field specifications in the port connection of module instantiation
rule_deselect -policy LEDA -rule B_1019
# Message: Synchronous reset/set/load signal is not a primary input to the current unit
rule_deselect -policy LEDA -rule B_1401
# SNPS - We do want to use asynchonous resets, so removing the rule
# Message: Asynchronous reset/set/load <%item> exists in module/unit
rule_deselect -policy LEDA -rule B_1404
# Message: Several synchronous reset in this unit detected
rule_deselect -policy LEDA -rule B_1406
# Message: Case statement should have a default case
rule_deselect -policy LEDA -rule B_3403
# Message: Casex statement should have a default case
rule_deselect -policy LEDA -rule B_3404
# Message: Casez statement should have a default case
rule_deselect -policy LEDA -rule B_3405
# Message: Function return not at the end
rule_deselect -policy LEDA -rule B_3431
# Message: Memory declaration detected
rule_deselect -policy LEDA -rule B_3437
# Message: `undef statement found
rule_deselect -policy LEDA -rule B_3439
# Message: Moore style description of state machines is recommended
rule_deselect -policy LEDA -rule B_3602
# Message: Mealy style description of state machines is recommended
rule_deselect -policy LEDA -rule B_3603
# Naming convention for state variables: name should end in _cs
rule_deselect -policy LEDA -rule B_3606
# The number of states in a state machine should be a power of 2
rule_deselect -policy LEDA -rule B_3607
# Flipflop with fixed value data input is detected
# SNPS - This rule does not take in account math expressions
rule_deselect -policy LEDA -rule C_1001
# Glue logic at top level is detected
rule_deselect -policy LEDA -rule C_1004
# Only one clock allowed in the design
rule_deselect -policy LEDA -rule C_1200
# Only 1 reset/set/load allowed in the design. <%value> have been detected 
rule_deselect -policy LEDA -rule C_1400
# The case statement is not x_uglified per the VRQ x-uglify standard
rule_deselect -policy LEDA -rule XPROP_CASE
# The casez statement is not x_uglified per the VRQ x-uglify standard
rule_deselect -policy LEDA -rule XPROP_CASEZ
# Message: The conditional statement is not x_uglified per the VRQ x-uglify standard
rule_deselect -policy LEDA -rule XPROP_IF
# Message: The LHS of this assignment is variable index, and not x_uglified per the VRQ x-uglify standard
rule_deselect -policy LEDA -rule XPROP_INDEX_BA
# Message: The conditional expression is not x_uglified per the VRQ x-uglify standard
rule_deselect -policy LEDA -rule XPROP_TERN_COND_EXP
# Message: The LHS of this assignment is variable index, and not x_uglified per the VRQ x-uglify standard
rule_deselect -policy LEDA -rule XPROP_INDEX_NBA
# Message: The RHS of this assignment is conditional expression, and not x_uglified per the VRQ x-uglify standard
rule_deselect -policy LEDA -rule XPROP_TERN_CASE_EXP
# Message: The RHS of this assignment is conditional expression, and not x_uglified per the VRQ x-uglify standard
rule_deselect -policy LEDA -rule XPROP_TERN_RHS


#########################################################
#  Exceptions to 'RMM_RTL_CODING_GUIDELINES' policy rules
#########################################################

# Rule G_527_1 is to limit the number of characters in 1 line
# LINE_LENGTH parameter: You can use the parameter to change the maximum line length checked by this rule.
rule_set_parameter -rule G_527_1 -parameter LINE_LENGTH -value 140
# Name is too long - Max 20 characters
rule_deselect -policy RMM_RTL_CODING_GUIDELINES -rule G_521_5
# Clock name should be clk or prefixed with clk
rule_deselect -policy RMM_RTL_CODING_GUIDELINES -rule G_521_6
# Active high resets should be prefixed with rst
rule_deselect -policy RMM_RTL_CODING_GUIDELINES -rule G_521_9_A
# Active low resets should be called rst_n
rule_deselect -policy RMM_RTL_CODING_GUIDELINES -rule G_521_9_B
# Use same name/similar names for ports and signals
rule_deselect -policy RMM_RTL_CODING_GUIDELINES -rule G_521_11
# Flipflop outputs should have suffix _r
rule_deselect -policy RMM_RTL_CODING_GUIDELINES -rule G_521_13_B
# SNPS - Headers automatically inserted by cC, so no need for
#        rules checking the header
# Header comments are missing
rule_deselect -policy RMM_RTL_CODING_GUIDELINES -rule R_524_1_A
# Modification field missing from header comment
rule_deselect -policy RMM_RTL_CODING_GUIDELINES -rule R_524_1_B
# Description field missing from header comment
rule_deselect -policy RMM_RTL_CODING_GUIDELINES -rule R_524_1_C
# Date field missing from header comment
rule_deselect -policy RMM_RTL_CODING_GUIDELINES -rule R_524_1_D
# Author field missing from header comment
rule_deselect -policy RMM_RTL_CODING_GUIDELINES -rule R_524_1_E
# Filename field missing from header comment
rule_deselect -policy RMM_RTL_CODING_GUIDELINES -rule R_524_1_F
# Use a separate line for each HDL statement
# SNPS - Sometimes this is best way to code for readability
rule_deselect -policy RMM_RTL_CODING_GUIDELINES -rule R_526_1
# The number of characters in 1 line should not exceed
rule_deselect -policy RMM_RTL_CODING_GUIDELINES -rule G_527_1
# Avoid internally generated reset/set/load <%item> 
rule_deselect -policy RMM_RTL_CODING_GUIDELINES -rule G_546_1
# Use 'if(<%context> == 'b0)' for falling edge asynchronous reset/set/load expressions
rule_deselect -policy RMM_RTL_CODING_GUIDELINES -rule G_551_1_E
# Avoid glue logic at top level 
rule_deselect -policy RMM_RTL_CODING_GUIDELINES -rule G_568_1
# Ports must be declared in the following order: input inout output 
rule_deselect -policy RMM_RTL_CODING_GUIDELINES -rule R_5210_1_B
# Instance names should begin with U_
rule_deselect -policy RMM_RTL_CODING_GUIDELINES -rule G_5215_4


#########################################################
#  Exceptions to 'VERILINT' policy rules
#########################################################

# Message: Case statement without default clause but all the cases are covered
rule_deselect -policy VERILINT -rule W69
# Message: Non integer delay
rule_deselect -policy VERILINT -rule W126
# Message: Not all possible cases covered but default case exists
rule_deselect -policy VERILINT -rule W332
# Message: Extension of zero bits in a constant 
rule_deselect -policy VERILINT -rule W341
# Message: Reset is not an input to the module
rule_deselect -policy VERILINT -rule W402
# Message: ifdef may not be supported by some synthesis tools
rule_deselect -policy VERILINT -rule W529
# Truncating leading zeros (or x's or z's)
rule_deselect -policy VERILINT -rule W531
# Message: Synchronous flipflop is inferred
rule_deselect -policy VERILINT -rule W548
# Message: Asynchronous flipflop is inferred
rule_deselect -policy VERILINT -rule W549
# Message: Mux is inferred
rule_deselect -policy VERILINT -rule W550
# Message: Inferred a counter
rule_deselect -policy VERILINT -rule W570


#########################################################
#  Removing obsolete rules
#########################################################

# Obsolete rules replaced by NTL_STR33
rule_deselect -rule C_1000
rule_deselect -rule C_8C_R
rule_deselect -rule FM_1_1
rule_deselect -rule TEST_960
rule_deselect -rule G_553_1
# Obsolete rules replaced by NTL_STR61
rule_deselect -rule C_1201
rule_deselect -rule DCHDL_175
rule_deselect -rule W403
# Obsolete rules replaced by NTL_CLK07
rule_deselect -rule C_1207
rule_deselect -rule A_5C_R_B
rule_deselect -rule G_543_1
# Obsolete rules replaced by NTL_RST08
rule_deselect -rule C_1401
rule_deselect -rule A_5C_R_D
rule_deselect -rule C_1402
# Obsolete rules replaced by NTL_CLK13
rule_deselect -rule C_1206
rule_deselect -rule A_5C_R_A
rule_deselect -rule G_542_1
# Obsolete rules replaced by NTL_RST12
rule_deselect -rule C_1403
rule_deselect -rule A_5C_R_C
# Obsolete rules replaced by NTL_STR06
rule_deselect -rule C_1005
rule_deselect -rule G_561_1
# Obsolete rules replaced by NTL_STR19
rule_deselect -rule C_1008
# Obsolete rules replaced by NTL_STR72
rule_deselect -rule C_1009
# Obsolete rules replaced by NTL_STR76
# Leda recomments deselecting FM_2_8, at it is obsolete.
# However, according to trials, rule FM_2_8 is still necessary because it detects combinations of two issues:
# (i)  signals driven by multiple modules (covered by NTL_STR89);
# (ii) signals having multiple drivers (covered by NTL_STR19);
# Obsolete rules replaced by NTL_STR74
rule_deselect -rule W415
# Obsolete rules replaced by NTL_CLK04
rule_deselect -rule C_1203
rule_deselect -rule G_544_1
rule_deselect -rule DFT_002
# Obsolete rules replaced by NTL_CLK09
rule_deselect -rule C_1204
# Obsolete rules replaced by NTL_CLK03
rule_deselect -rule C_1205
rule_deselect -rule DFT_003
rule_deselect -rule G_541_1
# Obsolete rules replaced by NTL_CLK34
rule_deselect -rule C_1208
# Obsolete rules replaced by NTL_RST07
rule_deselect -rule C_1404
# Obsolete rules replaced by NTL_STR81
rule_deselect -rule C_1405
# Obsolete rules replaced by NTL_STR84
rule_deselect -rule TEST_974
# Obsolete rules replaced by NTL_STR47
rule_deselect -rule C_1003
rule_deselect -rule DFT_021
# Obsolete rules replaced by NTL_STR03
rule_deselect -rule C_1006
# Obsolete rules replaced by NTL_STR29
rule_deselect -rule C_1007
# Obsolete rules replaced by NTL_CLK05
rule_deselect -rule C_1202
rule_deselect -rule A_3C_R
rule_deselect -rule G_564_1
# Obsolete rules replaced by NTL_DFT38
rule_deselect -rule C_1406
# Obsolete rules replaced by NTL_DFT25
rule_deselect -rule TEST_953
# Obsolete rules replaced by NTL_DFT24
rule_deselect -rule TEST_954


#########################################################
#  Removing duplicate rules
#########################################################

# Duplicate rules of B_2011
rule_deselect -rule DCHDL_177
rule_deselect -rule FM_2_3
rule_deselect -rule SC_202
rule_deselect -rule SYN9_2_3
# Duplicate rules of CS_7C_R_B
rule_deselect -rule SYN10_1
rule_deselect -rule VER_2_1_3_5
rule_deselect -rule W424
# Duplicate rules of B_3402
rule_deselect -rule CS_8C_R
rule_deselect -rule SYN10_2
rule_deselect -rule W426
# Duplicate rules of DCVER_977
rule_deselect -rule E304
rule_deselect -rule SYN3_2_2
# Duplicate rules of DCVER_177
rule_deselect -rule SYN3_9_2
rule_deselect -rule W294
# Duplicate rules of DCVER_189
rule_deselect -rule SYN4_1_2
rule_deselect -rule FM_2_25
# Duplicate rules of DCVER_190
rule_deselect -rule SYN4_1_3
rule_deselect -rule FM_2_26
# Duplicate rules of DCVER_192
rule_deselect -rule FM_2_6A
# Duplicate rules of DCVER_969
rule_deselect -rule SYN9_18
rule_deselect -rule W21
# Duplicate rules of DCVER_188
rule_deselect -rule SYN9_28
rule_deselect -rule W43
# Duplicate rules of B_2006
rule_deselect -rule DCVER_286
rule_deselect -rule SYN9_31
# Duplicate rules of A_12C_R
rule_deselect -rule R_521_10
rule_deselect -rule VER_2_1_6_1
rule_deselect -rule VHD_2_1_6_1
# Duplicate rules of FM_2_7
rule_deselect -rule I_1C_R
rule_deselect -rule R_5211_1
rule_deselect -rule VER_3_2_3_1
rule_deselect -rule VHD_3_2_3_1
rule_deselect -rule W416
# Duplicate rules of B_4001
rule_deselect -rule R_5215_1
# Duplicate rules of R_529_1
rule_deselect -rule TK_6CP_R
rule_deselect -rule VER_1_1_1_3A
rule_deselect -rule VHD_1_1_1_3A
rule_deselect -rule X_4021
# Duplicate rules of B_3418
rule_deselect -rule FM_2_1A
rule_deselect -rule R_554_1_A
rule_deselect -rule W456
# Duplicate rules of G_536_2
rule_deselect -rule I_4C_R
# Duplicate rules of G_551_1_I
rule_deselect -rule S_5C_R_B
rule_deselect -rule C_1000
rule_deselect -rule C_8C_R     
# Duplicate rules of DFT_021
rule_deselect -rule R_552_1
rule_deselect -rule SC_108
rule_deselect -rule SYN9_5
rule_deselect -rule S_4C_R
rule_deselect -rule VER_2_4_1_2
rule_deselect -rule VHD_2_4_1_2
rule_deselect -rule W410
# Duplicate rules of B_3417
rule_deselect -rule CS_5P_R_A
rule_deselect -rule FM_2_15
rule_deselect -rule R_555_1_A
rule_deselect -rule SYN9_7
rule_deselect -rule VCS_14
rule_deselect -rule VER_2_3_1_1
rule_deselect -rule W336
# Duplicate rules of B_3416
rule_deselect -rule CS_5P_R_B
rule_deselect -rule FM_2_16
rule_deselect -rule R_555_1_B
rule_deselect -rule VCS_15
rule_deselect -rule W414
# Duplicate rules of B_1001
rule_deselect -rule W446
# Duplicate rules of B_1202
rule_deselect -rule DFT_006
rule_deselect -rule VER_1_4_4_1
rule_deselect -rule VHD_1_4_4_1
rule_deselect -rule W389
# Duplicate rules of B_1205
rule_deselect -rule W401
# Duplicate rules of B_2001
rule_deselect -rule W244
# Duplicate rules of B_2010
rule_deselect -rule W339
# Duplicate rules of B_3202
rule_deselect -rule W129
# Duplicate rules of B_3204
rule_deselect -rule W467
# Duplicate rules of B_3206
rule_deselect -rule W443
# Duplicate rules of B_3400
rule_deselect -rule W192
# Duplicate rules of B_3401
rule_deselect -rule DCVER_130
# Duplicate rules of B_3409
rule_deselect -rule W228
# Duplicate rules of B_4000
rule_deselect -rule R_525_1_D
# Duplicate rules of B_4002
rule_deselect -rule R_525_1_E
# Duplicate rules of A_3C_R
rule_deselect -rule C_1202
rule_deselect -rule VER_1_5_1_1
rule_deselect -rule VHD_1_5_1_1
# Duplicate rules of CS_7C_R_A
rule_deselect -rule VER_2_1_2_3
rule_deselect -rule W425
# Duplicate rules of S_5C_R_A
rule_deselect -rule W394
# Duplicate rules of DCVHDL_2098
rule_deselect -rule FM_2_27
rule_deselect -rule SC_102
# Duplicate rules of FM_2_12
rule_deselect -rule W455
# Duplicate rules of FM_2_18
rule_deselect -rule VER_2_8_3_5
rule_deselect -rule W187
# Duplicate rules of DCVER_135
rule_deselect -rule W300
# Duplicate rules of B_1011
rule_deselect -rule DCVER_154
rule_deselect -rule W287
# Duplicate rules of G_521_3_B
rule_deselect -rule P_3C_G
rule_deselect -rule VER_1_1_4_2
# Duplicate rules of B_3419
rule_deselect -rule FM_2_1B
rule_deselect -rule R_554_1_B
rule_deselect -rule W122
# Duplicate rules of B_3208
rule_deselect -rule FM_2_17
rule_deselect -rule VER_2_10_3_2
# Duplicate rules of B_3209
rule_deselect -rule VER_3_2_3_2
rule_deselect -rule W110
rule_deselect -rule XV2_1807
rule_deselect -rule XV2P_1807
# Duplicate rules of B_3211
rule_deselect -rule VER_2_8_1_6
rule_deselect -rule W263
# Duplicate rules of B_3600
rule_deselect -rule CS_1C_R
# Duplicate rules of B_3601
rule_deselect -rule G_559_1
rule_deselect -rule VER_2_11_3_1
rule_deselect -rule VHD_2_11_3_1
# Duplicate rules of B_3604
rule_deselect -rule G_559_4
# Duplicate rules of B_3605_A
rule_deselect -rule G_559_2_A
rule_deselect -rule VER_2_11_1_3
# Duplicate rules of B_3605_B
rule_deselect -rule G_559_2_B
# Duplicate rules of B_3609
rule_deselect -rule VER_2_11_2_1
rule_deselect -rule VHD_2_11_2_1
rule_deselect -rule G_559_3
# Duplicate rules of B_1403
rule_deselect -rule W396
# Duplicate rules of FM_2_2
rule_deselect -rule W257
rule_deselect -rule C_1C_R
rule_deselect -rule DCVER_173
rule_deselect -rule DCVER_176
# Duplicate rules of DCVER_256
rule_deselect -rule E267
# Duplicate rule of B_2007
rule_deselect -policy VERILINT -rule W631


