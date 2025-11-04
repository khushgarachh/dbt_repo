 {{
    config(
        materialized='table',
        transient=true
    )
 }}
select
    txn_id,
    account_id,
    txn_date,
    txn_type,
    amount,
    channel,
    created_at,
    merchant_name
from {{ source('dbt_sf_db', 'transactions') }}
