/* Query that creates an empty table but with the necessary column's headers in SQL */

CREATE TABLE "202304-divvy-tripdata" (
  	ride_id VARCHAR(50),
	rideable_type VARCHAR(50),
	started_at TIMESTAMP,
	ended_at TIMESTAMP,
	start_station_name VARCHAR(150),
	start_station_id VARCHAR(50),
	end_station_name VARCHAR(150),
	end_station_id VARCHAR(50),
	start_lat FLOAT,
	start_lng FLOAT,
	end_lat FLOAT,
	end_lng	FLOAT,
	member_casual VARCHAR(50),
  PRIMARY KEY (ride_id)
);

/* Query that imports the CSV content into the new SQL dataframe */

COPY "202304-divvy-tripdata"(ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
)
FROM 'D:\JavviGabba\Documents\Data Analytics\Cyclistic\Data\202304-divvy-tripdata.csv'
DELIMITER ','
CSV HEADER;

/* This Query showcases the firts 1000 rows of the data frame in order to verify the import */

SELECT * FROM "202304-divvy-tripdata"