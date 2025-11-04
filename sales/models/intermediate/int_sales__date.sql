
with stg_dates as (
    select * from {{ ref('stg_sales__date') }}
),

refined as (
    select
        datekey as date_id,
        try_to_date(date_value) as date_value,
        fiscal_year as year,
        fiscal_quarter as quarter,
        month as month_ds,
        full_date_string as full_date_description, 
        monthkey as month_cd

    from stg_dates
)

select * from refined