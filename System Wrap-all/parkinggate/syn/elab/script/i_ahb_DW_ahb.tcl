set rtWorkingDir [pwd]
define_design_lib work -path ./lib/work
elaborate  -library work i_ahb_DW_ahb
set ::rtSaveHierarchically 1
cd $rtWorkingDir
