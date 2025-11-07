{% macro file_format(args) %}
{% set ff_mco %}

create or replace file format file_format_1 as
type=csv
skip_header=1
field_delimiter =','
trim_space=true
field_optionally_enclosed_by ='"'

{% endset %}
{% do run_query(ff_mco) %}
    
{% endmacro %}