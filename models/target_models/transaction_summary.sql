{{
    config(
        materialized='view'
    )
}}

select
    txn_type,
    channel,
    count(*) as txn_count,
    sum(amount) as total_amount
from {{ ref('stg_transactions') }}
group by 1,2
