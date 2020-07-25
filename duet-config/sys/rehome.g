; rehome.g
; called to home x and y after stall detection
;
G91                    ; relative positioning
G1 Z5 F600         ; lift Z relative to current position
G1 H1 X-860 Y410 F3200 ; move quickly to X or Y endstop and stop there (first pass)
G1 H1 X-860            ; home X axis
G1 H1 Y410             ; home Y axis
G1 X5 Y-5 F6000        ; go back a few mm
G1 H1 X-860 F360       ; move slowly to X axis endstop once more (second pass)
G1 H1 Y410 F360            ; then move slowly to Y axis endstop
G90                    ; absolute positioning