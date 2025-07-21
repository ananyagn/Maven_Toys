{{ config(
    materialized='table',
    schema='gold'
) }}
 
with sales as (
    select * from {{ ref('sil_sales') }}
),
products as (
    select * from {{ ref('sil_prod') }}
),
stores as (
    select * from {{ ref('sil_stores') }}
),
calendar as (
    select * from {{ ref('sil_cal') }}
)
 
select
    s.sale_id,
    s.sale_date,
    c.day,
    c.month,
    c.year,
    s.product_id,
    p.product_name,
    p.category,
    s.store_id,
    st.store_name,
    st.location,
    s.units,
    (s.units * p.price) as sales_amount
from sales s
left join calendar c on s.sale_date = c.calendar_date
left join products p on s.product_id = p.product_id
left join stores st on s.store_id = st.store_id