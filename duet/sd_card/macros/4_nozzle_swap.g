G28 Z                          ; lower bed to give more room for wrench

M98 P0:/sys/filament_extract.g ; remove filament first

T0                             ; select tool and wait for heat
M116 P0                        ; wait for temperature

M581 T8 E0 S0 C0               ; configure button trigger for file 8
M98 P0:/sys/buttoncfg_green.g
M291 P"Nozzle is now hot. Swap the nozzle, then press the button, which will start filament insertion." R"Nozzle Swap" S2
M98 P0:/sys/buttoncfg_off.g
M581 T8 E0 S-1 C0              ; de-configure button trigger

M98 P0:/sys/filament_insert.g