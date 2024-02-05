
# SPECIES ####

## Primary species ####
PRIMARY_SPECIES = query(C_MASTER, "SELECT CODE, NAME_EN, NAME_SCIENTIFIC FROM refs_biological.V_SPECIES_IOTC WHERE IS_AGGREGATE = 0 ORDER BY 1")

## Other species ####
OTHER_SPECIES = query(C_MASTER, "SELECT CODE, NAME_EN, NAME_SCIENTIFIC FROM refs_biological.V_SPECIES WHERE CODE IN ('SMA', 'LMA', 'SPK', 'SPL', 'SPZ', 'PTH', 'BTH', 'ALV', 'BSH', 'FAL', 'OCS', 'POR', 'TIG', 'PSK', 'WSH', 'RMA', 'RMB', 'RME')")
  
## Turtles ####
# ETP_SPECIES = 



