; ---------------------------------------------------------------------------
; Level Headers
; ---------------------------------------------------------------------------

LevelHeaders:

lhead:	macro plc1,lvlgfx,plc2,sixteen,twofivesix,pal
	dc.l (plc1<<24)+lvlgfx
	dc.l (plc2<<24)+sixteen
	dc.l twofivesix
	dc.b pal, 0, 0, 0
	endm

; 1st PLC, level gfx (unused), 2nd PLC, 16x16 data, 256x256 data,
; music (unused), palette (unused), palette

;		1st PLC				2nd PLC				256x256 data
;				level gfx*			16x16 data			palette

	lhead	plcid_GHZ,	Kos_GHZ_2nd,	plcid_GHZ2,	Blk16_GHZ,	Blk128_GHZ,	palid_GHZ	; Green Hill
	lhead	plcid_LZ,	Kos_LZ,		plcid_LZ2,	Blk16_LZ,	Blk128_LZ,	palid_LZ	; Labyrinth
	lhead	plcid_MZ,	Kos_MZ,		plcid_MZ2,	Blk16_MZ,	Blk128_MZ,	palid_MZ	; Marble
	lhead	plcid_SLZ,	Kos_SLZ,	plcid_SLZ2,	Blk16_SLZ,	Blk128_SLZ,	palid_SLZ	; Star Light
	lhead	plcid_SYZ,	Kos_SYZ,	plcid_SYZ2,	Blk16_SYZ,	Blk128_SYZ,	palid_SYZ	; Spring Yard
	lhead	plcid_SBZ,	Kos_SBZ,	plcid_SBZ2,	Blk16_SBZ,	Blk128_SBZ,	palid_SBZ2	; Scrap Brain
	zonewarning LevelHeaders,$10
	lhead	0,		Kos_GHZ_2nd,	0,		Blk16_GHZ,	Blk128_GHZ,	palid_Ending	; Ending
	even

;	* music and level gfx are actually set elsewhere, so these values are useless