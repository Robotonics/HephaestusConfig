G28 X Y                     ; home X and Y since we are moving to corner anyways

M98 P0:/macros/raisebed.g

M581 T8 E0 S0 C0            ; configure button trigger for file 8

G90                         ; absolute positioning

G0 Z2 F100
G0 X1 Y1 F3000
G0 Z0 F100

M98 P0:/sys/buttoncfg_green.g
M291 P"Adjust bed level knob on the front left corner, press OK button to continue" R"Bed Leveling" S2
M98 P0:/sys/buttoncfg_off.g

G0 Z2 F100
G0 X189 Y1 F3000
G0 Z0 F100

M98 P0:/sys/buttoncfg_green.g
M291 P"Adjust bed level knob on the front right corner, press OK button to continue" R"Bed Leveling" S2
M98 P0:/sys/buttoncfg_off.g

G0 Z2 F100
G0 X95 Y169 F3000
G0 Z0 F100

M98 P0:/sys/buttoncfg_green.g
M291 P"Adjust bed level knob in the rear center, press OK button to continue" R"Bed Leveling" S2
M98 P0:/sys/buttoncfg_off.g

G0 Z2 F100
G0 X95 Y85 F3000
G0 Z0.2 F100

M98 P0:/sys/buttoncfg_green.g
M291 P"Check for a 0.2mm gap under the nozzle, press OK button to finish (and home all axis)" R"Bed Leveling" S2
M98 P0:/sys/buttoncfg_off.g

M581 T8 E0 S-1 C0            ; de-configure button trigger

G28 Z                        ; home Z to lower bed

G0 X1 Y1 F3000