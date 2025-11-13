{{ config(
    materialized='view',
    query_tag='dbt_track',
    pre_hook="INSERT INTO  model_audit_log (model_name, run_started_at)
              VALUES ('mod_hook', CURRENT_TIMESTAMP())",
    post_hook="INSERT INTO model_audit_log (model_name, run_completed_at)
               VALUES ('mod_hook', CURRENT_TIMESTAMP())"
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
