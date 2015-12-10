# This file contains design-specific Leda rules
#LMD: Leda rule check for BCM file
#LJ: Leda rule check for BCM's disabled, those can only be fixed by BCM RnD
 rule_deselect -all -file  ../src/DW_ahb_bcm01.v 

#LMD: Leda rule check for BCM file
#LJ: Leda rule check for BCM's disabled, those can only be fixed by BCM RnD
 rule_deselect -all -file ../src/DW_ahb_bcm02.v 

#LMD: Leda rule check for BCM file
#LJ: Leda rule check for BCM's disabled, those can only be fixed by BCM RnD
 rule_deselect -all -file ../src/DW_ahb_bcm53.v 

#LMD: Leda rule check for BCM file
#LJ: Leda rule check for BCM's disabled, those can only be fixed by BCM RnD
 rule_deselect -all -file  ../src/DW_ahb_bcm_params.v 

#LMD: Nested ifs. Consider using case or casex statement instead
#LJ: We use case statement if more than two conditions are present.
#LJ: LUIS will remove this Rule in the upcoming Leda rules release
rule_deselect -rule W526

#LMD: Use Vector operations on arrays rather than for loops
#LJ: Loop statements are used for reability purpose.
#LJ: LUIS will remove this Rule in the upcoming Leda rules release
rule_deselect -rule G_5214_2

#LMD: Possible loss of carry/borrow in addition/subtraction
#LJ: All arithmetic additions and substractions are listed and analyzed.
#    Planned to write assertions locally to not violate the possibility of losing carry/borrow
rule_deselect -rule W484




##########################################################
#########################################################
##########################################################
## This file contains design-specific Leda rules
#
## DW_AHB
#
#   # FM_2_22: Possible range overflow
#   # Expect simulation and synthesis to catch this, leda flags 
#   # false warnings.
#rule_deselect -rule FM_2_22
#
#   # FM_2_35: Use fully assigned variables in functions.
#   # In I2C only triggers on bcm57 loop iterator variables.
#   # In a case where this was really a problem latches would occur
#   # in synthesis and synthesis checks would flag the issue.
#rule_deselect -rule FM_2_35
#
#   # W159 : Constant condition expression
#   # Used to remove logic that is not required for the configuration.
#rule_deselect -rule W159
#
#   # W244 : Shift by non-constant  
#   # Valid synthesiseable verilog syntax.
#rule_deselect -rule W244
#
#   # W287 : Unconnected port
#   # Modules are reused for different cases and not all ports are 
#   # required in every instance.
## rule_deselect -rule W287 - Unconnected ports fixed - BR -
#
#   # W484 : Possible loss of carry/borrow in addition/subtraction
#   # Functional simulation would catch this if it was the cause of
#   # functional problems.
#rule_deselect -rule W484
#
#   # MF_3C_R : The module name should be the same as the file name.
#   # Prefix regression run breaks this rule.
#rule_deselect -rule MF_3C_R
#
#   # W563 : Reduction of a single bit expression is redundant
#   # Can occur due to rtl configuration range, benign effects on rtl in any case.
#rule_deselect -rule W563
#
## Turn off these rules due to bcm part errors
#rule_deselect -rule FM_2_22
#rule_deselect -rule S_7R_D
# 
## Bugs in leda combinatorial loop checks. 
## C_8C_R: Avoid asynchronous feedback loop 
#rule_deselect -rule C_8C_R 
# 
## Bugs in leda combinatorial loop checks. 
## FM_1_1: Avoid asynchronous feedback loop 
#rule_deselect -rule FM_1_1 
# 
## Bugs in leda combinatorial loop checks. 
## G_553_1: Avoid asynchronous feedback loop 
#rule_deselect -rule G_553_1 
# 
## Bugs in leda combinatorial loop checks. 
## TEST_960: Avoid asynchronous feedback loop 
#rule_deselect -rule TEST_960 
# 
## Bugs in this leda check, I have seen this rule generate errors 
## due to undriven wires that are no connected to anything e.g.
## DW_ahb : DW_ahb.U_arb.wt_count_m15 when waiting token arb. not selected.
## NTL_CON12: undriven net Range: .... 
#rule_deselect -rule NTL_CON12
#
##C_1406 : Register with no set/reset is found
##There is no need for this register to have a reset the only function of the register is to insert a pipeline stage
#rule_deselect -rule C_1406
#
##NTL_RST06 : Avoid internally generated resets, it's design specific
#rule_deselect -rule NTL_RST06
