with

supplies as (
    select * from {{ ref('stg_jaffle_shop_supplies') }}
)

select * from supplies