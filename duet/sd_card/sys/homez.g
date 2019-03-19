; homez.g
; called to home the Z axis

; this should make sure both leadscrews are in sync

M564 H0 S0            ; allow movement even if not homed or outside of limits
G91                   ; relative positioning

M98 P0:/sys/z_mode_smooth.g ; use the smooth setting for quiet

M906 Z800.00 I30      ; Set motor current to be powerful for fast move
G1 S1 Z500 F8000      ; move Z up (bed down), fast, until the limit switch is triggered

M906 Z600.00 I30      ; Set motor current to be powerful for quiet
G1 S0 Z6 F600         ; move Z up (bed down), slow, until the physical stop is reached

; turn off microstepping for a second, jam it up a bit more
; this way we know that raising the bed always starts at a full step
M98 P0:/sys/z_mode_rough.g
G1 S0 Z1 F300      ; move Z up (bed down), slow, until the physical stop is reached

; this should make sure both leadscrews are in sync

M98 P0:/sys/z_mode_smooth.g ; use the smooth setting for quiet

G90                   ; absolute positioning
G92 Z288              ; set Z position to axis limit (you may want to adjust this)
M564 H1 S1            ; disallow movement even if not homed or outside of limits