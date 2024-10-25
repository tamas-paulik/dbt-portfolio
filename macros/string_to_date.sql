{% macro string_to_date(date_string, format_string='YYYY-MM-DD') %}
    TO_DATE({{ date_string }}, '{{ format_string }}')
{% endmacro %}