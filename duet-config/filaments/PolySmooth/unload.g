G10 P0 S198 R160                            ; set temperatures for PolySmooth
T0                                          ; Select T0
M116 P0                                     ; wait for temp
M98 P"0:/sys/meltingplot/unload_filament"   ; unload filament