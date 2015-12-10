## This file contains design-specific Leda rules
#

#LMD: Use Vector operations on arrays rather than for loops
#LJ: Loop statements are used for reability purpose.
#    LUIS will remove this Rule in the upcoming Leda rules release
rule_deselect -rule G_5214_2

## W159 - Constant condition expression
## Turn off rule checking use of constant condition expression
## the use of cc_constants and parameters in IF() considitions
## makes this scenario happen
#rule_deselect -rule W159
#
## W631 - Assigning to self. This is harmless but can reduce simulation speed
## Turn off this rule as result is harmless
#rule_deselect -rule W631
#
#
## MF_3C_R: The module name should be the same as the file name.
## Prefix regression run breaks this rule.
#rule_deselect -rule MF_3C_R
#
## Turn off these rules due to bcm part errors
#rule_deselect -rule FM_2_22
#rule_deselect -rule S_7R_D
#
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
## Turn off these rules as they are going to be removed in future versions of leda.
#rule_deselect -rule G_5214_2
#rule_deselect -rule B_3208

