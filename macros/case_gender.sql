{% macro case_gender(col) %}
    case when {{col}} ='M' then 'Male' 
         when {{col}} ='F' then 'Female'
         else ''
    end
{% endmacro %}