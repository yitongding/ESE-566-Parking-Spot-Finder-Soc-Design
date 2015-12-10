// reuse-pragma startSub ALL [::DW_QS::replace %subText]
/// ---------------------------------------------------------------------
//
//    This confidential and proprietary software may be used only
//    as authorized by a licensing agreement from Synopsys Inc.
//    In the event of publication, the following notice is applicable:
//
// reuse-pragma startSub [::RCE::insert_copyright] endSub 
// 
// reuse-pragma startSub [format "// Release version :  %s" [get_attribute [current_design -quiet] -attr {SpiritVersion}]] 
// Release version  : 
// File Version     :        $Revision: #4 $ 
// Revision: $Id: //dwh/DW_ocb/DW_apb_i2c/amba_dev/sim/cA/test_DW_apb_i2c.v#4 $ 
// ---------------------------------------------------------------------

`include "../../../components/%%C%%/verilog_headers/DW_apb_i2c_defs.v"

task test_%%L%%_DW_apb_i2c_%%M%%;
  begin
  $display("##     STARTING %%L%% TESTS");
  %%L%%_i2c_regAccess_%%M%%;
  end
endtask




task %%L%%_i2c_regAccess_%%M%%;

begin

  $display("\n=====: Testing Register Access on %%L%% DW_apb_i2c....");


  //-: perform write followed by read
  %%M%%.write      (0, `I2C%%C%%_PING_1BIT_WR,  8'b00000001, AhbByteAttrb, handle[0]);
  %%M%%.read_expect(0, `I2C%%C%%_PING_1BIT_WR,  8'bxxxxxxx1, AhbByteAttrb          );


  $display("=====: Done");

end

endtask



// reuse-pragma endSub ALL
