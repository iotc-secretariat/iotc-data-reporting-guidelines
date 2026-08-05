print("Configuring database connections...")

# Connection to Master database
C_MASTER <-
  DBI::dbConnect(
    drv      = odbc::odbc(),
    Driver   = "SQL Server",
    Server   = Sys.getenv("DEFAULT_IOTC_LIBS_DB_SERVER"),
    Database = "IOTC_master",
    UID      = Sys.getenv("DEFAULT_IOTC_LIBS_DB_USER"),
    PWD      = Sys.getenv("DEFAULT_IOTC_LIBS_DB_PASSWORD"),
    encoding = "CP1252",
    clientcharset = "UTF-8"
  )


# Connection to IOTCReferenceData
C_REFERENCE_DATA <- 
DBI::dbConnect(drv = RPostgres::Postgres(),
               host = Sys.getenv("IOTC_DATA_DB_SERVER"),
               port = Sys.getenv("IOTC_DATA_DB_PORT"),
               dbname = Sys.getenv("IOTC_REFERENCE_DATA_DB_NAME"),
               user = Sys.getenv("IOTC_REFERENCE_DATA_DB_USER"),
               password = Sys.getenv("IOTC_REFERENCE_DATA_DB_PASSWORD")
)

print("Database connections configured!")

