with TRIPS as (
    select
    ride_id,
    rideable_type,
    date(to_timestamp(started_at)) as trip_ride,
    start_statio_id as station_id,
    end_station_id,
    MEMBER_CSUAL as Member_casual,
    timestampdiff(second, to_timestamp(started_at), to_timestamp(ended_at)) as trip_duration
 
    from {{ source('demo', 'bike') }}
    where ride_id != 'ride_id'
    limit 10

)

select * from TRIPS