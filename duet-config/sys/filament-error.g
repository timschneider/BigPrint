if param.P == 2 || param.P == 6
    echo "SensorError: " ^ param.P ^ "  sensor : " ^ param.D ^ " - continue printing"
    M99

echo "Filament error: " ^ param.P ^ " on sensor " ^ param.D ^ " - paused"
M291 P{"Filament Sensor " ^ param.D ^ ": " ^ param.S ^ " - Paused"} S1 T0
M25 ; pause