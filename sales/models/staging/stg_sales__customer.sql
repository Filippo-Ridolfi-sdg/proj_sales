with source as (

    select * from {{ source('sales', 'customer') }}

),

renamed as (

    select *

    from source

)

select * from renamed