with 

source as (
    select
        *
    from {{ source('sales', 'product') }}
),

final as (
    select
        *
    from source
)
select * from final