{{
    config(
        materialized='table',
        transient=true
    )
}}


select
    c.customer_id,
    {{concat_col('c.first_name','c.last_name')}}  as full_name,
    {{case_gender('c.gender')}} as gender ,
    a.account_id,
    a.account_type,
    a.open_date,
    {{trim_macro('a.status')}} as status ,
    a.balance
from {{ ref('stg_customers') }} c
join {{ ref('stg_accounts') }} a on c.customer_id = a.customer_id
