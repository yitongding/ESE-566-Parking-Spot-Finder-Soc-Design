set rtWorkingDir [pwd]
define_design_lib work -path ./lib/work
elaborate  -library work i_apb_DW_apb
set ::rtSaveHierarchically 1
cd $rtWorkingDir
