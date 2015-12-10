set rtWorkingDir [pwd]
define_design_lib work -path ./lib/work
elaborate  -library work i_i2c_DW_apb_i2c
set ::rtSaveHierarchically 1
cd $rtWorkingDir
