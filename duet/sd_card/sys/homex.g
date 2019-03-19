; homex.g
; called to home the X axis

M98 P0:/sys/homingsteppersettings.g    ; slow down everything so stall detection can be more sensitive

M915 X S3 F0 H200 R0  ; set stall detection threshold lower so it is more sensitive during homing

M564 H0 S0         ; allow movement even if not homed or outside of limits
G91                ; relative positioning
G1 Z10 F6000 S1    ; lift Z relative to current position, unless limit switch is already triggered
G1 S1 X10 F3500    ; move a bit away to give time to accelerate
G1 S1 X-250 F3500  ; move quickly to axis endstop and stop there
;G1 S1 X1 F500      ; move slowly away from endstop +1mm, prevents rubbing against endstop
G1 Z-10 F6000 S1   ; lower Z again

M98 P0:/sys/stepperacceljerk.g    ; restore old settings

;M915 X S3 F0 H200 R3  ; set stall detection threshold higher so it is less sensitive during normal printing
G90                    ; absolute positioning
G92 X0                 ; set position to axis minimum
;G92 X1                 ; set position to axis minimum +1mm

M564 H1 S1             ; disallow movement even if not homed or outside of limits