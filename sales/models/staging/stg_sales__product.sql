{{ config(
    materialized='incremental',
    unique_key='productkey'
) }}

WITH final as (
    select
        *,
        current_timestamp() as DBT_UPDATED_AT
    from {{ source('sales', 'product') }}

    {% if is_incremental() %}
    -- carica solo i nuovi record non ancora presenti
    where productkey not in (select distinct productkey from {{ this }})
    {% endif %}
)

select * from final