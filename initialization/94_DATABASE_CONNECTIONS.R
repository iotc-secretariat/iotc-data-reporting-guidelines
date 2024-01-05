# Connections

print("Initializing database connections...")

IOTDB_connection          = iotc.core.db.connections::DB_IOTDB()

IOTCSTATISTICS_connection = iotc.core.db.connections::DB_IOTCSTATISTICS()

IOTCVESSELS_connection    = iotc.core.db.connections::DB_RAV()

ROS_connection            = iotc.core.db.connections::DB_ROS_ANALYSIS()

BU_DATA_connection        = iotc.core.db.connections::DB_BUOYS()

print("Database connections initialized!")