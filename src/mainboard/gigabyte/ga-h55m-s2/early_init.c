/* SPDX-License-Identifier: GPL-2.0-only */

#include <bootblock_common.h>
#include <northbridge/intel/ironlake/raminit.h>
#include <superio/ite/common/ite.h>
#include <superio/ite/it8720f/it8720f.h>

#define SUPERIO_GPIO PNP_DEV(0x2e, IT8720F_GPIO)
#define SERIAL_DEV PNP_DEV(0x2e, 0x01)

void bootblock_mainboard_early_init(void)
{
	if (!CONFIG(NO_UART_ON_SUPERIO)) {
		/* Enable serial port */
		ite_enable_serial(SERIAL_DEV, CONFIG_TTYS0_BASE);
	}

	/*GPIO,idx,val*/
	ite_reg_write(SUPERIO_GPIO, 0x25, 0x80);
	ite_reg_write(SUPERIO_GPIO, 0x2c, 0x81);
	ite_reg_write(SUPERIO_GPIO, 0x62, 0x08);
	ite_reg_write(SUPERIO_GPIO, 0x72, 0x00);
	ite_reg_write(SUPERIO_GPIO, 0x73, 0x00);
	ite_reg_write(SUPERIO_GPIO, 0xc0, 0x81);
	ite_reg_write(SUPERIO_GPIO, 0xc1, 0x04);
	ite_reg_write(SUPERIO_GPIO, 0xe9, 0x20);
	ite_reg_write(SUPERIO_GPIO, 0xf0, 0x10);
	ite_reg_write(SUPERIO_GPIO, 0xf1, 0x40);
	ite_reg_write(SUPERIO_GPIO, 0xf6, 0x10);
	ite_reg_write(SUPERIO_GPIO, 0xfc, 0x72);

	/* Disable SIO WDT which kicks in DualBIOS */
	ite_reg_write(SUPERIO_GPIO, 0xEF, 0x7E);
}
