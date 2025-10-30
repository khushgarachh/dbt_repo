{{
    config(
        materialized='view'
    )
}}
select  current_database(),current_schema();
