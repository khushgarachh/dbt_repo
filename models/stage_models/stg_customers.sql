 {{
    config(
        materialized='table',
        transient=true  
/* Can be easily rebuilt at any time, no heavy transformations,don’t need to retain history or fail-safe*/
    )
 }}
select
    customer_id,
    initcap(first_name) as first_name,
    initcap(last_name) as last_name,
    city,
    state,
    dob,
    created_at
from   {{ source('dbt_sf_db', 'customers') }}
