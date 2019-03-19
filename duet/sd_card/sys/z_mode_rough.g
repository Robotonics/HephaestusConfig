; use this file when printing with layer heights in multiples of 0.04mm

M350 Z1 I1                              ; Configure no microstepping (interpolation cannot be enabled)
M92 Z25.00                              ; Set steps per mm
; 40 um per full step
; 1000/40 = 25
