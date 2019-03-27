; homez.g
; called to home the Z axis

; this should make sure both leadscrews are in sync

M564 H0 S0            ; allow movement even if not homed or outside of limits
G91                   ; relative positioning

; slow down acceleration and jerk
M566 Z12.00
M201 Z20.00

M574 Z2 S0 C2         ; setup limit switch for Z

G1 S1 Z500 F8000      ; move Z up (bed down), fast, until the limit switch is triggered

M574 Z2 S1 C2         ; disable limit switch for Z

G1 S2 Z6 F600         ; move Z up (bed down), slow, until the physical stop is reached
; jam it up a bit more
; this way we know that raising the bed always starts at a full step
G1 S2 Z1 F300         ; move Z up (bed down), slow, until the physical stop is reached
; this should make sure both leadscrews are in sync

M574 Z0 S1 C2         ; completely disable limit switch for Z

G90                   ; absolute positioning
G92 Z288              ; set Z position to axis limit (you may want to adjust this)
M564 H1 S1            ; disallow movement even if not homed or outside of limits