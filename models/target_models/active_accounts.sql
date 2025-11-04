{{ config(
    materialized='view',
    query_tag='dbt_track'
) }}


with active_accounts AS (
    SELECT stg_acc.*, DATEDIFF('day', open_date, current_date()) AS days_since_creation
    FROM  {{ ref('stg_accounts') }} stg_acc
    WHERE UPPER(status) = 'ACTIVE'
)

SELECT 
    account_id,customer_id,account_type,status,created_at,
    days_since_creation,
    CURRENT_TIMESTAMP() AS report_generated_at
FROM active_accounts
