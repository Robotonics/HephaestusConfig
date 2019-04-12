; slicer must be configured to call this macro

T0 P4        ; select tool, which starts the heaters, forces execution of tpost0 (which calls M703)
;M703        ; loads last used filament config

M106         ; fan on, no point, but checks if fan is working, may reduce heater overshoot

M116 S10     ; wait for temperature

G28 X Y      ; home
G0 X1 Y1     ; move to corner

G28 Z        ; home

M98 P0:/macros/bed_raise.g

M98 P0:/sys/stepperacceljerk.g    ; restore fast Z

M83 ; relative extruder moves

M116 S5         ; wait for temperature

M107            ; fan off

G0 E15 F150     ; advance filament through heatsink fast
G0 E15 F100     ; purge filament slow

;G10             ; retract

G0 X2 Y20 Z0 F3000      ; move out of the way of the blob
;G0 Z0 F100              ; touch the glass to cut off the strand of filament

; Cura generates a G10 retraction anyways
; Cura will choose extruder relative/absolute mode

M581 T6 E0 S-1 C0           ; de-configure button trigger
M581 T7 E0 S0 C0            ; configure button trigger for file 7

M82 ; absolute extrusion mode, expected by Cura
