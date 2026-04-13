/* SPDX-License-Identifier: GPL-2.0-only */

#include <bootblock_common.h>
#include <northbridge/intel/ironlake/raminit.h>
#include <superio/ite/common/ite.h>
#include <superio/ite/it8720f/it8720f.h>
#include <device/pnp_ops.h>

#define GLOBAL_DEV PNP_DEV(0x2e, 0)
#define GPIO_DEV   PNP_DEV(0x2e, IT8720F_GPIO)
#define EC_DEV     PNP_DEV(0x2e, IT8720F_EC)

void bootblock_mainboard_early_init(void)
{
	if (!CONFIG(NO_UART_ON_SUPERIO))
		ite_enable_serial(PNP_DEV(0x2e, IT8720F_SP1), CONFIG_TTYS0_BASE);

	ite_reg_write(GLOBAL_DEV, 0x22, 0x08); // Configuration set


	printk(BIOS_DEBUG, "ITE register 0xef: 0x%02x ", pnp_read_config(GPIO_DEV, 0xef));
	//ite_reg_write(GLOBAL_DEV, 0xef, 0x7e); // Undocumented, triggers recovery if unset
	//ite_reg_write(GPIO_DEV, 0xef, 0x7e); // Undocumented, triggers recovery if unset
	printk(BIOS_DEBUG, "=> 0x%02x\n", pnp_read_config(GPIO_DEV, 0xef));
}
