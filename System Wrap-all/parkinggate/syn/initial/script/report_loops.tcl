  # Check for combinational feedback loops. 
  set rtTmpFile [file join $rtReportDir "${rtCurrentDesign}_tmp.rpt"]
  redirect $rtTmpFile {
    report_timing -loop
  }

  set perlExec $::synopsys_root/$::sh_arch/bin/snpsperl
  if {![file exists $perlExec]} {
    set perlExec [file join /project/linuxlab/synopsys/coreTools/linux/dware/bin snpsperl]
  }
  
echo [exec $perlExec /project/linuxlab/synopsys/coreTools/linux/dware/bin/gen_checks_report.pl cleanup $rtTmpFile]

  # Remove variables.
  unset rtTmpFile
