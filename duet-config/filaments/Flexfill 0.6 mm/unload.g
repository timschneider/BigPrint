G10 P0 S255 R220                            ; set temperatures for PETG
T0                                          ; Select T0
M116 P0                                     ; wait for temp
M98 P"0:/sys/meltingplot/unload_filament"   ; unload filament