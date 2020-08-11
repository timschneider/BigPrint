; homez.g
; called to home the Z axis
;

M120                                                            ; push current settings on stack
G91                                                             ; relative positioning
M98 P"0:/sys/bed.g"                                             ; run true bed leveling
G90                                                             ; absolute positioning
G1 X{move.axes[0].max/2} Y{move.axes[1].max/2} F6000            ; go to bed center probe point
G1 Z15 F300                                                     ; drive Z to 15 position
G30 X{move.axes[0].max/2} Y{move.axes[1].max/2}
M121                                                            ; pop stored settings from stack