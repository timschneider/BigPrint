; Left door closed

M203 Z1200.0 ; revert z movement
M220 S100 ; revert speed to 100%

if state.status == "paused" || state.status == "pausing"
  M24 ; resume current print