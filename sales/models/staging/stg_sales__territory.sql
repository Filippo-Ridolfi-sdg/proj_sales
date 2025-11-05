{{ config(
    materialized='incremental',
    unique_key='salesterritorykey'
) }}

WITH final as (
    select
        *,
        current_timestamp() as DBT_UPDATED_AT
    from {{ source('sales', 'territory') }}

    {% if is_incremental() %}
    -- carica solo i nuovi record non ancora presenti
    where salesterritorykey not in (select distinct salesterritorykey from {{ this }})
    {% endif %}
)

select * from final