G10 P0 S230 R160    ; set temperatures for Greentec Pro
M116 P0             ; wait for temp
M83                 ; relative extrusion
G1 E-85 F60         ; extrude 85mm @ 1mm/sec