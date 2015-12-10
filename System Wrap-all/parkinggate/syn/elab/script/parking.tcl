set rtWorkingDir [pwd]
define_design_lib work -path ./lib/work
elaborate -library work parking
cd $rtWorkingDir

set ::rt_top_design parking
set ::rtSaveHierarchically 0
