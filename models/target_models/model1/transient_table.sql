{{
    config(
        materialized='table',
        transient=true
    )
}}

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