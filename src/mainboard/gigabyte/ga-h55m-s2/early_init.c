/* SPDX-License-Identifier: GPL-2.0-only */

#include <bootblock_common.h>
#include <northbridge/intel/ironlake/raminit.h>
#include <superio/ite/common/ite.h>
#include <superio/ite/it8720f/it8720f.h>
#include <device/pnp_ops.h>

#define GLOBAL_DEV PNP_DEV(0x2e, 0)
#define SERIAL_DEV PNP_DEV(0x2e, 0x01)
#define GPIO_DEV   PNP_DEV(0x2e, IT8720F_GPIO)

void bootblock_mainboard_early_init(void)
{
	if (!CONFIG(NO_UART_ON_SUPERIO)) {
		/* Enable serial port */
		//ite_enable_serial(SERIAL_DEV, CONFIG_TTYS0_BASE);
	}

	// Global registers
	//ite_reg_write(0x2e, 0xef, 0x7e); // Undocumented, triggers recovery if unset
	ite_reg_write(0x2e, 0x22, 0x08); // Configuration set

	// LDN 0x07
	ite_reg_write(GPIO_DEV, 0x25, 0x80);
	ite_reg_write(GPIO_DEV, 0x2c, 0x81);
	ite_reg_write(GPIO_DEV, 0x62, 0x08);
	ite_reg_write(GPIO_DEV, 0x72, 0x00); // watchdog disable
	ite_reg_write(GPIO_DEV, 0x73, 0x00);
	ite_reg_write(GPIO_DEV, 0xc0, 0x81);
	ite_reg_write(GPIO_DEV, 0xc1, 0x04);
	ite_reg_write(GPIO_DEV, 0xf0, 0x10);
	ite_reg_write(GPIO_DEV, 0xf1, 0x40);
	ite_reg_write(GPIO_DEV, 0xf6, 0x10);
	ite_reg_write(GPIO_DEV, 0xfc, 0x72);
	ite_reg_write(GPIO_DEV, 0xef, 0x7e); // Undocumented, triggers recovery if unset
	ite_reg_write(GPIO_DEV, 0xe9, 0x20);
}
