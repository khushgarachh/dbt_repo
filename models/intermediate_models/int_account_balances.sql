{{
    config(
        materialized='table',
        transient=true
    )
}}

select
    account_id,
    sum(case when txn_type='CREDIT' then amount else -amount end) as net_txn_amount,
    count(*) as txn_count
from {{ ref('stg_transactions') }}
group by account_id
