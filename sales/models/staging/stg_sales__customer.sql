with source as (

    select * from {{ source('sales', 'customer') }}

),

renamed as (

    select *,
    CURRENT_TIMESTAMP() as dbt_updated_at

    from source

)

select * from renamed