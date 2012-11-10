#include <common.h>
#include <s5p6450.h>

#include <movi.h>
#include <asm/io.h>
#include <regs.h>
#include <mmc.h>

extern raw_area_t raw_area_control;

typedef u32 (*copy_sd_mmc_to_mem) \
	(u32 start_block, u16 block_size, u32* dest_addr);


void movi_bl2_copy(void)
{
  copy_sd_mmc_to_mem copy_bl2 = (copy_sd_mmc_to_mem)(0x00002360);

	copy_bl2(MOVI_BL2_POS, MOVI_BL2_BLKCNT, CFG_PHY_UBOOT_BASE);
}

void print_movi_bl2_info (void)
{
	printf("%d, %d, %d\n", MOVI_BL2_POS, MOVI_BL2_BLKCNT, MOVI_ENV_BLKCNT);
}

void movi_write_env(ulong addr)
{
	movi_write(raw_area_control.image[2].start_blk, 
		raw_area_control.image[2].used_blk, addr);
}

void movi_read_env(ulong addr)
{
	movi_read(raw_area_control.image[2].start_blk,
		raw_area_control.image[2].used_blk, addr);
}

void movi_write_bl1(ulong addr)
{
	int i;
	ulong checksum;
	ulong src;
	ulong tmp;

	src = addr;
	
	for(i = 0, checksum = 0;i < (14 * 1024) - 4;i++)
	{
		checksum += *(u8*)addr++;
	}

	tmp = *(ulong*)addr;
	*(ulong*)addr = checksum;
			
	movi_write(raw_area_control.image[1].start_blk, 
		raw_area_control.image[1].used_blk, src);

	*(ulong*)addr = tmp;
}

