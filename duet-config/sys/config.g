; Configuration file for Duet WiFi (firmware version 3)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v2.1.4 on Mon Dec 23 2019 10:22:33 GMT+0100 (Mitteleuropäische Normalzeit)

; General preferences
G90                                                     ; send absolute coordinates...
M83                                                     ; ...but relative extruder moves
M550 P"Meltingplot.MBL 133"                             ; set printer name

M667 S1                                                 ; select CoreXY mode

; Network Ethernet
M586 C""                                                 ; disable CORS
M551 P"meltingplot"                                      ; set password
;M552 P192.168.172.40 S1                                 ; enable network and set IP address
;M553 P255.255.255.0                                     ; set netmask
;M554 P192.168.172.1                                     ; set gateway

; Network WiFi
; send the following M587 via Serial Connection to the Duet
; M552 S0 ; put wifi into ide
; G4 S5 ; wait 5 seconds
; M587 S"SSID" P"password"
M552 S1                                                 ; enable network

M586 P0 S1                                              ; enable HTTP
M586 P1 S0                                              ; disable FTP
M586 P2 S0                                              ; disable Telnet

; Drives
M569 P0 S1                                              ; physical drive 0 goes forwards (x - front)
M569 P1 S0                                              ; physical drive 1 goes backwards (y - rear)
M569 P2 S1                                              ; physical drive 2 goes forwards (left)
M569 P3 S1                                              ; physical drive 3 goes forwards (rear right)
M569 P4 S1                                              ; physical drive 4 goes forwards (front right)
M569 P5 S0                                              ; physical drive 5 goes backwards (extruder)

M584 X0 Y1 Z2:3:4 E5                                    ; set drive mapping

M350 E16 I1                                             ; configure microstepping with interpolation
M350 Z16 I1                                             ; configure microstepping with interpolation
M350 X16 Y16 I1                                         ; configure microstepping without interpolation
M92 X80 Y80 Z400 E807.5                                 ; set steps per mm

M566 X540.0 Y540.0 Z18.00 E180.00 P1                    ; set maximum instantaneous speed changes (mm/min) and apply jerk on every move
M593 F24.8                                              ; cancle ringing at 24.8Hz
M203 X14400.00 Y14400.00 Z1200.00 E3600.00              ; set maximum speeds (mm/min)
M201 X1500.00 Y1500.00 Z72.00 E4200.00                  ; set accelerations (mm/s^2)
M204 P800 T1250                                         ; Set printing and travel accelerations
M906 X1500 Y1500 Z2000 E1300 I30                        ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                                 ; Set idle timeout

; Axis Limits
M208 X0 Y0 Z0 S1                                        ; set axis minima
M208 X851 Y405 Z396 S0                                  ; set axis maxima

; Endstops
M574 X1 S1 P"xstop"                                     ; configure active-high endstop for low end on X via pin xstop
M574 Y2 S1 P"ystop"                                     ; configure active-high endstop for high end on Y via pin ystop
;M574 Z1 S2                                             ; configure Z-probe endstop for low end on Z
M574 Z2 S4                                              ; configure sensorless endstop on high end of Z
M591 D0 P1 C"e1stop" S1                                 ; enable filament sensor on E0 as active high

; Led
M950 P0 C"!exp.heater5"                                 ; Configure P0 as output for LED Strip
M42 P0 S0.25                                            ; Set LEDs to 25%

; ATX PS_ON
; M80 enable ATX power
; M81 disable ATX power
; our PSU uses an inverted PS_ON logic which is currently not supported by firmware
; do not use M80/M81 until the firmware is fixed

; Heaters
M950 H0 C"nil"
M950 H1 C"nil"

; Bed Heaters
;M308 S0 P"e2temp" Y"thermistor" T100000 B4598 C8.68e-08 A"bed" ; MBL 136
M308 S0 P"e2temp" Y"thermistor" T100000 B4092 A"bed"    ; configure sensor 0 as thermistor on pin e0temp
M950 H0 C"duex.fan3" T0 Q10                             ; create bed heater output on duex.fan3 and map it to sensor 0 and set PWM 10Hz
M307 H0 A65.4 C210.5 D1.0 S1.00 V24.4 B0                ; disable bang-bang mode for the left bed heater and set PWM limit
M140 P0 H0                                              ; map heater0 to bed
M143 H0 S120                                            ; set temperature limit for heater 0 to 120C
M570 H0 P5 T10 S10                                      ; Enable heater fault detection (Trigger Time 5sec, temp deviation 10°, cancel print after 10min) 

; Hotend
M308 S2 P"spi.cs1" Y"rtd-max31865" A"hotend"            ; configure sensor 2 as thermistor on pin bedtemp
M950 H1 C"!exp.heater3" T2                              ; create nozzle heater output on exp.heater3 and map it to sensor 2
M143 H1 S285                                            ; set temperature limit for heater 2 to 285C
M307 H1 A323.8 C188.4 D4.9 S1.00 V24.3 B0               ; disable bang-bang mode for the nozzle heater and set PWM limit
M570 H1 P5 T15 S10                                      ; Enable heater fault detection (Trigger Time 5sec, temp deviation 15°, cancel print after 10min) 

M308 S3 Y"mcu-temp" A"mcu-temp"                         ; configure sensor 3 as temp sens for the mcu

; Fans
M950 F0 C"fan0" Q1000                                   ; create fan 0 (cooling fan) on pin fan0 and set its frequency
M106 P0 S0 H-1                                          ; set fan 0 value. Thermostatic control is turned off
M950 F1 C"fan1" Q250                                    ; create fan 1 (radiator fan) on pin fan1 and set its frequency
M106 P1 H2 T45 L1.0 X1.0 B0.0                           ; set fan 1 value. Thermostatic control is turned on
M950 F2 C"fan2" Q25000                                  ; create fan 2 (duet internal fan) on pin fan0 and set its frequency
M106 P2 S1 H3 T30 L0.35 X1.0 B0.25                      ; set fan 2 value. Thermostatic control is turned on

; Tools
M563 P0 D0 H1 F0                                        ; define tool 0
G10 P0 X0 Y0 Z0                                         ; set tool 0 axis offsets
G10 P0 R0 S0                                            ; set initial tool 0 active and standby temperatures to 0C

; Z-Probe
M558 P1 C"zprobe.in" H4 F240 T14400 A3                  ; set Z probe type to unmodulated and the dive height + speeds probe every point three times
G31 P500 X8.6 Y25.5 Z2.0 C0.00118 S87.5 H0              ; set Z probe trigger value, offset and trigger height, try to set it to whole number of x/8mm pitch/200 steps-rev / 16 micro-step 
M557 X{sensors.probes[0].offsets[0],move.axes[0].max-sensors.probes[0].offsets[0]} Y{sensors.probes[0].offsets[1],move.axes[1].max-sensors.probes[0].offsets[1]} P18:8                        ; define mesh grid
M376 H15                                                ; taper out z correction over 10mm height

M915 X Y S8 F0 R3 H200                                  ; configure stall detection on X and Y without Filter (1 Full Steps)
                                                        ; and min 200 steps/sec (40mm/sec) (concider motor current 1A) and execute rehome.g on stall
M915 Z S4 F0 R0                                         ; configure stall detection on Z for sensor less homing

;M200 D2.85                                             ; set filament diameter to 2.85mm
M200 D0                                                 ; disable volumetric extrusion cause its faulty in firmware
M207 S1.0 R0.0 F1620 T840 Z0.1                          ; Use Firmware retract with 1.0mm retract, 0.0mm additional unretract at retract 1620 mm/min, 840 unretract and 0.1 Z-Lift

M911 S23.4 R23.8 P"M913 X0 Y0 Z10 E10 G91 M83 G1 Z390 E-20 F1500" ; configure power safe mode
M671 X-150.0:915.0:915.0 Y208.5:373.5:43.5 S1.25        ; Z leadscrews are at (-150,215.5), (915,50.5) and (915,380.5)

M572 D0 S0.035                                          ; set pressure advance
M592 D0 A0.00 B0.0112 L0.2                              ; non linear extrusion

; Miscellaneous
M501                                                    ; load saved parameters from non-volatile memory
G31 T0.00118 S87.5 H0                                   ; temp coefficent and calib temp are not stored in override
M929 P"0:/eventlog.log" S1                              ; Enable Event Logging

M98 P"0:/sys/meltingplot/machine-override"              ; Load Machine specific overrides
M98 P"0:/sys/meltingplot/ce-declaration"                ; Load CE Requirements
