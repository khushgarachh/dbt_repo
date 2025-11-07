{% macro create_mview(mview_name,table_name) %}
{% set var=mview %}
create or replace materialized view {{mview_name}}
as select * from {{table_name}}
{% endset %}
{% do run_query(mview) %}    
{% endmacro %}