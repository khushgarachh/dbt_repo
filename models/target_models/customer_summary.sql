{{
    config(
        materialized='view'
    )
}}

with joined as (
    select
        ca.customer_id,
        ca.full_name,
        ca.account_id,
        ca.account_type,
        ca.balance,
        ab.net_txn_amount,
        ab.txn_count
    from {{ ref('int_customer_accounts') }} ca
    left join {{ ref('int_account_balances') }} ab
    on ca.account_id = ab.account_id
)
select
    customer_id,
    full_name,
    count(distinct account_id) as total_accounts,
    sum(balance) as total_balance,
    sum(net_txn_amount) as total_txn_value,
    sum(txn_count) as total_txns
from joined
group by 1,2
