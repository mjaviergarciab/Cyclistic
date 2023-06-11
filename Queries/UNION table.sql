/* Query used to COMBINE all the dataframes into a single one using 
"UNION ALL" */

SELECT x.*
	INTO all_trips
FROM 
(
	SELECT 
        *
    FROM
        "202004-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202005-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202006-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202007-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202008-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202009-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202010-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202011-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202012-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202101-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202102-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202103-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202104-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202105-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202106-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202107-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202108-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202109-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202110-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202111-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202112-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202201-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202202-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202203-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202204-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202205-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202206-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202207-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202208-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202209-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202210-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202211-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202212-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202301-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202302-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202303-divvy-tripdata"
UNION ALL
    SELECT
        *
    FROM
        "202304-divvy-tripdata"
) x;

SELECT * FROM public.all_trips