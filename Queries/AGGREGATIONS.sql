/* Looking for NULL data in the “rideable_type” and “member_casual” columns to make sure the proper number of observations are present */

DELETE FROM public.all_trips 
WHERE COALESCE (rideable_type, member_casual) IS NULL;

/* Final Aggregations saved into a new dataframe labaled as 
"all_trips_v2"*/

SELECT x.*
	INTO all_trips_v2
FROM 
(
	SELECT
		*,
		/* Add a "ride_length" calculation to all_trips (in seconds) */
		EXTRACT(EPOCH FROM(ended_at - started_at)) AS ride_length,
		/* Extract a "day_of_week" for all trips */
		EXTRACT(dow FROM ended_at) AS day_of_week
	FROM public.all_trips
) x;

/* Delete inconsistent data from the new data frame */
DELETE FROM public.all_trips_v2
WHERE rideable_type = 'docked_bike' OR ride_length < 0;

/* Previews the new data frame to verify the las changes */
SELECT * 
FROM public.all_trips_v2
ORDER BY ride_length ASC;
