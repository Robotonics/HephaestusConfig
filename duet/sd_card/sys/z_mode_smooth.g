; use this file when printing with layer heights that need to be smooth (vase prints)

M350 Z16 I1                              ; Configure microstepping with interpolation
M92 Z400.00                              ; Set steps per mm
; 40 um per full step
; 1000/40 = 25
; 25 * 16 = 400
