#include <southbridge/intel/ibexpeak/pch.h>
#include <northbridge/intel/ironlake/ironlake.h>

void mainboard_pre_raminit(void)
{
}

void mainboard_get_spd_map(u8 *spd_addrmap)
{
	spd_addrmap[0] = 0x50;
	spd_addrmap[2] = 0x52;
}

const struct southbridge_usb_port mainboard_usb_ports[] = {
	{1, IF1_75F, 0},
        {1, IF1_75F, 0},
        {1, IF1_75F, 1},
        {1, IF1_75F, 1},
        {1, IF1_75F, 2},
	{1, IF1_75F, 2},
        {1, IF1_75F, 3},
        {1, IF1_75F, 3},
        {1, IF1_75F, 4},
        {1, IF1_75F, 4},
	{1, IF1_75F, 5},
        {1, IF1_75F, 5},
        {1, IF1_75F, 6},
        {1, IF1_75F, 6},
};
