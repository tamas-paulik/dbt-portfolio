with

locations as (

    select * from {{ ref('stg_jaffle_shop_locations') }}

)

select * from locations