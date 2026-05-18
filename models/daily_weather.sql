WITH daily_weather as (
select 
    DATE(time) as daily_weather,
    weather,
    pressure,
    temp,
    humidity,
    cloud
from {{ source('demo', 'weather') }}
),

daily_weather_agg as (
select 
daily_weather,
row_number() over (partition by daily_weather order by count(weather) desc) as daily_weather_count,
weather
from daily_weather 
group by daily_weather,weather
qualify row_number() over (partition by daily_weather order by count(weather) desc) = 1
)

select
* from daily_weather_agg