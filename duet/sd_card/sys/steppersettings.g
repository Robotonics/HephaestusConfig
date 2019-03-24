M569 P0 S0                               ; Drive 0 (X) goes backwards
M569 P1 S0                               ; Drive 1 (Y) goes backwards
M569 P2 S0                               ; Drive 2 (Z) goes backwards
M569 P3 S0                               ; Drive 3 (E) goes backwards

M350 X16 Y16 I1                          ; Configure microstepping with interpolation
M350 Z16 I1                              ; Configure microstepping with interpolation
;M350 E1 I1                               ; Configure microstepping with interpolation
;M350 U1 I1                               ; Configure microstepping with interpolation
M350 E16 I1                              ; Configure microstepping with interpolation
M350 U16 I1                              ; Configure microstepping with interpolation

M92 X80.00 Y80.00                        ; Set steps per mm
; 2mm belt pitch
; 20 teeth pulley
; 1 full rotation, 200 steps = 40mm travel
; 1 full step = 0.2mm of travel
; 5 full steps per mm
; 1/16 microstepping
; 5 * 16 = 80

M92 Z400.00                              ; Set steps per mm
; 40 um per full step
; 1000/40 = 25
; 25 * 16 = 400

; digging through Prusa i3 MK3 release firmware files
; 280 steps/mm with 1/32 microstepping (also see 560 steps/mm with 1/64 microstepping)
; rough estimate of gear diameter is between 7 and 8mm (Bondtech says their mini gears have estep = 140m, unknown microstepping, unknown deg/step)
; 280 / 32 = 8.75 full steps per mm, 200/8.75 = 22.86mm circumference of gear, meaning 7.28 effective gear diameter
; our worm gear drive has a 40x gear reduction
; disable microstepping
; 8.75 * 40 = 350
;M92 E350.00                              ; Set steps per mm
;M92 U350.00                              ; Set steps per mm
M92 E5600.00                             ; Set steps per mm (with microstepping)
M92 U5600.00                             ; Set steps per mm (with microstepping)

; acceleration and jerk for X and Y are set in the following macro
M98 P0:/sys/stepperacceljerk.g

M566 Z12.00                              ; Set maximum instantaneous speed changes (mm/min)
M566 E120.00                             ; Set maximum instantaneous speed changes (mm/min)
M566 U120.00                             ; Set maximum instantaneous speed changes (mm/min)

M203 X30000.00 Y30000.00                 ; Set maximum speeds (mm/min)
M203 Z1000.00                            ; Set maximum speeds (mm/min)
M203 E800.00                             ; Set maximum speeds (mm/min)
M203 U800.00 I15.00                      ; Set maximum speeds (mm/min), and minimum

M201 Z20.00                              ; Set accelerations (mm/s^2)
M201 E250.00                             ; Set accelerations (mm/s^2)
M201 U250.00                             ; Set accelerations (mm/s^2)

M906 X1600.00 Y1600.00 I30               ; Set motor currents (mA) and motor idle factor in percent
M906 Z800.00 I30                         ; Set motor currents (mA) and motor idle factor in percent
M906 E1800.00 I30                        ; Set motor currents (mA) and motor idle factor in percent
M906 U1800.00 I30                        ; Set motor currents (mA) and motor idle factor in percent

M84 S30                                  ; Set idle timeout
