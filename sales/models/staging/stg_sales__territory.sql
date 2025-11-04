with 

source as (
    select
        *
    from {{ source('sales', 'territory') }}
),

final as (
    select
        *
    from source
)
select * from final