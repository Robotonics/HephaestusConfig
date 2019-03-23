; homeall.g
; called to home all axes

M564 H0 S0            ; allow movement even if not homed or outside of limits
G91                   ; relative positioning

M574 Z2 S0 C2         ; setup limit switch for Z

G1 S1 Z500 F8000      ; move Z up (bed down), fast, until the limit switch is triggered

M574 Z2 S1 C2         ; disable limit switch for Z

G1 S2 Z6 F600         ; move Z up (bed down), slow, until the physical stop is reached
; jam it up a bit more
; this way we know that raising the bed always starts at a full step
G1 S2 Z1 F300         ; move Z up (bed down), slow, until the physical stop is reached
; this should make sure both leadscrews are in sync

M574 Z0 S1 C2         ; completely disable limit switch for Z

M98 P0:/sys/homingsteppersettings.g    ; slow down everything so stall detection can be more sensitive

M915 X S3 F0 H200 R0  ; set stall detection threshold lower so it is more sensitive during homing

G1 S1 X10 Y10 F3500   ; move a bit away to give time to accelerate

G1 S1 X-250 F3500     ; move quickly to axis endstop and stop there
G1 S2 X1 F500         ; move slowly away from endstop +1mm, prevents rubbing against endstop
G1 S1 Y-250 F3500     ; move quickly to axis endstop and stop there
G1 S2 Y1 F500         ; move slowly away from endstop +1mm, prevents rubbing against endstop

M98 P0:/sys/stepperacceljerk.g    ; restore old settings

M915 X S60 F0 H200 R3             ; set stall detection threshold higher so it is less sensitive during normal printing

G90                   ; absolute positioning
G92 X1 Y1 Z288 U0     ; set positions to axis limit (you may want to adjust this)
M564 H1 S1            ; disallow movement even if not homed or outside of limits
