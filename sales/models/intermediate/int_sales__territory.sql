with source as (

    select * from {{ ref('stg_sales__territory') }}

),

renamed as (
    select
        SALESTERRITORYKEY as sales_territory_id,
        region as sales_territory_region,
        country as sales_territory_country,
        TERRITORYGROUP as sales_territory_groups,
        dbt_updated_at as sales_territory_dbt_updated_at

    from source
)

select * from renamed