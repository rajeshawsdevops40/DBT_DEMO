WITH CTE AS (

SELECT
to_timestamp(started_at) as started_at,
DATE(to_timestamp(started_at)) as started_at_time,

case 
when DAYNAME(to_timestamp(started_at))  in ('sun','sat') then 'Weekend'
else 'Business Days'
END as DAY_TYPE,

case
when MONTH(to_timestamp(started_at)) in (12,1,2) then 'Winter'
else 'Summer'
end as Month_type

FROM {{ source('demo', 'bike') }}
where started_at != 'started_at'
)

SELECT
*
from CTE