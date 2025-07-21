{{ config(
    materialized='table',
    schema='public'
) }}

with inventory as (
    select
        product_id,
        store_id,
        stock_on_hand,
        last_updated
    from {{ ref('sil_inv') }}
),

-- Example: join with products for richer analysis (optional)
products as (
    select
        product_id,
        product_name,
        category
    from {{ ref('sil_prod') }}
),

inventory_enriched as (
    select
        i.product_id,
        i.store_id,
        p.product_name,
        p.category,
        i.stock_on_hand,
        i.last_updated
    from inventory i
    left join products p
        on i.product_id = p.product_id
),

-- Example: flag low stock (threshold can be adjusted)
inventory_analysis as (
    select
        product_id,
        store_id,
        product_name,
        category,
        stock_on_hand,
        last_updated,
        case
            when stock_on_hand is null then 'NO DATA'
            when stock_on_hand = 0 then 'OUT OF STOCK'
            when stock_on_hand < 10 then 'LOW STOCK'
            else 'IN STOCK'
        end as stock_status
    from inventory_enriched
)

select *
from inventory_analysis