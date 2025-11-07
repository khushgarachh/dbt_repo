{% macro record_count(table_name) %}
    {% set sql_query %}
        select count(*) as row_count from {{ table_name }}
    {% endset %}

    {{ log("Executing SQL: " ~ sql_query, info=True) }}

    {% set result = run_query(sql_query) %}

    {% if result %}
        {% set count = result.columns[0].values()[0] %}
        {{ log("Row count for " ~ table_name ~ " = " ~ count, info=True) }}
    {% endif %}
{% endmacro %}
