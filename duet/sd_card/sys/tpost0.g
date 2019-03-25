; tpost0.g
; called after tool 0 has been selected

;M116 P0       ; Wait for set temperatures to be reached
               ; The wait is disabled because our printer only has one tool, the other gcode files will do the waiting
               ; This is mainly because it is unclear when this file is going to be called, and it might unintentionally block other stuff

M703          ; Recall configuration for last used filament
