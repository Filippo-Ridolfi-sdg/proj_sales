
with stg_resellers as (
    select * from {{ ref('stg_sales__reseller') }}
),

refined as (
    select
        ResellerKey as reseller_id,
        reseller_id as reseller_cd,
        business_type as reseller_business_type,
        Reseller as reseller_name,
        city as reseller_city,
        state_province as reseller_state_province,
        country_region as reseller_country_region,
        postal_code as reseller_postal_code_cd,
        dbt_updated_at as reseller_dbt_updated_at

    from stg_resellers
)

select * from refined