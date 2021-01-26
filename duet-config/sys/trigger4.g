; THIS FILE CONTAINS CE RELEVANT CONFIGURATIONS, ANY CHANGES TO THIS FILE MAY RESULT IN A LOST OF THE CE DECLARATION


; Left Door opened
;state.status == "idle"
;state.status == "busy" --> this is homing / macro work / tool change etc.
;state.status == "paused"
;state.status == "starting"
;state.status == "pausing"
;state.status == "resuming"
;state.status == "processing" --> this is printing

G60 S5     ; save current position to slot #5

if (state.status == "busy" && move.currentMove.requestedSpeed > 0 ) || (state.status == "processing" && ( move.axes[0].homed == false || move.axes[1].homed == false || move.axes[2].homed == false ))
  M112 ; emergency stop
  ; there is no way to cancle or stop the current move or even slow it down!
elif state.status == "processing"
  M25 ; pause current print

M203 Z300 ; slow down z movement
M220 S10  ; slow down to 10%