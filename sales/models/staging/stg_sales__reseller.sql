with 

source as (
    select
        *,
        CURRENT_TIMESTAMP() as dbt_updated_at
        
    from {{ source('sales', 'reseller') }}
),

final as (
    select
        *
    from source
)
select * from final