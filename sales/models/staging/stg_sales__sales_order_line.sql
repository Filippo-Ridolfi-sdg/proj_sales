with 

source as (
    select
        *
    from {{ source('sales', 'sales_order_line') }}
),

final as (
    select
        *
    from source
)
select * from final