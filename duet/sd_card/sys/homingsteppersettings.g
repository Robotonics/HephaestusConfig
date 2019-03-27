; this file slows down stepper settings so there's less back-EMF generated during acceleration
; for the purposes of making less false positive stall detections when the detection threshold is more sensitive

M566 X200.0 Y200.0 Z3.0        ; set jerk setting to something really low
M201 X500.0 Y500.0 Z5.0        ; set acceleration setting to something really low

M566 Z12.00
M201 Z20.00
