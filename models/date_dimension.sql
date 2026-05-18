WITH CTE AS (
SELECT

{{timestamp('started_at')}} as started_at,
{{started_time('started_at')}} as started_at_time,
{{function1('started_at')}} as time_travel,
{{Get_season('started_at')}} as season_of_year,
{{days('started_at')}} as days_in_week

FROM {{ source('demo', 'bike') }}
where started_at != 'started_at'
)

SELECT
*
from CTE