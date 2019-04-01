;G0 X90 Y1                      ; if homed, move extruder to middle, best place for filament insertion
                               ; above line is disabled until we have automatic homing or home-if-not-homed

M18 X Y                        ; disables all stepper motors, allows for movement of extruder

T0

M98 P0:/sys/buttoncfg_red.g

M107                           ; fan off
M584 P4                        ; Unhides U axis
M564 H0 S0                     ; allow U axis to move freely
G91                            ; relative axis moves
M83                            ; relative extruder moves
M116 P0                        ; wait for temperature

M98 P0:/sys/buttoncfg_green.g

M574 U1 S0 C3                  ; Set E/U endstop controlled by limit switch, active low
M291 P"Press the button to stop the extraction" R"Filament Extract" S1 T0

                               ; with my extruder design, the user does not have to be present for filament extraction to keep the spool neat
                               ; (unlike Ultimaker, on which the filament will pop out and could possibly tangle on the spool)

G0 S1 U-9999 F300              ; extract until user presses button
                               ; keep in mind that we might be assisting in clearing a jam, so never stop spinning until the user says so

M574 U0                        ; unassign endstop switch

M292 P0                        ; acknowledge message and continue
M98 P0:/sys/buttoncfg_red.g    ; make LED red because the printer is hot and empty
M106 S255                      ; fan on, a bit more safety while printer hot and empty

; leave heater on for insertion

M564 H1 S1                     ; safety limit axis
                               ; all axis have powered off, will need to be re-homed anyways
M584 P3                        ; Hides U axis

G90                            ; absolute axis moves

; this macro may be called by the nozzle swap macro
; do not home the X and Y