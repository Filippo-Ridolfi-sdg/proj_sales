with 

source as (
    select
        *
    from {{ source('sales', 'date') }}
),

final as (
    select
        *
    from source
)
select * from final