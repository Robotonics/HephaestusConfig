M291 P"Preheat the bed? (to 60C)" R"Preheat" S3

M140 S60                                 ; Set bed active temperature

M291 P"The bed is now preheating (to 60C)" R"Preheat" S2

M291 P"Preheat the nozzle? (to 180C)" R"Preheat" S3

M104 S180 T0                             ; Set nozzle temperature
M106 P0 S1                               ; Set fan 0 on

M291 P"The nozzle is now preheating (to 180C)" R"Preheat" S0 T10