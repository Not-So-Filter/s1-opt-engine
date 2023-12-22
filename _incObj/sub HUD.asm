; ---------------------------------------------------------------------------
; Object 21 - SCORE, TIME, RINGS
; ---------------------------------------------------------------------------

BuildHUD:
		tst.w	(v_rings).w
		beq.s	HUD_Blink	; blink ring count if it's 0
		moveq	#0,d1
		btst	#3,(v_framebyte).w
		bne.s	HUD_Normal	; only blink on certain frames
		cmpi.b	#9,(v_timemin).w	; should the minutes counter blink?
		bne.s	HUD_Normal	; if not, branch
		addq.w	#2,d1		; set mapping frame time counter blink
		bra.s	HUD_Normal
HUD_Blink:
		moveq	#0,d1
		btst	#3,(v_framebyte).w
		bne.s	HUD_Normal	; only blink on certain frames
		addq.w	#1,d1		; set mapping frame for ring count blink
		cmpi.b	#9,(v_timemin).w
		bne.s	HUD_Normal
		addq.w	#2,d1		; set mapping frame for double blink
HUD_Normal:
		move.w	#128+16,d3	; set X pos
		move.w	#128+136,d2	; set Y pos
		lea	Map_HUD(pc),a1
		movea.w	#$6CA,a3	; set art tile and flags
		add.w	d1,d1
		adda.w	(a1,d1.w),a1
		move.w	(a1)+,d1
		subq.w	#1,d1
		bmi.s	.locret
		bra.w	BuildSpr_Normal	; draw frame
.locret:
		rts
; End of function BuildHUD