; slicer must be configured to call this macro

M581 T7 E0 S-1 C0 ; de-configure button trigger

M83            ; relative extruder moves

M107           ; fan off

G0 E-40 F500   ; advance filament through heatsink fast
               ; the end of the filament should be in the cold area but still gripped by the gear

;M104 S0       ; temperature off
T-1            ; deselect tool, standby temperature
M144 S0        ; bed standby

G28 Z          ; lowers the bed

M18            ; Disable all stepper motors
