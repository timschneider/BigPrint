G10 P0 S255 R160    ; set temperatures for PETG
T0                  ; Select T0
M116 P0             ; wait for temp
M83                 ; relative extrusion
G1 E-85 F120        ; extrude 85mm @ 2mm/sec