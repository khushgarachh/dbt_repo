 {{
    config(
        materialized='table',
        transient=true     )
 }}
select
    customer_id,
    initcap(first_name) as first_name,
    initcap(last_name) as last_name,
    city,
    state,
    dob,
    gender,
    created_at
from   {{ source('dbt_sf_db', 'customers') }}
