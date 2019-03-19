; homey.g
; called to home the Y axis

M98 P0:/sys/homingsteppersettings.g    ; slow down everything so stall detection can be more sensitive

M915 Y S3 F0 H200 R0  ; set stall detection threshold lower so it is more sensitive during homing

M564 H0 S0         ; allow movement even if not homed or outside of limits
G91                ; relative positioning
;G1 Z10 F6000 S1    ; lift Z relative to current position, unless limit switch is already triggered
G1 S1 Y10 F3500    ; move a bit away to give time to accelerate
G1 S1 Y-250 F3500  ; move quickly to axis endstop and stop there
;G1 S1 Y1 F500      ; move slowly away from endstop +1mm, prevents rubbing against endstop
;G1 Z-10 F6000 S1   ; lower Z again

; warning: Z dive will cause RRF to think Z is homed if the limit switch is depressed, which is an incorrect assumption
; we do not need Z dive on this printer, at least until failure-recovery is implemented
; when failure-recovery is implemented, Z dive can be done from the resume.g file

M98 P0:/sys/stepperacceljerk.g    ; restore old settings

;M915 Y S3 F0 H200 R3  ; set stall detection threshold higher so it is less sensitive during normal printing
G90                    ; absolute positioning
G92 Y0                 ; set position to axis minimum
;G92 Y1                 ; set position to axis minimum +1mm

M564 H1 S1             ; disallow movement even if not homed or outside of limits