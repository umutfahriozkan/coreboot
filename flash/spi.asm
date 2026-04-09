[org 0x0]

; GA-H55M-S2
; Intel 5 Series and 3400 Series Chipset

    times 0x10 db 0xFF

; FLVALSIG (Flash Valid Signature) 0x10
    dd 0x0FF0A55A

; FLMAP0 (Flash Map 0 Register) 0x14
    db 0x02 ; Flash Component Base Address (FCBA), 0x02 means FCBA is located at 0x20
    db 0x01 ; Number of Flash Components (0x00 or 0x01, others are reserved, 0x00 stands for 1 flash component, 0x01 stands for 2 flash components)
    db 0x04 ; Flash Region Base Address (FRBA), 0x04 means FRBA is located at 0x40
    db 0x02 ; Number Of Regions (NR). ME and BIOS, setting this to all zeroes means only contain descriptor region

; FLMAP1 (Flash Map 1 Register) 0x18
    db 0x06 ; Flash Master Base Address (FMBA), 0x06 means FMBA is located at 0x60
    db 0b00000010 ; Number Of Masters (NM)
    db 0x10 ; Flash PCH Strap Base Address (FPSBA), 0x10 means FPSBA is located at 0x100
    db 0x10 ; PCH Strap Length (ISL) This field MUST be set to 10h

; FLMAP2 (Flash Map 2 Register) 0x1C
    db 0x20 ; Flash Processor Strap Base Address (FMSBA), 0x20 means FMSBA is located at 0x200
    db 0x00 ; PROC Strap Length (PSL), set this to 0x00
    db 0x00 ; Reserved
    db 0x00 ; Reserved

;; Flash Descriptor Component Section (FLCOMP) from FCBA - 0x20
    db 0b00001100 ; Bit 2:0 Component 1 Density
                ; Bit 5:3 Component 2 Density
                ; Bits 7:6 → Reserved = 00
    db 0x0 ; Reserved 15:8
    db 0b00110000 ; Bit 16 Reserved
                ; Bit 19:17 Read Clock Frequency 000 = 20 mhz, other settings are reserved
                ; Bit 20 Fast Read Support, 1 is supported
                ; Bit 23:21 Fast Read Clock Frequency, 001 = 33 MHz
    db 0b00001001 ; Bit 26:24 Write and Erase Clock Frequenc, 001 = 33 MHz
                ; Bit 29:27 Read ID and Read Status Clock Frequency, 001 = 33 MHz
                ; Bit 31:30 Reserved

; FLILL (Flash Invalid Instructions Record) from FCBA - 0x24
    dd 0x0 ; Put 0 if no protection

; FLPB (Flash Partition Boundary Record) from FCBA - 0x28
    dd 0x0 ; Didnt understand xd

    times (0x40 - ($ - $$)) db 0xFF

;; Flash Descriptor Region Section from FRBA - 0x40
; FLREG0—Flash Region 0 (Flash Descriptor)
    dd 0x0
; FLREG1—Flash Region 1 (BIOS) Register from FRBA - 0x44
    ; BIOS starts at 0x00100000, ends at 0x001FFFFF
    ; start bits[24:12] => 0x100
    ; end bits[24:12] => 0x1FFF
    dd 0x01FF0100
; FLREG2—Flash Region 2 (ME) Register from FRBA - 0x48
    ; ME starts at 0x00001000, ends at 0x00012000
    dd 0x00120001
; FLREG3—Flash Region 3 (GbE) Register from FRBA - 0x4C
    ; GbE (not used)
    dd 0x00001FFF
; FLREG4—Flash Region 4 (Platform Data) Register from FRBA - 0x50
    ; PDR (not used)
    dd 0x00001FFF


    times (0x60 - ($ - $$)) db 0xFF

;; Flash Master Region Section from FMBA - 0x60
; FLMSTR1—Flash Master 1 (Host CPU/ BIOS) - 0x60
    dd 0xffff0000
; FLMSTR2—Flash Master 2 (ME) - 0x64
    dd 0xffff0000
; FLMSTR3—Flash Master 3 (GbE) - 0x68
    dd 0xffff0118

    times (0x100 - ($ - $$)) db 0xFF

;; Flash Descriptor PCH Soft Strap Section from FPSBA - 0x100
; PCHSTRP0—Strap 0 - 0x100
    dd 0b00000000001000000101011110000010
; PCHSTRP1—Strap 1 - 0x104
    dd 0xF
; PCHSTRP2—Strap 2 - 0x108
    dd 0x0
; PCHSTRP3—Strap 3 - 0x10C
    dd 0x0
; PCHSTRP4—Strap 4 - 0x110
    dd 0x00c8e002
; PCHSTRP5—Strap 5 - 0x114
    dd 0x0
; PCHSTRP6—Strap 6 - 0x118
    dd 0x0
; PCHSTRP7—Strap 7 - 0x11C
    dd 0x0
; PCHSTRP8—Strap 8 - 0x120
    dd 0x0
; PCHSTRP9—Strap 9 - 0x124
    dd 0x00000500
; PCHSTRP10—Strap 10 - 0x128
    dd 0x00010044
; PCHSTRP11—Strap 11 - 0x12C
    dd 0x99000097
; PCHSTRP12—Strap 12 - 0x130
    dd 0x0
; PCHSTRP13—Strap 13 - 0x134
    dd 0x0
; PCHSTRP14—Strap 14 - 0x138
    dd 0x0
; PCHSTRP15—Strap 15 - 0x13C
    dd 0x00000318


    times (0xEC0  - ($ - $$)) db 0xFF

;VSCC0
    dd 0x0000471F ; Reserved-DeviceID1-DeviceID0-VendorID
    dd 0x20152015 ; VSCC Register Value
;VSCC1
    dd 0x004A25BF ; Reserved-DeviceID1-DeviceID0-VendorID
    dd 0x20092009 ; VSCC Register Value
;VSCC0
    dd 0x001620c2 ; Reserved-DeviceID1-DeviceID0-VendorID
    dd 0x20052005 ; VSCC Register Value
;VSCC0
    dd 0x001630ef ; Reserved-DeviceID1-DeviceID0-VendorID
    dd 0x20052005 ; VSCC Register Value
;VSCC0
    dd 0x001720c2 ; Reserved-DeviceID1-DeviceID0-VendorID
    dd 0x20052005 ; VSCC Register Value
;VSCC0
    dd 0x001740ef ; Reserved-DeviceID1-DeviceID0-VendorID
    dd 0x20052005 ; VSCC Register Value
;VSCC0
    dd 0x001420c2 ; Reserved-DeviceID1-DeviceID0-VendorID
    dd 0x20052005 ; VSCC Register Value

    times (0xEFC - ($ - $$)) db 0xFF

; FLUMAP1—Flash Upper Map 1 - 0xEFC
    dw 0x0EEC ; 0xEC VSCC located at 0xEC0, 0E means 14 = 2 * 7, 7 is number of VSCCs
    dw 0


;   IFD end....
    times (0x1000 - ($ - $$)) db 0xFF
    incbin "me"
    times (0x00012000 - ($ - $$)) db 0xFF
    
    times (0x100000 - ($ - $$)) db 0xFF
    incbin "coreboot.rom"
    times (0x200000 - ($ - $$)) db 0xFF