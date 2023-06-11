/* Determine the "number_of_rides", the "average_duration" 
(in seconds and minutes) per user type and the maximum ride 
length (in minutes) for each user type*/
SELECT 
	member_casual,
	COUNT(member_casual) AS number_of_rides,
	ROUND(AVG(ride_length), 2) AS average_duration_sec,
	ROUND(AVG(ride_length)/60, 2) AS average_duration_min,
	ROUND(MAX(ride_length)/60, 2) AS max_ride_length_minutes
FROM 
	public.all_trips_v2
GROUP BY 
	all_trips_v2.member_casual
	
/* Determine the "number_of_rides", the "average_duration" 
(in seconds and minutes) per rideable type of each user type 
and also the maximum ride length (in minutes) for each one*/
SELECT 
	member_casual,
	rideable_type,
	COUNT(member_casual) AS number_of_rides,
	ROUND(AVG(ride_length), 2) AS average_duration_sec,
	ROUND(AVG(ride_length)/60, 2) AS average_duration_min,
	ROUND(MAX(ride_length)/60, 2) AS max_ride_length_minutes
FROM 
	public.all_trips_v2
GROUP BY 
	all_trips_v2.member_casual,
	all_trips_v2.rideable_type
	
/* Determine the "average_duration" by day for each rideable type 
per each user type */
SELECT 
	member_casual,
	rideable_type,
	ROUND(AVG(CASE WHEN day_of_week = 0 THEN ride_length ELSE NULL END)/60, 2) AS avg_sundays,
	ROUND(AVG(CASE WHEN day_of_week = 1 THEN ride_length ELSE NULL END)/60, 2) AS avg_mondays,
	ROUND(AVG(CASE WHEN day_of_week = 2 THEN ride_length ELSE NULL END)/60, 2) AS avg_tuesdays,
	ROUND(AVG(CASE WHEN day_of_week = 3 THEN ride_length ELSE NULL END)/60, 2) AS avg_wednesdays,
	ROUND(AVG(CASE WHEN day_of_week = 4 THEN ride_length ELSE NULL END)/60, 2) AS avg_thursday,
	ROUND(AVG(CASE WHEN day_of_week = 5 THEN ride_length ELSE NULL END)/60, 2) AS avg_fridays,
	ROUND(AVG(CASE WHEN day_of_week = 6 THEN ride_length ELSE NULL END)/60, 2) AS avg_saturdays
FROM 
	public.all_trips_v2
GROUP BY 
	all_trips_v2.member_casual,
	all_trips_v2.rideable_type

/* Summarise the "number_of_rides" by day for each rideable type 
per each user type, also determine the mode day in the service
usage for each group*/
SELECT 
	member_casual,
	rideable_type,
	COUNT(member_casual) AS number_of_rides,
	COUNT(CASE WHEN day_of_week = 0 THEN 1 END) AS sundays,
	COUNT(CASE WHEN day_of_week = 1 THEN 1 END) AS mondays,
	COUNT(CASE WHEN day_of_week = 2 THEN 1 END) AS tuesdays,
	COUNT(CASE WHEN day_of_week = 3 THEN 1 END) AS wednesdays,
	COUNT(CASE WHEN day_of_week = 4 THEN 1 END) AS thursdays,
	COUNT(CASE WHEN day_of_week = 5 THEN 1 END) AS fridays,
	COUNT(CASE WHEN day_of_week = 6 THEN 1 END) AS saturdays,
	mode() WITHIN GROUP (ORDER BY day_of_week) AS modal_day
FROM 
	public.all_trips_v2
GROUP BY 
	all_trips_v2.member_casual,
	all_trips_v2.rideable_type
	
	
/* Master query, includes everything I got from the analysis
just into ONE dataframe */
SELECT 
	member_casual,
	rideable_type,
	COUNT(member_casual) AS number_of_rides,
	ROUND(AVG(ride_length), 2) AS average_duration_sec,
	ROUND(AVG(ride_length)/60, 2) AS average_duration_min,
	ROUND(MAX(ride_length)/60, 2) AS max_ride_length_minutes,
	ROUND(AVG(CASE WHEN day_of_week = 0 THEN ride_length ELSE NULL END)/60, 2) AS avg_sundays,
	ROUND(AVG(CASE WHEN day_of_week = 1 THEN ride_length ELSE NULL END)/60, 2) AS avg_mondays,
	ROUND(AVG(CASE WHEN day_of_week = 2 THEN ride_length ELSE NULL END)/60, 2) AS avg_tuesdays,
	ROUND(AVG(CASE WHEN day_of_week = 3 THEN ride_length ELSE NULL END)/60, 2) AS avg_wednesdays,
	ROUND(AVG(CASE WHEN day_of_week = 4 THEN ride_length ELSE NULL END)/60, 2) AS avg_thursday,
	ROUND(AVG(CASE WHEN day_of_week = 5 THEN ride_length ELSE NULL END)/60, 2) AS avg_fridays,
	ROUND(AVG(CASE WHEN day_of_week = 6 THEN ride_length ELSE NULL END)/60, 2) AS avg_saturdays,
	COUNT(CASE WHEN day_of_week = 0 THEN 1 END) AS rides_sundays,
	COUNT(CASE WHEN day_of_week = 1 THEN 1 END) AS rides_mondays,
	COUNT(CASE WHEN day_of_week = 2 THEN 1 END) AS rides_tuesdays,
	COUNT(CASE WHEN day_of_week = 3 THEN 1 END) AS rides_wednesdays,
	COUNT(CASE WHEN day_of_week = 4 THEN 1 END) AS rides_thursdays,
	COUNT(CASE WHEN day_of_week = 5 THEN 1 END) AS rides_fridays,
	COUNT(CASE WHEN day_of_week = 6 THEN 1 END) AS rides_saturdays,
	mode() WITHIN GROUP (ORDER BY day_of_week) AS modal_day
FROM 
	public.all_trips_v2
GROUP BY 
	all_trips_v2.member_casual,
	all_trips_v2.rideable_type