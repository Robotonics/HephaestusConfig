; this file is called when you press the bed level button on PanelDue

M291 P"Do you want to perform manual bed leveling?" R"Bed Leveling" S3

M98 P0:/sys/bed_manual_level.g
