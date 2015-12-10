// reuse-pragma startSub ALL [::DW_QS::replace %subText]

// reuse-pragma startSub [::RCE::insert_copyright] endSub
// Revision: $Id: //dwh/DW_ocb/DW_apb_i2c/amba_dev/sim/cA/test_DW_apb_i2c.c#4 $

#include <stdio.h>
#include "../../../components/%%C%%/c_headers/DW_apb_i2c_defs.h"
#include "quickstart_cmd.h"

/* =================================================================
** Method Prototypes
** ============================================================== */
int %%L%%_i2c_regAccess_%%M%%(void);


int test_%%L%%_DW_apb_i2c_%%M%%(void)
  {
  int test_status=1;
  
  CPU_MSG(0x90);

  qs_configure_%%M%%(HSIZE, HSIZE_8);

  printf("##     STARTING %%L%% TESTS\n\n");

  if( !%%L%%_i2c_regAccess_%%M%%() ) {
    test_status=0;
  }

  return(test_status);
  }



int %%L%%_i2c_regAccess_%%M%%(void)
  {

  int success=1;
  unsigned int wdata, read_rslt;

  printf("\n=====: Testing Register Access on %%L%% I2C...\n");

  //-: perform write followed by read
  wdata = 0x01;
  qs_write_%%M%%(I2C%%C%%_PING_1BIT_WR,wdata);	
  read_rslt = qs_read_%%M%%(I2C%%C%%_PING_1BIT_WR);
  if((read_rslt & 0x011) != wdata) {
    printf("ERROR: {%%L%%_i2c_regAccess_%%M%%} : Read data (0x%x) doesn't match write data (0x%x)\n", read_rslt, wdata);
    success=0;
  }

  printf("=====: Done\n\n");
   
  }

// reuse-pragma endSub ALL
