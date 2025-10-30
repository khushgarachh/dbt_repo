{{
    config(
        materialized='table',
        transient=true
    )
}}
select
    account_id,
    customer_id,
    account_type,
    open_date,
    status,
    balance,
    created_at
from {{ source('dbt_sf_db', 'accounts') }}
