/* SPDX-License-Identifier: GPL-2.0-only */

#include <acpi/acpi.h>

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
		#include <northbridge/intel/ironlake/acpi/uncore.asl>
	}

}

