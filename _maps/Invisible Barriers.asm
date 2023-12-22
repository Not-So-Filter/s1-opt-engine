; ---------------------------------------------------------------------------
; Sprite mappings - invisible solid blocks
; ---------------------------------------------------------------------------
Map_Invis_internal:
		dc.w .solid-Map_Invis_internal
.solid:		dc.b 4
		dc.b $F0, 5, 0,	$18, $F0
		dc.b $F0, 5, 0,	$18, 0
		dc.b 0,	5, 0, $18, $F0
		dc.b 0,	5, 0, $18, 0
		even