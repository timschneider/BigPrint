; Load T0 with ABS
G10 P0 S255 R160    ; set temperatures for ABS
T0                  ; select tool
M116                ; wait for temp
M915 E0 S3          ; set stall sensitivity
M913 E30            ; motor current to 50%
M83                 ; relative extrusion
G1 H1 E800 F600    ; feed up to 800mm until stall
M913 E100           ; restore normal motor current
G1 E90 F120         ; extrude 50mm @ 2mm/sec
G1 E-12.5 F180       ; retract filament