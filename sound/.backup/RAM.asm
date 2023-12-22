; =================================================================================
; From here on, until otherwise stated, all offsets are relative to v_snddriver_ram
; =================================================================================
	phase	$000
v_startofvariables:	ds.b 0
v_sndprio:		ds.b 1	; sound priority (priority of new music/SFX must be higher or equal to this value or it won't play; bit 7 of priority being set prevents this value from changing)
v_main_tempo_timeout:	ds.b 1	; Counts down to zero; when zero, resets to next value and delays song by 1 frame
v_main_tempo:		ds.b 1	; Used for music only
f_pausemusic:		ds.b 1	; flag set to stop music when paused
v_fadeout_counter:	ds.b 1
	ds.b 1
v_fadeout_delay:	ds.b 1
v_communication_byte:	ds.b 1	; used in Ristar to sync with a boss' attacks; unused here
f_updating_dac:		ds.b 1	; $80 if updating DAC, $00 otherwise
v_sound_id:		ds.b 1	; sound or music copied from below
v_soundqueue_start:	= v_soundqueue0
v_soundqueue0:		ds.b 1	; sound or music to play
v_soundqueue1:		ds.b 1	; special sound to play
v_soundqueue_end:
	ds.b 1
	ds.b 1

f_voice_selector:	ds.b 10	; $00 = use music voice pointer; $40 = use special voice pointer; $80 = use track voice pointer

v_voice_ptr:		ds.l 1	; voice data pointer (4 bytes)

v_special_voice_ptr:	ds.l 1	; voice data pointer for special SFX ($D0-$DF) (4 bytes)

f_fadein_flag:		ds.b 1	; Flag for fade in
v_fadein_delay:		ds.b 1
v_fadein_counter:	ds.b 1	; Timer for fade in/out
f_1up_playing:		ds.b 1	; flag indicating 1-up song is playing
v_tempo_mod:		ds.b 1	; music - tempo modifier
v_speeduptempo:		ds.b 1	; music - tempo modifier with speed shoes
f_speedup:		ds.b 1	; flag indicating whether speed shoes tempo is on ($80) or off ($00)
v_ring_speaker:		ds.b 1	; which speaker the "ring" sound is played in (00 = right; 01 = left)
f_push_playing:		ds.b 1	; if set, prevents further push sounds from playing
	ds.b 1	; 29
	ds.b 1	; 2A
	ds.b 1	; 2B
	ds.b 1	; 2C
	ds.b 1	; 2D
	ds.b 1	; 2E
v_endofvariables:	ds.b 1	; 2F

	dephase
	
        phase TrackSz

v_music_track_ram:	; Start of music RAM

v_music_fmdac_tracks:
v_music_dac_track:	ds.b TrackSz
v_music_fm_tracks:
v_music_fm1_track:	ds.b TrackSz
v_music_fm2_track:	ds.b TrackSz
v_music_fm3_track:	ds.b TrackSz
v_music_fm4_track:	ds.b TrackSz
v_music_fm5_track:	ds.b TrackSz
v_music_fm6_track:	ds.b TrackSz
v_music_fm_tracks_end:
v_music_fmdac_tracks_end:
v_music_psg_tracks:
v_music_psg1_track:	ds.b TrackSz
v_music_psg2_track:	ds.b TrackSz
v_music_psg3_track:	ds.b TrackSz
v_music_psg_tracks_end:
v_music_track_ram_end:

v_sfx_track_ram:	; Start of SFX RAM, straight after the end of music RAM

v_sfx_fm_tracks:
v_sfx_fm3_track:	ds.b TrackSz
v_sfx_fm4_track:	ds.b TrackSz
v_sfx_fm5_track:	ds.b TrackSz
v_sfx_fm_tracks_end:
v_sfx_psg_tracks:
v_sfx_psg1_track:	ds.b TrackSz
v_sfx_psg2_track:	ds.b TrackSz
v_sfx_psg3_track:	ds.b TrackSz
v_sfx_psg_tracks_end:
v_sfx_track_ram_end:

v_spcsfx_track_ram:	; Start of special SFX RAM, straight after the end of SFX RAM

v_spcsfx_fm4_track:	ds.b TrackSz
v_spcsfx_psg3_track:	ds.b TrackSz
v_spcsfx_track_ram_end:

v_1up_ram_copy:		ds.b TrackSz

	dephase

Size_Of_Snd_Driver = v_1up_ram_copy

	if MOMPASS=1
		message "Sound Driver RAM: $\{Size_Of_Snd_Driver} bytes."
	endif