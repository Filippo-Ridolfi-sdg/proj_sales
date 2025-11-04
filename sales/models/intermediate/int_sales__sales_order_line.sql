
with stg_orders as (
    select * from {{ ref('stg_sales__sales_order_line') }}
),

refined as (
    select
        channel as sales_channel,
        SALESORDERLINEKEY as sales_order_line_id,
        SALES_ORDER_ID as sales_order_cd,
        sales_order_line as sales_order_line_number
    from stg_orders
)

select * from refined