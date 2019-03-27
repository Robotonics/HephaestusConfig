G91                         ; relative positioning

M98 P0:/sys/homingsteppersettings.g    ; slow down Z acceleration and jerk

G0 S0 Z-2 F100              ; move Z up to clear the shaft collar lock

G90                         ; absolute positioning

G0 S0 Z20 F3000             ; move Z up fast
G0 S0 Z15 F100              ; move Z up slow, prevents damage to glass

; this macro is called before:
;                           starting a print
;                           manual bed leveling
; so we need to leave an appropriate gap, not just go to zero
