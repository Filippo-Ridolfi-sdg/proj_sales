with 

source as (
    select
        *
    from {{ source('sales', 'territory') }}
),

final as (
    select
        *,
    CURRENT_TIMESTAMP() as dbt_updated_at

    from source
)
select * from final