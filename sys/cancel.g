; stop.g
; called when a print is cancelled after a pause.

G10 ; retract filament
G90 ; absolute position
G1 Z390 F1250 ; lift z
M104 S0 ; disable heater
M140 S0 ; disable bed heater