G10 P0 S215 R160    ; set temperatures for PLA+
T0                  ; Select T0
M116 P0             ; wait for temp
M83                 ; relative extrusion
G1 E-85 F120        ; extrude 85mm @ 2mm/sec