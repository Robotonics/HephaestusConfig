; slicer must be configured to call this macro

G91                     ; relative positioning
M83                     ; relative extruder moves
M574 Z2 S0 C2           ; setup limit switch for Z
G1 S2 Z10 E-1.5 F6000   ; dive bed down
G0 E-1.5 F150           ; retract
                        ; the end of the filament should be in the cold area but still gripped by the gear

;M107           ; fan off

M581 T6 E0 S-1 C0 ; de-configure button trigger
M581 T7 E0 S-1 C0 ; de-configure button trigger
M98 P0:/sys/buttoncfg_off.g

;M104 S0       ; temperature off
T-1            ; deselect tool, standby temperature
M106 S1        ; fan on
M144 S0        ; bed standby

G28 Z          ; lowers the bed

M18            ; Disable all stepper motors
G90            ; absolute positioning, system default
