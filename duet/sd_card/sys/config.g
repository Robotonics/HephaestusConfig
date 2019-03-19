; Configuration file for Duet WiFi
; executed by the firmware on start-up

; General preferences
G90                                      ; Send absolute coordinates...
M83                                      ; ...but relative extruder moves

; Network
M550 P"Hephaestus"                       ; Set machine name
M551 P""                                 ; Set password
M552 S1                                  ; Enable network
M586 P0 S1                               ; Enable HTTP
M586 P1 S1                               ; Enable FTP
M586 P2 S0                               ; Disable Telnet
;M21 P0                                  ; Mount SD internal card

; Fake U Axis
M584 X0 Y1 Z2 E3 U3 P4                   ; Create U axis and assign to drive 3 (extruder)
                                         ; This is done to enable the external button to become a "stop extrude" button on the extruder
                                         ; Suggested as a workaround by dc42 (22 Dec 2018, 08:35) https://forum.duet3d.com/post/74169
M584 P3                                  ; This hides the U axis from the GUI, it needs to be unhidden later

; Drives
M98 P0:/sys/steppersettings.g

; Axis Limits
M208 X0 Y0 Z0 S1                         ; Set axis minima
M208 X190 Y175 Z288 S0                   ; Set axis maxima
; printer measurement to be done later

; Endstops
M574 X1 Y1 S3                            ; Set X and Y endstops controlled by motor load detection

; Z-Probe
M558 P0 H5 F120 T6000                    ; Disable Z probe but set dive height, probe speed and travel speed
M557 X15:195 Y15:195 S20                 ; Define mesh grid
; our printer has no Z-probe

; Bed Heater
M305 P0 T100000 B3950 R4700              ; Set thermistor + ADC parameters for heater 0
; Keenovo standard silicone heater pad, NTC 100K thermistor, Beta 25/50 3950K-1%
; Duet WiFi uses 4.7Kohm resistor for divider
M143 H0 S120                             ; Set temperature limit for heater 0
M307 A202.5 C368.4 D3.7 B0 S1.0 V24.2    ; Tuned parameters

; Nozzle Heater
M305 P1 X200                             ; Configure PT100 for heater 1
M143 H1 S300                             ; Set temperature limit for heater 1
M307 A350.4 C84.3 D2.0 B0 S1.0 V24.2     ; Tuned parameters

; Fans
M106 P0 S1 I0 F500 H-1                   ; Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off
M106 P0 S0                               ; Set fan 0 off
M106 P1 I-1                              ; disable fan 1, allow use as GPIO
M106 P2 I-1                              ; disable fan 2, allow use as GPIO

; Tools
M563 P0 D0 H1                            ; Define tool 0
G10 P0 X0 Y0 Z0                          ; Set tool 0 axis offsets
G10 P0 R0 S200                           ; Set initial tool 0 active and standby temperatures

; Volumetric Extrusion
;M200 D2.85                               ; Set filament diameter
; nozzle size needs to be set
; volumetric extrusion might not be supported yet

M18                                      ; Disable all stepper motors



; Automatic saving after power loss is not enabled

; Custom settings are not configured

; M501 not yet ysed
