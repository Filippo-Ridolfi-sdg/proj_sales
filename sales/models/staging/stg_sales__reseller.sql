{{ config(
    materialized='incremental',
    unique_key='resellerkey'
) }}

WITH final as (
    select
        *,
        current_timestamp() as DBT_UPDATED_AT
    from {{ source('sales', 'reseller') }}

    {% if is_incremental() %}
    -- carica solo i nuovi record non ancora presenti
    where resellerkey not in (select distinct resellerkey from {{ this }})
    {% endif %}
)

select * from final