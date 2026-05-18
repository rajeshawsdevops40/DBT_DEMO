{% macro timestamp(x)%}
to_timestamp(started_at)
{% endmacro %}

{% macro started_time(x)%}
DATE(to_timestamp(started_at))
{% endmacro %}


{% macro function1(x) %}
CASE WHEN TO_TIMESTAMP({{x}}) < current_date then 'past' else 'Future' END
{% endmacro %}

{% macro days(x) %}
CASE 
when DAYNAME(to_timestamp(started_at))  in ('sun','sat') then 'Weekend'
else 'Business Days'
END
{% endmacro %}


{% macro Get_season(x) %}
case
when MONTH(to_timestamp({{x}})) in (12,1,2) then 'Winter'
when MONTH(to_timestamp({{x}})) in (3,4,5) then 'Autum' 
else 'Summer'
end

{% endmacro %}