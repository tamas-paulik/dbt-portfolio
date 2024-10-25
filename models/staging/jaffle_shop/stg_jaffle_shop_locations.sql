with

source as (
    select * from {{ source('ecom', 'raw_stores') }}
),

type_casted as (
    select
    ----------  ids
    id,

    ---------- timestamps
    TO_TIMESTAMP( opened_at ) as opened_at, 

    from source
),

renamed as (
    select
        ----------  ids
        source.id as location_id,

        ---------- text
        source.name as location_name,

        ---------- numerics
        source.tax_rate,

        ---------- timestamps
        cast( {{ dbt.date_trunc('day', 'type_casted.opened_at') }} as date) as opened_date,

    from source
    inner join type_casted
    on source.id = type_casted.id 
)

select * from renamed

