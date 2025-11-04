{{ 
    config(materialized='table',
    transient=false) 
}}

WITH trans AS (
    SELECT
        account_id,
        SUM(CASE WHEN txn_type = 'CREDIT' THEN amount ELSE 0 END) AS total_inflow,
        SUM(CASE WHEN txn_type = 'DEBIT' THEN amount ELSE 0 END) AS total_outflow,
        SUM(CASE WHEN txn_type = 'REFUND' THEN amount ELSE 0 END) AS total_refund,
        COUNT(*) AS total_txn_count,
        MAX(txn_date) AS last_transaction_date
    FROM {{ ref('stg_transactions') }}
    GROUP BY account_id
)
SELECT *,
    (total_inflow - total_outflow + total_refund) AS net_balance,
    CURRENT_TIMESTAMP() AS report_generated_at
FROM trans
