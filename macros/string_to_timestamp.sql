{% macro string_to_timestamp(date_string, format_string='YYYY-MM-DD HH24:MI:SS', to_utc=false) %}
    {% if to_utc %}
        CONVERT_TIMEZONE('UTC', TO_TIMESTAMP({{ date_string }}, '{{ format_string }}'))
    {% else %}
        TO_TIMESTAMP({{ date_string }}, '{{ format_string }}')
    {% endif %}
{% endmacro %}