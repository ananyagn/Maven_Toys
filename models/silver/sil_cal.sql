{{ config(
    materialized='table',
    schema='public'
) }}

with bronze as (
    select
        try_cast(date as date) as calendar_date,
        date_part('DAY', try_cast(date as date)) as day,
        date_part('MONTH', try_cast(date as date)) as month,
        date_part('YEAR', try_cast(date as date)) as year,
        date_part('DOW', try_cast(date as date)) as day_of_week,  -- 0=Sunday in Snowflake
        --to_char(try_cast(date as date), 'Day') as day_name,    -- uncomment if you want day name
        current_timestamp() as ingestion_timestamp
    from {{ ref('brn_cal') }}
)

select
    calendar_date,
    day,
    month,
    year,
    day_of_week,
    ingestion_timestamp as last_updated
from bronze
where calendar_date is not null