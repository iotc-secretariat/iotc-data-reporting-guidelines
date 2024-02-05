print("Configuring database connections...")

# Connection to Master database
C_MASTER =
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

print("Database connections configured!")