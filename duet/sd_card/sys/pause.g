; pause.g
; called when a print from SD card is paused
;

M581 T7 E0 S-1 C0            ; de-configure button trigger
M98 P0:/sys/buttoncfg_green.g

M98 P0:/sys/homingsteppersettings.g    ; slow down everything

M83            ; relative extruder moves
G1 E-3 F150    ; retract filament
G91            ; relative positioning
G1 Z5 F360     ; lift Z by 5mm
G90            ; absolute positioning
G1 X0 Y0 F6000 ; go to X=0 Y=0
M82            ; absolute extruder moves

M98 P0:/sys/stepperacceljerk.g    ; restore old settings

M581 T6 E0 S0 C0            ; configure button trigger for file 6 (resume)
