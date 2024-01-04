; Variables (v) and Flags (f)

v_startofram	= v_128x128

	phase	$FFFF0000
v_128x128	ds.b $8000	; 128x128 tile mappings ($8000 bytes)
Level_layout_header		ds.b 8			; first word = chunks per FG row, second word = chunks per BG row, third word = FG rows, fourth word = BG rows
Level_layout_main		ds.b $FF8		; $40 word-sized line pointers followed by actual layout data
	ds.b $1800
v_bgscroll_buffer	ds.b $200	; background scroll buffer ($200 bytes)
v_ngfx_buffer	ds.b $200	; Nemesis graphics decompression buffer ($200 bytes)
v_spritequeue	ds.b $400	; sprite display queue, in order of priority ($400 bytes)
v_16x16		ds.b $1800	; 16x16 tile mappings

VDP_Command_Buffer	ds.w 7*$12

VDP_Command_Buffer_Slot	ds.w 1
	ds.b $202

v_tracksonic	ds.b $100	; position tracking data for Sonic ($100 bytes)
v_hscrolltablebuffer	ds.b $380	; scrolling table data ($380 bytes)
	ds.b $80

v_objspace	ds.b $2000	; object variable space ($40 bytes per object) ($2000 bytes)
v_objspace_end

	dephase

; Title screen objects
v_sonicteam	= v_objspace+object_size*2	; object variable space for the "SONIC TEAM PRESENTS" text ($40 bytes)
v_titlesonic	= v_objspace+object_size*1	; object variable space for Sonic in the title screen ($40 bytes)
v_pressstart	= v_objspace+object_size*2	; object variable space for the "PRESS START BUTTON" text ($40 bytes)
v_titletm	= v_objspace+object_size*3	; object variable space for the trademark symbol ($40 bytes)
v_ttlsonichide	= v_objspace+object_size*4	; object variable space for hiding part of Sonic ($40 bytes)

; Level objects
v_player	= v_objspace+object_size*0	; object variable space for Sonic ($40 bytes)
v_titlecard	= v_objspace+object_size*1	; object variable space for the title card ($100 bytes)
v_ttlcardname	= v_titlecard+object_size*0	; object variable space for the title card zone name text ($40 bytes)
v_ttlcardzone	= v_titlecard+object_size*1	; object variable space for the title card "ZONE" text ($40 bytes)
v_ttlcardact	= v_titlecard+object_size*2	; object variable space for the title card act text ($40 bytes)
v_ttlcardoval	= v_titlecard+object_size*3	; object variable space for the title card oval ($40 bytes)

v_gameovertext1	= v_objspace+object_size*2	; object variable space for the "GAME"/"TIME" in "GAME OVER"/"TIME OVER" text ($40 bytes)
v_gameovertext2	= v_objspace+object_size*3	; object variable space for the "OVER" in "GAME OVER"/"TIME OVER" text ($40 bytes)

v_shieldobj	= v_objspace+object_size*6	; object variable space for the shield ($40 bytes)
v_starsobj1	= v_objspace+object_size*8	; object variable space for the invincibility stars #1 ($40 bytes)
v_starsobj2	= v_objspace+object_size*9	; object variable space for the invincibility stars #2 ($40 bytes)
v_starsobj3	= v_objspace+object_size*10	; object variable space for the invincibility stars #3 ($40 bytes)
v_starsobj4	= v_objspace+object_size*11	; object variable space for the invincibility stars #4 ($40 bytes)

v_splash	= v_objspace+object_size*12	; object variable space for the water splash ($40 bytes)
v_sonicbubbles	= v_objspace+object_size*13	; object variable space for the bubbles that come out of Sonic's mouth/drown countdown ($40 bytes)
v_watersurface1	= v_objspace+object_size*30	; object variable space for the water surface #1 ($40 bytes)
v_watersurface2	= v_objspace+object_size*31	; object variable space for the water surface #1 ($40 bytes)

v_endcard	= v_objspace+object_size*23	; object variable space for the level results card ($1C0 bytes)
v_endcardsonic	= v_endcard+object_size*0	; object variable space for the level results card "SONIC HAS" text ($40 bytes)
v_endcardpassed	= v_endcard+object_size*1	; object variable space for the level results card "PASSED" text ($40 bytes)
v_endcardact	= v_endcard+object_size*2	; object variable space for the level results card act text ($40 bytes)
v_endcardscore	= v_endcard+object_size*3	; object variable space for the level results card score tally ($40 bytes)
v_endcardtime	= v_endcard+object_size*4	; object variable space for the level results card time bonus tally ($40 bytes)
v_endcardring	= v_endcard+object_size*5	; object variable space for the level results card ring bonus tally ($40 bytes)
v_endcardoval	= v_endcard+object_size*6	; object variable space for the level results card oval ($40 bytes)

v_lvlobjspace	= v_objspace+object_size*32	; level object variable space ($1800 bytes)
v_lvlobjend	= v_lvlobjspace+object_size*96
v_objend	= v_lvlobjend

; Special Stage objects
v_ssrescard	= v_objspace+object_size*23	; object variable space for the Special Stage results card ($140 bytes)
v_ssrestext	= v_ssrescard+object_size*0	; object variable space for the Special Stage results card text ($40 bytes)
v_ssresscore	= v_ssrescard+object_size*1	; object variable space for the Special Stage results card score tally ($40 bytes)
v_ssresring	= v_ssrescard+object_size*2	; object variable space for the Special Stage results card ring bonus tally ($40 bytes)
v_ssresoval	= v_ssrescard+object_size*3	; object variable space for the Special Stage results card oval ($40 bytes)
v_ssrescontinue	= v_ssrescard+object_size*4	; object variable space for the Special Stage results card continue icon ($40 bytes)
v_ssresemeralds	= v_objspace+object_size*32	; object variable space for the emeralds in the Special Stage results ($180 bytes)

; Continue screen objects
v_continuetext	= v_objspace+object_size*1	; object variable space for the continue screen text ($40 bytes)
v_continuelight	= v_objspace+object_size*2	; object variable space for the continue screen light spot ($40 bytes)
v_continueicon	= v_objspace+object_size*3	; object variable space for the continue screen icon ($40 bytes)

; Ending objects
v_endemeralds	= v_objspace+object_size*16	; object variable space for the emeralds in the ending ($180 bytes)
v_endlogo	= v_objspace+object_size*16	; object variable space for the logo in the ending ($40 bytes)

; Credits objects
v_credits	= v_objspace+object_size*2	; object variable space for the credits text ($40 bytes)
v_endeggman	= v_objspace+object_size*2	; object variable space for Eggman after the credits ($40 bytes)
v_tryagain	= v_objspace+object_size*3	; object variable space for the "TRY AGAIN" text ($40 bytes)
v_eggmanchaos	= v_objspace+object_size*32	; object variable space for the emeralds juggled by Eggman ($180 bytes)
	
	phase v_objspace_end

	ds.b $500	; free ram

v_gamemode	ds.b 1	; game mode (00=Sega; 04=Title; 08=Demo; 0C=Level; 10=SS; 14=Cont; 18=End; 1C=Credit; +8C=PreLevel)
	ds.b 1

v_jpadhold2	ds.b 1	; joypad input - held, duplicate
v_jpadpress2	ds.b 1	; joypad input - pressed, duplicate
v_jpadhold1	ds.b 1	; joypad input - held
v_jpadpress1	ds.b 1	; joypad input - pressed
	ds.b 6

v_vdp_buffer1	ds.w 1	; VDP instruction buffer (2 bytes)
	ds.b 6

v_demolength	ds.w 1	; the length of a demo in frames (2 bytes)
v_scrposy_vdp	ds.w 1	; screen position y (VDP) (2 bytes)
v_bgscrposy_vdp	ds.w 1	; background screen position y (VDP) (2 bytes)
v_scrposx_vdp	ds.w 1	; screen position x (VDP) (2 bytes)
v_bgscrposx_vdp	ds.w 1	; background screen position x (VDP) (2 bytes)
v_bg3scrposy_vdp	ds.w 1	; (2 bytes)
v_bg3scrposx_vdp	ds.w 1	; (2 bytes)
	ds.w 1

v_hbla_hreg	ds.w 1	; VDP H.interrupt register buffer (8Axx) (2 bytes)
v_hbla_line	= v_hbla_hreg+1	; screen line where water starts and palette is changed by HBlank
v_pfade_start	ds.b 1	; palette fading - start position in bytes
v_pfade_size	ds.b 1	; palette fading - number of colours
	ds.w 1

v_vbla_routine	ds.b 1	; VBlank - routine counter
	ds.b 1
v_spritecount	ds.b 1	; number of sprites on-screen
	ds.b 5

v_pcyc_num	ds.w 1	; palette cycling - current reference number (2 bytes)
v_pcyc_time	ds.w 1	; palette cycling - time until the next change (2 bytes)
v_random	ds.l 1	; pseudo random number buffer (4 bytes)
f_pause		ds.b 1	; flag set to pause the game (1 byte)
	ds.b 7

v_vdp_buffer2	ds.w 1	; VDP instruction buffer (2 bytes)
f_hbla_pal	ds.b 1	; flag set to change palette during HBlank (0000 = no; 0001 = change) (2 bytes)
	ds.b 1
v_waterpos1	ds.w 1	; water height, actual (2 bytes)
v_waterpos2	ds.w 1	; water height, ignoring sway (2 bytes)
v_waterpos3	ds.w 1	; water height, next target (2 bytes)
f_water		ds.b 1	; flag set for water
v_wtr_routine	ds.b 1	; water event - routine counter
f_wtr_state	ds.b 1	; water palette state when water is above/below the screen (00 = partly/all dry; 01 = all underwater)
f_do_updates	ds.b 1	; do updates in horziontal interrupts (1 byte)

v_pal_buffer	ds.b $30	; palette data buffer (used for palette cycling) ($30 bytes)
v_plc_buffer	ds.b $60	; pattern load cues buffer (maximum $10 PLCs) ($60 bytes)
v_plc_buffer_only_end

v_plc_buffer_reg0	ds.l 1	; pattern load cues buffer (4 bytes)
v_plc_buffer_reg4	ds.l 1	; pattern load cues buffer (4 bytes)
v_plc_buffer_reg8	ds.l 1	; pattern load cues buffer (4 bytes)
v_plc_buffer_regC	ds.l 1	; pattern load cues buffer (4 bytes)
v_plc_buffer_reg10	ds.l 1	; pattern load cues buffer (4 bytes)
v_plc_buffer_reg14	ds.l 1	; pattern load cues buffer (4 bytes)

f_plc_execute	ds.w 1	; flag set for pattern load cue execution (2 bytes)
v_plc_buffer_reg1A	ds.w 1	; pattern load cues buffer (2 bytes)
	ds.l 1
v_plc_buffer_end	ds.b 0

v_screenposx	ds.l 1	; screen position x (4 bytes)
v_screenposy	ds.l 1	; screen position y (4 bytes)
v_bgscreenposx	ds.l 1	; background screen position x (4 bytes)
v_bgscreenposy	ds.l 1	; background screen position y (4 bytes)
v_bg2screenposx	ds.l 1	; 4 bytes
v_bg2screenposy	ds.l 1	; 4 bytes
v_bg3screenposx	ds.l 1	; 4 bytes
v_bg3screenposy	ds.l 1	; 4 bytes

v_limitleft1	ds.w 1	; left level boundary (2 bytes)
v_limitright1	ds.w 1	; right level boundary (2 bytes)
v_limittop1	ds.w 1	; top level boundary (2 bytes)
v_limitbtm1	ds.w 1	; bottom level boundary (2 bytes)
v_limitleft2	ds.w 1	; left level boundary (2 bytes)
v_limitright2	ds.w 1	; right level boundary (2 bytes)
v_limittop2	ds.w 1	; top level boundary (2 bytes)
v_limitbtm2	ds.w 1	; bottom level boundary (2 bytes)
	ds.l 1

v_limitleft3	ds.w 1	; left level boundary, at the end of an act (2 bytes)
	ds.l 1

v_scrshiftx	ds.w 1	; x-screen shift (new - last) * $100
v_scrshifty	ds.w 1	; y-screen shift (new - last) * $100

v_lookshift	ds.w 1	; screen shift when Sonic looks up/down (2 bytes)
	ds.w 1

v_dle_routine	ds.b 1	; dynamic level event - routine counter
	ds.b 1
f_nobgscroll	ds.b 1	; flag set to cancel background scrolling
	ds.b 5

v_fg_xblock	ds.b 1	; foreground x-block parity (for redraw)
v_fg_yblock	ds.b 1	; foreground y-block parity (for redraw)
v_bg1_xblock	ds.b 1	; background x-block parity (for redraw)
v_bg1_yblock	ds.b 1	; background y-block parity (for redraw)
v_bg2_xblock	ds.b 1	; secondary background x-block parity (for redraw)
v_bg2_yblock	ds.b 1	; secondary background y-block parity (unused)
v_bg3_xblock	ds.b 1	; teritary background x-block parity (for redraw)
v_bg3_yblock	ds.b 1	; teritary background y-block parity (unused)
	ds.w 1

v_fg_scroll_flags	ds.w 1	; screen redraw flags for foreground
v_bg1_scroll_flags	ds.w 1	; screen redraw flags for background 1
v_bg2_scroll_flags	ds.w 1	; screen redraw flags for background 2
v_bg3_scroll_flags	ds.w 1	; screen redraw flags for background 3
f_bgscrollvert	ds.b 1	; flag for vertical background scrolling
	ds.b 3

v_sonspeedmax	ds.w 1	; Sonic's maximum speed (2 bytes)
v_sonspeedacc	ds.w 1	; Sonic's acceleration (2 bytes)
v_sonspeeddec	ds.w 1	; Sonic's deceleration (2 bytes)
v_sonframenum	ds.b 1	; frame to display for Sonic
	ds.b 1
v_anglebuffer	ds.l 1	; angle of collision block that Sonic or object is standing on

v_opl_routine	ds.b 1	; ObjPosLoad - routine counter
	ds.b 1
v_opl_screen	ds.w 1	; ObjPosLoad - screen variable
v_opl_data	ds.b $10	; ObjPosLoad - data buffer ($10 bytes)

v_ssangle	ds.w 1	; Special Stage angle (2 bytes)
v_ssrotate	ds.w 1	; Special Stage rotation speed (2 bytes)
	ds.b 6

v_btnpushtime1	ds.w 1	; button push duration - in level (2 bytes)
v_btnpushtime2	ds.w 1	; button push duration - in demo (2 bytes)
v_palchgspeed	ds.b 1	; palette fade/transition speed (0 is fastest) (1 byte)
	ds.b 1
v_collindex	ds.l 1	; ROM address for collision index of current level (4 bytes)
v_palss_num	ds.w 1	; palette cycling in Special Stage - reference number (2 bytes)
v_palss_time	ds.w 1	; palette cycling in Special Stage - time until next change (2 bytes)
	ds.b $C

v_obj31ypos	ds.w 1	; y-position of object 31 (MZ stomper) (2 bytes)
	ds.b 1
v_bossstatus	ds.b 1	; status of boss and prison capsule (01 = boss defeated; 02 = prison opened)
v_trackpos	ds.b 1	; position tracking reference number (2 bytes)
v_trackbyte	ds.b 1	; low byte for position tracking
f_lockscreen	ds.b 1	; flag set to lock screen during bosses
	ds.b 5

v_lani0_frame	ds.b 1	; level graphics animation 0 - current frame
v_lani0_time	ds.b 1	; level graphics animation 0 - time until next frame
v_lani1_frame	ds.b 1	; level graphics animation 1 - current frame
v_lani1_time	ds.b 1	; level graphics animation 1 - time until next frame
v_lani2_frame	ds.b 1	; level graphics animation 2 - current frame
v_lani2_time	ds.b 1	; level graphics animation 2 - time until next frame
v_lani3_frame	ds.b 1	; level graphics animation 3 - current frame
v_lani3_time	ds.b 1	; level graphics animation 3 - time until next frame
v_lani4_frame	ds.b 1	; level graphics animation 4 - current frame
v_lani4_time	ds.b 1	; level graphics animation 4 - time until next frame
v_lani5_frame	ds.b 1	; level graphics animation 5 - current frame
v_lani5_time	ds.b 1	; level graphics animation 5 - time until next frame
	ds.w 1

v_gfxbigring	ds.w 1	; settings for giant ring graphics loading (2 bytes)
f_conveyrev	ds.b 1	; flag set to reverse conveyor belts in LZ/SBZ
v_obj63		ds.b 6	; object 63 (LZ/SBZ platforms) variables (6 bytes)
f_wtunnelmode	ds.b 1	; LZ water tunnel mode
f_playerctrl	ds.b 1	; Player control override flags (object ineraction, control enable)
f_wtunnelallow	ds.b 1	; LZ water tunnels (00 = enabled; 01 = disabled)
f_slidemode	ds.b 1	; LZ water slide mode
v_obj6B		ds.b 1	; object 6B (SBZ stomper) variable
f_lockctrl	ds.b 1	; flag set to lock controls during ending sequence
f_bigring	ds.b 1	; flag set when Sonic collects the giant ring
f_obj56		ds.b 1 ; object 56 flag
	ds.b 1

v_itembonus	ds.w 1	; item bonus from broken enemies, blocks etc. (2 bytes)
v_timebonus	ds.w 1	; time bonus at the end of an act (2 bytes)
v_ringbonus	ds.w 1	; ring bonus at the end of an act (2 bytes)
f_endactbonus	ds.b 1	; time/ring bonus update flag at the end of an act
v_sonicend	ds.b 1	; routine counter for Sonic in the ending sequence
v_lz_deform	ds.w 1	; LZ deformtaion offset, in units of $80 (2 bytes)
	ds.b 6
f_switch	ds.b $10	; flags set when Sonic stands on a switch ($10 bytes)
v_scroll_block_1_size	ds.w 1	; (2 bytes)
v_scroll_block_2_size	ds.w 1	; unused (2 bytes)
v_scroll_block_3_size	ds.w 1	; unused (2 bytes)
v_scroll_block_4_size	ds.w 1	; unused (2 bytes)
	ds.b 8

v_spritetablebuffer	ds.b $280 ; sprite table ($280 bytes)
v_pal_water_dup	ds.b $80 ; duplicate underwater palette, used for transitions ($80 bytes)
v_pal_water	ds.b $80	; main underwater palette ($80 bytes)
v_pal_dry	ds.b $80	; main palette ($80 bytes)
v_pal_dry_dup	ds.b $80	; duplicate palette, used for transitions ($80 bytes)
	ds.b $80	; free space
v_objstate	ds.b $C0	; object state list ($C0 bytes)
v_objstate_end

		ds.b $140		; stack
v_systemstack	ds.w 1
f_restart	ds.b 1	; restart level flag (1 byte)
v_hud		ds.b 1	; flag for the HUD (1 byte)
v_framecount	ds.w 1	; frame counter (adds 1 every frame) (2 bytes)
v_framebyte	= v_framecount+1; low byte for frame counter
	if debugbuild
v_debugitem	ds.w 1	; debug item currently selected (NOT the object number of the item)
v_debuguse	ds.w 1	; debug mode use & routine counter (when Sonic is a ring/item) (2 bytes)
v_debugxspeed	ds.b 1	; debug mode - horizontal speed
v_debugyspeed	ds.b 1	; debug mode - vertical speed
	else
	ds.b 6
	endif
v_vbla_count	ds.l 1	; vertical interrupt counter (adds 1 every VBlank) (4 bytes)
v_vbla_word	= v_vbla_count+2 ; low word for vertical interrupt counter (2 bytes)
v_vbla_byte	= v_vbla_word+1	; low byte for vertical interrupt counter
v_zone		ds.b 1	; current zone number
v_act		ds.b 1	; current act number
v_lives		ds.b 1	; number of lives
	ds.b 1
v_air		ds.b 1	; air remaining while underwater (1 byte)
	ds.b 1
v_lastspecial	ds.b 1	; last special stage number
	ds.b 1
v_continues	ds.b 1	; number of continues
	ds.b 1
f_timeover	ds.b 1	; time over flag
v_lifecount	ds.b 1	; lives counter value (for actual number, see "v_lives")
f_lifecount	ds.b 1	; lives counter update flag
f_ringcount	ds.b 1	; ring counter update flag
f_timecount	ds.b 1	; time counter update flag
f_scorecount	ds.b 1	; score counter update flag
v_rings		ds.w 1	; rings (2 bytes)
v_ringbyte	= v_rings+1	; low byte for rings
v_time		ds.l 1	; time (4 bytes)
v_timemin	= v_time+1	; time - minutes
v_timesec	= v_time+2	; time - seconds
v_timecent	= v_time+3	; time - centiseconds
v_score		ds.l 1	; score (4 bytes)
v_shield	ds.b 1	; shield status (00 = no; 01 = yes)
v_invinc	ds.b 1	; invinciblity status (00 = no; 01 = yes)
v_shoes		ds.b 1	; speed shoes status (00 = no; 01 = yes)
	ds.b 1
v_lastlamp	ds.b 1	; number of the last lamppost you hit
v_lamp_last	ds.b 1	; last lamppost you hit (1 byte)
v_lamp_xpos	ds.w 1	; x-axis for Sonic to respawn at lamppost (2 bytes)
v_lamp_ypos	ds.w 1	; y-axis for Sonic to respawn at lamppost (2 bytes)
	ds.w 1
v_lamp_time	ds.l 1	; time stored at lamppost (4 bytes)
v_lamp_dle	ds.w 1	; dynamic level event routine counter at lamppost
v_lamp_limitbtm	ds.w 1	; level bottom boundary at lamppost (2 bytes)
v_lamp_scrx	ds.w 1 ; x-axis screen at lamppost (2 bytes)
v_lamp_scry	ds.w 1 ; y-axis screen at lamppost (2 bytes)
v_lamp_bgscrx	ds.w 1 ; bg x-axis screen at lamppost (2 bytes)
v_lamp_bgscry	ds.w 1 ; bg x-axis screen at lamppost (2 bytes)
v_lamp_bg2scrx	ds.w 1 ; bg x-axis screen at lamppost (2 bytes)
v_lamp_bg2scry	ds.w 1 ; bg x-axis screen at lamppost (2 bytes)
v_lamp_bg3scrx	ds.w 1 ; bg x-axis screen at lamppost (2 bytes)
v_lamp_bg3scry	ds.w 1 ; bg x-axis screen at lamppost (2 bytes)
v_lamp_wtrpos	ds.w 1 ; water position at lamppost (2 bytes)
v_lamp_wtrrout	ds.b 1 ; water routine at lamppost
v_lamp_wtrstat	ds.b 1 ; water state at lamppost
	ds.b 5

v_emeralds	ds.b 1	; number of chaos emeralds
v_emldlist	ds.b 6	; which individual emeralds you have (00 = no; 01 = yes) (6 bytes)
v_oscillate	ds.b $42	; values which oscillate - for swinging platforms, et al ($42 bytes)
	ds.b $20
v_ani0_time	ds.b 1	; synchronised sprite animation 0 - time until next frame (used for synchronised animations)
v_ani0_frame	ds.b 1	; synchronised sprite animation 0 - current frame
v_ani1_time	ds.b 1	; synchronised sprite animation 1 - time until next frame
v_ani1_frame	ds.b 1	; synchronised sprite animation 1 - current frame
v_ani2_time	ds.b 1	; synchronised sprite animation 2 - time until next frame
v_ani2_frame	ds.b 1	; synchronised sprite animation 2 - current frame
v_ani3_time	ds.b 1	; synchronised sprite animation 3 - time until next frame
v_ani3_frame	ds.b 1	; synchronised sprite animation 3 - current frame
v_ani3_buf	ds.w 1	; synchronised sprite animation 3 - info buffer (2 bytes)
	ds.b $26

v_limittopdb	ds.w 1	; level upper boundary, buffered for debug mode (2 bytes)
v_limitbtmdb	ds.w 1	; level bottom boundary, buffered for debug mode (2 bytes)
	ds.b $1C

v_screenposx_dup	ds.l 1	; screen position x (duplicate) (4 bytes)
v_screenposy_dup	ds.l 1	; screen position y (duplicate) (4 bytes)
v_bgscreenposx_dup	ds.l 1	; background screen position x (duplicate) (4 bytes)
v_bgscreenposy_dup	ds.l 1	; background screen position y (duplicate) (4 bytes)
v_bg2screenposx_dup	ds.l 1	; 4 bytes
v_bg2screenposy_dup	ds.l 1	; 4 bytes
v_bg3screenposx_dup	ds.l 1	; 4 bytes
v_bg3screenposy_dup	ds.l 1	; 4 bytes
v_fg_scroll_flags_dup	ds.w 1
v_bg1_scroll_flags_dup	ds.w 1
v_bg2_scroll_flags_dup	ds.w 1
v_bg3_scroll_flags_dup	ds.w 1
	ds.b $48

v_levseldelay	ds.b 1	; level select - time until change when up/down is held (1 byte)
v_levselitem	ds.b 1	; level select - item selected (1 byte)
v_levselsound	ds.b 1	; level select - sound selected (1 byte)
		ds.b $3D

v_scorecopy	ds.l 1	; score, duplicate (4 bytes)
v_scorelife	= v_scorecopy	; points required for an extra life (4 bytes) (JP1 only)
	ds.b $C
v_colladdr1:	ds.l 1	; (4 bytes)
v_colladdr2:	ds.l 1	; (4 bytes)
v_top_solid_bit:	ds.b 1
v_lrb_solid_bit:	ds.b 1
	ds.b 6
f_levselcheat	ds.b 1	; level select cheat flag
f_slomocheat	ds.b 1	; slow motion & frame advance cheat flag
	if debugbuild
f_debugcheat	ds.b 1	; debug mode cheat flag
	else
	ds.b 1
	endif
f_creditscheat	ds.b 1	; hidden credits & press start cheat flag
v_title_dcount	ds.w 1	; number of times the d-pad is pressed on title screen (2 bytes)
v_title_ccount	ds.w 1	; number of times C is pressed on title screen (2 bytes)
	ds.l 2

f_demo		ds.w 1	; demo mode flag (0 = no; 1 = yes; $8001 = ending) (2 bytes)
v_demonum	ds.w 1	; demo level number (not the same as the level number) (2 bytes)
v_creditsnum	ds.w 1	; credits index number (2 bytes)
	ds.w 1
v_megadrive	ds.w 1	; Megadrive machine type
	if debugbuild
f_debugmode	ds.b 1	; debug mode flag (1 byte)
	else
	ds.b 1
	endif
	ds.b 1
v_init		ds.b 1	; initiation flag (1 byte)
	ds.w 1
v_endofram	ds.b 1
	dephase
	!org 0