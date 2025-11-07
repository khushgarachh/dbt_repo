{% macro record_count(table_name) %}
{% set sql_query %}
select count(*) from {{table_name}}
{% endset%}
{% do run_query(sql_query) %}
{% endmacro %}