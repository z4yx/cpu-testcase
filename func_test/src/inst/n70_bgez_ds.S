#include <asm/asm.h>
#include <asm/regdef.h>
#include <cpu.h>
#include <asm/context.h>
#include <inst_delay_slot_test.h>

###LEAF(n70_bgez_ds_test)
    .globl n70_bgez_ds_test
n70_bgez_ds_test:
    .set noreorder
    li  a0, 0x46
    li  v0, 0x00
###test inst
    TEST_BGEZ_DS
###detect exception
    bne v0, zero, inst_error
    nop
###score ++
    addiu s3, s3, 1
###output a0|s3
inst_error:  
    sw s3, 0($23)
    sw a0, 0(s1)
    jr ra
    nop
####END(n70_bgez_ds_test)
