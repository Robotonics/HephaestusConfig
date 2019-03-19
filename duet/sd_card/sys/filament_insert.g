;G0 X95 Y1                      ; if homed, move extruder to middle, best place for filament insertion
                               ; above line is disabled until we have automatic homing or home-if-not-homed

M18 X Y                        ; disables all stepper motors, allows for movement of extruder

T0

M98 P0:/sys/buttoncfg_red.g

M584 P4                        ; Unhides U axis
M564 H0 S0                     ; allow U axis to move freely
G91                            ; relative axis moves
M83                            ; relative extruder moves
M116 P0                        ; wait for temperature

M98 P0:/sys/buttoncfg_green.g

M574 U1 S0 C3                  ; Set E/U endstop controlled by limit switch, active low (wait for button press)
M291 P"Heating complete, insert filament against the gear and press the button when ready for insertion" R"Filament Insert" S1 T0

G0 S1 U9999 F1                 ; this is so slow that it's actually a "wait for button press"
M292 P0                        ; acknowledge message and continue
M574 U1 S1 C3                  ; Set E/U endstop controlled by limit switch, active high (wait for button release)
G0 S1 U9999 F1                 ; this is so slow that it's actually a "wait for button release"

M291 P"Press the button when new filament comes out of the nozzle" R"Filament Insert" S1 T0

G0 S1 U50 F400                 ; fast move

M574 U1 S0 C3                  ; Set E/U endstop controlled by limit switch, active low (wait for button press)
G0 S1 U9999 F50                ; slow purge user presses button
M292 P0                        ; acknowledge message and continue
M574 U1 S1 C3                  ; Set E/U endstop controlled by limit switch, active high (wait for button release)
G0 S1 U9999 F50                ; slow purge user releases button

M98 P0:/sys/buttoncfg_red.g

;G0 S0 U-5 F500                 ; fast retract until filament is in no-drip zone
G10                            ; use system configuration for retract

M98 P0:/sys/buttoncfg_off.g

M574 U0                        ; unassign endstop switch

T-1                            ; deselect tool, standby
;M106 S255                     ; fan on, cools faster

M564 H1 S1                     ; safety limit axis
                               ; all axis have powered off, will need to be re-homed anyways
M584 P3                        ; Hides U axis

G90                            ; absolute axis moves