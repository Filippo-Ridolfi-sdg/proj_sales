
with stg_customers as (
    select * from {{ ref('stg_sales__customer') }}
),

refined as (
    select
        customerkey as customer_id,
        customer_id as customer_cd,
        customer as customer_name, 
        city as customer_city,
        state_province as customer_state_province,
        country_region as customer_country_region,
        postal_code as customer_postal_code_cd

    from stg_customers
)

select * from refined