{{
    config(
        materialized='view'
    )
}}

select * from {{ref('zipcodes3')}}