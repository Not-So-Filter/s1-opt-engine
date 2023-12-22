; ---------------------------------------------------------------------------
; Subroutine to	load the sound driver
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


SoundDriverLoad:
		move.w	sr,-(sp)
		disable_ints
                stopZ80
		resetZ80
		lea	(Kos_Z80).l,a0	; load sound driver
		lea	(z80_ram).l,a1	; target Z80 RAM
		bsr.w	KosPlusDec		; decompress
		resetZ80a
		resetZ80
		startZ80
		move.w	(sp)+,sr
		rts
; End of function SoundDriverLoad