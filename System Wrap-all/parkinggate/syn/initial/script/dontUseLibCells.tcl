proc rt_dont_use_lib_cell {cellName} {
  set libCells [find lib_cell $cellName]
  foreach_in_collection libCell $libCells {
    set dontUse [get_attribute $libCell dont_use -quiet]
    if { ![string equal $dontUse ""] && $dontUse } {
      set_attribute $libCell -quiet -type boolean rt_dont_use true
      set_dont_use $libCell
    }
  }
}

# Don't use these cells to improve single-pass compile QOR.
rt_dont_use_lib_cell lsi_10k/FD1S
rt_dont_use_lib_cell lsi_10k/FD1SP
rt_dont_use_lib_cell lsi_10k/FD2S
rt_dont_use_lib_cell lsi_10k/FD2SP
rt_dont_use_lib_cell lsi_10k/FD3S
rt_dont_use_lib_cell lsi_10k/FD3SP
rt_dont_use_lib_cell lsi_10k/FD4S
rt_dont_use_lib_cell lsi_10k/FD4SP
rt_dont_use_lib_cell lsi_10k/FJK1S
rt_dont_use_lib_cell lsi_10k/FJK1SP
rt_dont_use_lib_cell lsi_10k/FJK2S
rt_dont_use_lib_cell lsi_10k/FJK2SP
rt_dont_use_lib_cell lsi_10k/FJK3S
rt_dont_use_lib_cell lsi_10k/FJK3SP


