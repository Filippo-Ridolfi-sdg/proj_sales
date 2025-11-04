with 

source as (
    select
        *
    from {{ source('sales', 'reseller') }}
),

final as (
    select
        *
    from source
)
select * from final