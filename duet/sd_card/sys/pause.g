; pause.g
; called when a print from SD card is paused
;

M98 P0:/sys/homingsteppersettings.g    ; slow down everything

M83            ; relative extruder moves
G1 E-10 F150   ; retract 10mm of filament
G91            ; relative positioning
G1 Z5 F360     ; lift Z by 5mm
G90            ; absolute positioning
G1 X0 Y0 F6000 ; go to X=0 Y=0
M82            ; absolute extruder moves

M98 P0:/sys/stepperacceljerk.g    ; restore old settings
