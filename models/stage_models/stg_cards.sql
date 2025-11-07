{{
    config(
        materialized='table',
        transient=true
    )
}}
select *
from {{ source('dbt_sf_db', 'cards') }}
