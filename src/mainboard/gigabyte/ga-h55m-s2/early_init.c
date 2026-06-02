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
	//if (!CONFIG(NO_UART_ON_SUPERIO)) ite_enable_serial(PNP_DEV(0x2e, IT8720F_SP1), CONFIG_TTYS0_BASE);

	pnp_enter_conf_state(GPIO_DEV);
	pnp_set_logical_device(GPIO_DEV);


	pnp_write_config(GPIO_DEV, 0x25, 0x80);
	pnp_write_config(GPIO_DEV, 0x2c, 0x81);
	pnp_write_config(GPIO_DEV, 0x62, 0x08);
	pnp_write_config(GPIO_DEV, 0x72, 0x00);
	pnp_write_config(GPIO_DEV, 0x73, 0x00);
	pnp_write_config(GPIO_DEV, 0xc0, 0x81);
	pnp_write_config(GPIO_DEV, 0xc1, 0x04);
	pnp_write_config(GPIO_DEV, 0xe9, 0x20);
	pnp_write_config(GPIO_DEV, 0xf0, 0x10);
	pnp_write_config(GPIO_DEV, 0xf1, 0x40);
	pnp_write_config(GPIO_DEV, 0xf6, 0x10);
	pnp_write_config(GPIO_DEV, 0xfc, 0x72);

	pnp_exit_conf_state(GPIO_DEV);
	//ite_reg_write(GLOBAL_DEV, 0x22, 0x08); // Configuration set

	pnp_enter_conf_state(GPIO_DEV);
	pnp_set_logical_device(GPIO_DEV);
	printk(BIOS_DEBUG, "ITE register 0xef: 0x%02x ", pnp_read_config(GPIO_DEV, 0xef));
	//ite_reg_write(GLOBAL_DEV, 0xef, 0x7e); // Undocumented, triggers recovery if unset
	pnp_write_config(GPIO_DEV, 0xef, 0x7e); // Undocumented, triggers recovery if unset
	printk(BIOS_DEBUG, "=> 0x%02x\n", pnp_read_config(GPIO_DEV, 0xef));
	pnp_exit_conf_state(GPIO_DEV);
}
