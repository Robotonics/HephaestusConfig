G91                         ; relative positioning

M564 H0 S0              ; allow movement even if not homed or outside of limits
                        ; changing between microstep settings will invalidate homing
                        ; but our printer guarantees that we are always in a full step

M98 P0:/sys/z_mode_rough.g

G0 S0 Z-2 F100              ; move Z up to clear the shaft collar lock without microstepping
; this is loud because the microstepping is at 1x, so we keep the distance short

M98 P0:/sys/z_mode_smooth.g ; less noise for long moves

G90                         ; absolute positioning

G0 S0 Z20 F3000             ; move Z up fast
M98 P0:/sys/z_mode_rough.g  ; use full steps
G0 S0 Z15 F100              ; move Z up slow, prevents damage to glass

; this macro is called before:
;                           starting a print
;                           manual bed leveling
; so we need to leave an appropriate gap, not just go to zero

M564 H1 S1              ; disallow movement even if not homed or outside of limits

M98 P0:/sys/z_mode_smooth.g

G92 Z15                 ; setting the position makes the position valid