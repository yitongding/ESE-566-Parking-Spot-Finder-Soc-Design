############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 2014 Xilinx Inc. All rights reserved.
############################################################
open_project dirct_new
set_top calculateDir
add_files Dijkstra.c
add_files dirct.c
add_files -tb Dijkstra_tb.c
open_solution "solution2"
set_part {xq7z045rf900-2i}
create_clock -period 20 -name default
source "./directives.tcl"
csim_design -setup
csynth_design
cosim_design
export_design -format ip_catalog
