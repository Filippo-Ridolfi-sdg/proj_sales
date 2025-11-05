with staging_products as (

    select * from {{ ref('stg_sales__product') }}

),

refined as (

    select
        productkey as product_id,
        sku as product_sku_cd,
        product as product_desc,
        try_cast(
            replace(replace(standard_cost, '$', ''), ',', '')
            as decimal(18, 2)
        ) as standard_cost_std_val,
        color as product_color,
        try_cast(
            replace(replace(list_price, '$', ''), ',', '')
            as decimal(18, 2)
        ) as list_price_usd_val,
        
        model as product_model,
        subcategory as product_subcategory,
        category as product_category,
        dbt_updated_at as product_dbt_updated_at
        
    from staging_products
)

select * from refined