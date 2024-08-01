-- macros/convert_date.sql

{% macro convert_date(date_column) %}
    TO_CHAR({{ date_column }}, 'YYYY-MM-DD')
{% endmacro %}