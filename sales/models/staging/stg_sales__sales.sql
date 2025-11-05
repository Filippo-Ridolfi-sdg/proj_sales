with source as (

    select * from {{ source('sales', 'sales') }}

),

renamed as (

    select *,
    CURRENT_TIMESTAMP() as dbt_updated_at


    from source

)

select * from renamed