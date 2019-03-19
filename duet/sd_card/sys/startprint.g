; slicer must be configured to call this macro

T0

M116 ; wait for temperature

G28 X Y  ; home
G0 X1 Y1 ; move to corner

;G28 Z ; home
M98 P0:/macros/raisebed.g

M83 ; relative extruder moves

M116 ; wait for temperature

G0 E40 F500 ; advance filament through heatsink fast
G0 E40 F300 ; purge filament slow

;G10         ; retract

G0 X10 Y10 F3000 ; move out of the way of the blob
G0 Z0 F100       ; touch the glass to cut off the strand of filament

; Cura generates a G10 retraction anyways
; Cura will choose extruder relative/absolute mode

M581 T7 E0 S0 C0            ; configure button trigger for file 7