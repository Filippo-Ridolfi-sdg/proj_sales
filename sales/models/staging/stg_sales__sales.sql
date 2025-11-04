with source as (

    select * from {{ source('sales', 'sales') }}

),

renamed as (

    select *

    from source

)

select * from renamed