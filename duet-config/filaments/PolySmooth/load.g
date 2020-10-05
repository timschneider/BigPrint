; Load T0 with PolySmooth
G10 P0 S198 R160                                ; set temperatures for PolySmooth
T0                                              ; select tool
M116                                            ; wait for temp
M98 P"0:/macros/tse/load_filament_sensorless"   ; load filament