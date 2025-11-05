{{ config(
    materialized='incremental',
    unique_key='customerkey'
) }}

WITH final as (
    select
        *,
        current_timestamp() as DBT_UPDATED_AT
    from {{ source('sales', 'customer') }}

    {% if is_incremental() %}
    -- carica solo i nuovi record non ancora presenti
    where customerkey not in (select distinct customerkey from {{ this }})
    {% endif %}
)

select * from final