{{
    config(
        materialized='view'
    )
}}
select  current_database() as db_name ,current_schema() as sc_name
