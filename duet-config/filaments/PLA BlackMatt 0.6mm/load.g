; Load T0 with PLA BlackMatt
G10 P0 S220 R160                                    ; set temperatures
T0                                                  ; select tool
M116 P0                                             ; wait for temp
M98 P"0:/sys/meltingplot/load_filament_sensorless"  ; load filament