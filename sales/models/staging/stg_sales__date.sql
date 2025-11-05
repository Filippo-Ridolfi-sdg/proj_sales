{{ config(
    materialized='incremental',
    unique_key='datekey'
) }}

WITH final as (
    select
        *,
        current_timestamp() as DBT_UPDATED_AT
    from {{ source('sales', 'date') }}

    {% if is_incremental() %}
    -- carica solo i nuovi record non ancora presenti
    where datekey not in (select distinct datekey from {{ this }})
    {% endif %}
)

select * from final