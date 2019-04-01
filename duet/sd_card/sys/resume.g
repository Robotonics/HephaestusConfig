; resume.g
; called before a print from SD card is resumed
;
; generated by RepRapFirmware Configuration Tool v2 on Fri Mar 01 2019 21:07:10 GMT-0800 (Pacific Standard Time)

M581 T6 E0 S-1 C0            ; de-configure button trigger

M98 P0:/sys/homingsteppersettings.g    ; slow down everything

G1 R1 X0 Y0 Z5 F6000 ; go to 5mm above position of the last print move
G1 R1 X0 Y0          ; go back to the last print move
M83                  ; relative extruder moves
G1 E3 F150           ; unretract filament, match the pause script
M82                  ; absolute extruder moves

M98 P0:/sys/stepperacceljerk.g    ; restore old settings

M98 P0:/sys/buttoncfg_off.g
M581 T7 E0 S0 C0            ; configure button trigger for file 7
