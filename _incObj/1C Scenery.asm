; ---------------------------------------------------------------------------
; Object 1C - scenery (GHZ bridge stump, SLZ lava thrower)
; ---------------------------------------------------------------------------

Scenery:
		moveq	#0,d0
		move.b	obRoutine(a0),d0
		move.w	Scen_Index(pc,d0.w),d1
		jmp	Scen_Index(pc,d1.w)
; ===========================================================================
Scen_Index:	dc.w Scen_Main-Scen_Index
		dc.w Scen_ChkDel-Scen_Index
; ===========================================================================

Scen_Main:	; Routine 0
		addq.b	#2,obRoutine(a0)
		moveq	#0,d0
		move.b	obSubtype(a0),d0 ; copy object subtype to d0
		move.w	d0,d1
		add.w	d1,d1
		add.w	d1,d1
		add.w	d1,d0
		add.w	d0,d0
		lea	Scen_Values(pc,d0.w),a1
		move.l	(a1)+,obMap(a0)
		move.w	(a1)+,obGfx(a0)
		ori.b	#4,obRender(a0)
		move.w	(a1)+,obPriority(a0)
		move.b	(a1)+,obFrame(a0)
		move.b	(a1)+,obActWid(a0)

Scen_ChkDel:	; Routine 2
		tst.b	obRender(a0)
		bpl.w	DeleteObject
		bra.w	DisplaySprite
; ===========================================================================
; ---------------------------------------------------------------------------
; Variables for	object $1C are stored in an array
; ---------------------------------------------------------------------------
Scen_Values:	dc.l Map_Scen                                     ; mappings address
		dc.w make_art_tile(ArtTile_SLZ_Fireball_Launcher,2,0) ; VRAM setting
		; priority, frame, width
                dc.w $80*2
		dc.b 0,	8
		dc.l Map_Scen
		dc.w make_art_tile(ArtTile_SLZ_Fireball_Launcher,2,0)
                dc.w $80*2
		dc.b 0,	8
		dc.l Map_Scen
		dc.w make_art_tile(ArtTile_SLZ_Fireball_Launcher,2,0)
                dc.w $80*2
		dc.b 0,	8
		dc.l Map_Bri
		dc.w make_art_tile(ArtTile_GHZ_Bridge,2,0)
                dc.w $80*1
		dc.b 1,	$10
		even