; homeall.g
; called to home all axes

G28 Z ; there's no point in not using the homez.g file

M98 P0:/sys/homingsteppersettings.g    ; slow down everything so stall detection can be more sensitive

M915 X Y S3 F0 H200 R0  ; set stall detection threshold lower so it is more sensitive during homing

M564 H0 S0              ; allow movement even if not homed or outside of limits
G91                     ; relative positioning
G1 S1 X10 Y10 F5000     ; move a bit away to give time to accelerate
;G1 S1 X-250 Y-250 F5000 ; move quickly to X and Y axis endstops and stop there
G1 S1 Y-250 F5000 ; move quickly to X and Y axis endstops and stop there
G1 S0 Y10
G1 S1 X-250 F5000 ; move quickly to X and Y axis endstops and stop there
;G1 S1 X1 Y1 F500        ; move slowly away from endstop +1mm, prevents rubbing against endstop

M98 P0:/sys/stepperacceljerk.g    ; restore old settings

;M915 X Y S3 F0 H200 R3  ; set stall detection threshold higher so it is less sensitive during normal printing

G90                     ; absolute positioning

G92 X0 Y10                 ; set position to axis minimum
;G92 X1 Y1                 ; set position to axis minimum +1mm

M564 H1 S1              ; disallow movement even if not homed or outside of limits