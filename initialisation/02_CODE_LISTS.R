print("Extracting code lists...")


# SPECIES ####

## Primary species ####

### English ####
PRIMARY_SPECIES <- query(C_REFERENCE_DATA, "SELECT code AS SPECIES_CODE, name_en AS SPECIES, name_scientific AS SPECIES_SCIENTIFIC, species_category_code FROM refs_biology.v_species_iotc WHERE is_aggregate = 0 ORDER BY 1") %>% setNames(toupper(names(.)))

PRIMARY_SPECIES[, SPECIES_CODE := factor(SPECIES_CODE)]

### French ####
ESPECES_PRIMAIRES <- query(C_REFERENCE_DATA, "SELECT code AS CODE_ESPECE, name_fr AS ESPECE, name_scientific AS ESPECE_SCIENTIFIQUE, species_category_code FROM refs_biology.V_SPECIES_IOTC WHERE is_aggregate = 0 ORDER BY 1") %>% setNames(toupper(names(.)))

ESPECES_PRIMAIRES[, CODE_ESPECE := factor(CODE_ESPECE)]

## Other species ####

### English ####
OTHER_SPECIES <- fread("../inputs/data/OTHER_SPECIES_GG_RES1501.csv")[, .(GEAR_GROUP, SPECIES_CATEGORY_CODE, SPECIES_CODE, SPECIES = NAME_EN, SPECIES_SCIENTIFIC, IS_AGGREGATE)]

### French ####
ESPECES_AUTRES <- fread("../inputs/data/OTHER_SPECIES_GG_RES1501.csv", encoding = "UTF-8")[, .(GROUPE_ENGINS = GEAR_GROUP_FR, CODE_CATEGORIE_ESPECE = SPECIES_CATEGORY_CODE, CODE_ESPECE = SPECIES_CODE, ESPECE = NAME_FR, ESPECE_SCIENTIFIQUE = SPECIES_SCIENTIFIC)]

## ETP species #####

### English ####
ETP_SPECIES <- query(C_REFERENCE_DATA, "SELECT species_category_code, species_order AS order, code AS species_code, name_en AS species, name_scientific AS species_scientific FROM refs_biology.v_species WHERE (is_aggregate = 0 AND ((code LIKE 'RHN') OR (species_category_code IN ('TURTLES', 'CETACEANS', 'SEABIRDS'))))") %>% setNames(toupper(names(.)))

#ETP_SPECIES[, species_category_code := str_to_title(tolower(SPECIES_CATEGORY_CODE))]

### French ####
ESPECES_ETP <- query(C_REFERENCE_DATA, "SELECT species_category_code, species_order AS ordre, code AS species_code, name_fr AS espece, name_scientific AS species_scientific FROM refs_biology.v_species WHERE (is_aggregate = 0 AND ((code LIKE 'RHN') OR (species_category_code IN ('TURTLES', 'CETACEANS', 'SEABIRDS'))))") %>% setNames(toupper(names(.)))

#ESPECES_ETP[, CODE_CATEGORIE_ESPECES := str_to_title(tolower(CODE_CATEGORIE_ESPECES))]
