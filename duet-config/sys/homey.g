; homey.g
; called to home the Y axis
;
; generated by RepRapFirmware Configuration Tool v2.1.4 on Mon Dec 23 2019 10:22:33 GMT+0100 (Mitteleuropäische Normalzeit)
M120                                ; push current settings on stack
G91                                 ; relative positioning
G1 H2 Z0.5 F600                     ; lift Z relative to current position
G1 H1 Y{move.axes[1].max+10} F1800  ; move quickly to Y axis endstop and stop there (first pass)
G1 H2 X-5 Y5 F6000                  ; go back a few mm
G1 H1 Y20 F360                      ; move slowly to Y axis endstop once more (second pass)
G1 H2 Z-0.5 F600                    ; lower Z again
G90                                 ; absolute positioning
M121                                ; pop stored settings from stack

