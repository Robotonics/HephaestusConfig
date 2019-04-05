M566 X400.00 Y700.00                     ; Set maximum instantaneous speed changes (mm/min)
M201 X1500.00 Y2000.00                   ; Set accelerations (mm/s^2)
; default for reprap was 500
; default for Ultimaker 2 is 3000, maximum limit 9000

; slow settings for Z, as reference
;M566 Z12.00                              ; Set maximum instantaneous speed changes (mm/min)
;M201 Z20.00                              ; Set accelerations (mm/s^2)

; fast settings for Z
M566 Z900.00                              ; Set maximum instantaneous speed changes (mm/min)
M201 Z3000.00                              ; Set accelerations (mm/s^2)
