#include <config.h>
#include <s5p6450.h>

	.globl mem_ctrl_asm_init
mem_ctrl_asm_init:

	ldr	r0, =ELFIN_DMC0_BASE
	ldr	r1, =0x6A101000				
	str	r1, [r0, #PHYCONTROL0_OFFSET]
	ldr	r1, =0x000084F4				
	str	r1, [r0, #PHYCONTROL1_OFFSET]
	ldr	r1, =0x00000000			
	str	r1, [r0, #PHYCONTROL2_OFFSET]
	ldr	r1, =0x6A101002				
	str	r1, [r0, #PHYCONTROL0_OFFSET]
	ldr	r1, =0x6A101003				
	str	r1, [r0, #PHYCONTROL0_OFFSET]

	mov	r1, #0x10000
1:	subs	r1, r1, #1
	bne	1b

	ldr	r1, =0x0F001010				
	str	r1, [r0, #CONCONTROL_OFFSET]
	ldr	r1, =0x00202133				
	str	r1, [r0, #MEMCONTROL_OFFSET]
	ldr	r1, =0x20F00322				
	str	r1, [r0, #MEMCONFIG0_OFFSET]
	ldr	r1, =0x30F00322			
	str	r1, [r0, #MEMCONFIG1_OFFSET]
	ldr	r1, =0xFF000000				
	str	r1, [r0, #PRECHCONFIG_OFFSET]
	ldr	r1, =0xFFFF00FF				
	str	r1, [r0, #PWRDNCONFIG_OFFSET]

#if defined(CONFIG_CLK_667_166_83) 
	ldr     r1, =0x0000050E
        str     r1, [r0, #TIMINGAREF_OFFSET]
        ldr     r1, =0x0E233287                 
        str     r1, [r0, #TIMINGROW_OFFSET]
        ldr     r1, =0x12230204            
        str     r1, [r0, #TIMINGDATA_OFFSET]
        ldr     r1, =0x0E100122
        str     r1, [r0, #TIMINGPOWER_OFFSET]

#elif defined(CONFIG_CLK_533_133_66)

	ldr	r1, =0x0000040D				
	str	r1, [r0, #TIMINGAREF_OFFSET]
	ldr	r1, =0x0B233206			
	str	r1, [r0, #TIMINGROW_OFFSET]
	ldr	r1, =0x12230204				
	str	r1, [r0, #TIMINGDATA_OFFSET]
	ldr	r1, =0x0E100122				
	str	r1, [r0, #TIMINGPOWER_OFFSET]
#endif

	ldr	r1, =0x07000000				
	str	r1, [r0, #DIRECTCMD_OFFSET]
	ldr	r1, =0x01000000				
	str	r1, [r0, #DIRECTCMD_OFFSET]
	ldr	r1, =0x05000000				
	str	r1, [r0, #DIRECTCMD_OFFSET]
	ldr	r1, =0x05000000			
	str	r1, [r0, #DIRECTCMD_OFFSET]
	ldr	r1, =0x00000032				
	str	r1, [r0, #DIRECTCMD_OFFSET]
	ldr	r1, =0x00020000				
	str	r1, [r0, #DIRECTCMD_OFFSET]

	ldr	r1, =0x0F0010B0				
	str	r1, [r0, #CONCONTROL_OFFSET]

	mov	pc, lr

