/* SPDX-License-Identifier: GPL-2.0-only */

#include <acpi/acpi.h>

/****/
#undef SUPERIO_DEV
#undef SUPERIO_PNP_BASE
#undef IT8720F_SHOW_SP1
#undef IT8720F_SHOW_SP2
#undef IT8720F_SHOW_EC
#undef IT8720F_SHOW_KBCK
#undef IT8720F_SHOW_KBCM
#undef IT8720F_SHOW_GPIO
#define SUPERIO_DEV		SIO0
#define SUPERIO_PNP_BASE	0x2e
#define IT8720F_SHOW_SP1	1
#define IT8720F_SHOW_SP2	1
#define IT8720F_SHOW_EC		1
#define IT8720F_SHOW_KBCK	1
#define IT8720F_SHOW_KBCM	1
#define IT8720F_SHOW_GPIO	1
/****/

DefinitionBlock(
	"dsdt.aml",
	"DSDT",
	ACPI_DSDT_REV_2,
	OEM_ID,
	ACPI_TABLE_CREATOR,
	0x20090203	// OEM revision
)
{
	#include <acpi/dsdt_top.asl>
	#include <cpu/intel/common/acpi/cpu.asl>
	#include <southbridge/intel/common/acpi/platform.asl>
	#include <southbridge/intel/common/acpi/sleepstates.asl>
//	#include <drivers/intel/gma/acpi/default_brightness_levels.asl>
	Method(_WAK, 1)
	{
		Return(Package() {0, 0})
	}

	Method(_PTS, 1)
	{
	}

	Scope (\_SB) {
		Device (PCI0)
		{
		#include <northbridge/intel/ironlake/acpi/ironlake.asl>
//		Device (PX40)
//		{
//			#include <drivers/pc80/pc/ps2_controller.asl>
//		}
		}
//		#include <northbridge/intel/ironlake/acpi/uncore.asl>
		#include <superio/ite/it8720f/acpi/superio.asl>
	}

}

