## SPDX-License-Identifier: GPL-2.0-only

bootblock-y += gpio.c early_init.c
romstage-y += gpio.c early_init.c

ramstage-y += hda_verb.c
ramstage-$(CONFIG_MAINBOARD_USE_LIBGFXINIT) += gma-mainboard.ads
