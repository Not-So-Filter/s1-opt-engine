; ---------------------------------------------------------------------------
; Subroutine to	smash a	block (GHZ walls and MZ	blocks)
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


SmashObject:
		moveq	#0,d0
		move.b	obFrame(a0),d0
		add.w	d0,d0
		movea.l	obMap(a0),a3
		adda.w	(a3,d0.w),a3
		addq.w	#1,a3
		bset	#5,obRender(a0)
		movea.l	a0,a1
		bra.s	.loadfrag
; ===========================================================================

.loop:
		bsr.w	FindFreeObj
		bne.s	.playsnd
		addq.w	#5,a3

.loadfrag:
		move.b	#4,obRoutine(a1)
		move.b	obID(a0),obID(a1)
		move.l	a3,obMap(a1)
		move.b	obRender(a0),obRender(a1)
		move.w	obX(a0),obX(a1)
		move.w	obY(a0),obY(a1)
		move.w	obGfx(a0),obGfx(a1)
		move.w	#$80*4,obPriority(a1)
		move.b	#$10,obActWid(a1)
		move.l	(a4)+,obVelX(a1)
		dbf	d1,.loop

.playsnd:
		moveq	#sfx_WallSmash,d0
		jmp	(PlaySound_Special).w ; play smashing sound

; End of function SmashObject