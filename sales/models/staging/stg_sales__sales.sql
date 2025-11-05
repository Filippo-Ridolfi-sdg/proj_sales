{{ config(
    materialized='incremental',
    unique_key='salesorderlinekey'
) }}

WITH final as (
    select
        *,
        current_timestamp() as DBT_UPDATED_AT
    from {{ source('sales', 'sales') }}

    {% if is_incremental() %}
    -- carica solo i nuovi record non ancora presenti
    where salesorderlinekey not in (select distinct salesorderlinekey from {{ this }})
    {% endif %}
)

select * from final