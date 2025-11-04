
with stg_sales as (
    select * from {{ ref('stg_sales__sales') }}
),

refined as (
    select
        salesorderlinekey as sales_order_line_id,
        resellerkey as reseller_key_cd,
        customerkey as customer_key_cd,
        productkey as product_key_cd,
        orderdatekey as order_date_key_cd,
        duedatekey as due_date_key_cd,
        shipdatekey as ship_date_key_cd,
        salesterritorykey as sales_territory_key_cd,

        order_quantity as order_quantity_val,
        
        try_cast(
            replace(replace(unit_price, '$', ''), ',', '')
            as decimal(18, 2)
        ) as unit_price_val,

        try_cast(
            replace(replace(extended_amount, '$', ''), ',', '')
            as decimal(18, 2)
        ) as extended_amount_val,

        try_cast(
            replace(unit_price_discount_pct, '%', '')
            as decimal(18, 4)
        ) as unit_price_discount_pct,
        
        try_cast(
            replace(replace(product_standard_cost, '$', ''), ',', '')
            as decimal(18, 2)
        ) as product_standard_cost_val,
        
        try_cast(
            replace(replace(total_product_cost, '$', ''), ',', '')
            as decimal(18, 2)
        ) as total_product_cost_val,
        
        try_cast(
            replace(replace(sales_amount, '$', ''), ',', '')
            as decimal(18, 2)
        ) as sales_amount_val

    from stg_sales
)

select * from refined