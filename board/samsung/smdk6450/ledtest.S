#include <config.h>
#include <version.h>
#ifdef CONFIG_ENABLE_MMU
#include <asm/proc/domain.h>
#endif
#include <regs.h>



#if defined(CONFIG_WAT10_LED)
#define ELFIN_GPIO_BASE		0xE0308140
/*#define GPK_BASE_OFFSET		0x8140*/
#define GPKCON_OFFSET		0x00
#define GPKDAT_OFFSET		0x04
#define GPKPUD_OFFSET		0x08


.globl led_test
	
led_test:
/* if relocate the u-boot code, LED will on.*/
	ldr	r0, =ELFIN_GPIO_BASE
        ldr     r1, =0x00000100
	str     r1, [r0,#GPKCON_OFFSET]
	
	ldr	r1, =0x00000165
	str	r1, [r0,#GPKPUD_OFFSET]
	
	ldr	r1, =0x00000004
	str	r1, [r0, #GPKDAT_OFFSET]


#endif






































	


	














	
