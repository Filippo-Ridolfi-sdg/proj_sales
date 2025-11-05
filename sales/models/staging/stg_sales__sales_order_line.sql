with 

source as (
    select
        *
    from {{ source('sales', 'sales_order_line') }}
),

final as (
    select
        *,
        CURRENT_TIMESTAMP() as dbt_updated_at

    from source
)
select * from final