M140 S70                                 ; Set bed temperature
G10 P0 R0 S280                           ; Set initial tool 0 active and standby temperatures
M207 S0.5 F600 T400 Z0                   ; Set retraction settings
M221 S100                                ; Set extrusion factor