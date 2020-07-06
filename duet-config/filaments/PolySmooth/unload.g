G10 P0 S198 R160    ; set temperatures for PolySmooth
T0                  ; Select T0
M116                ; wait for temp
M83                 ; relative extrusion
G1 E-90 F120         ; extrude 90mm @ 2mm/sec