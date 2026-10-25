{% macro trim_and_upper(sahil) -%}
    upper(trim({{ sahil }}))
{%- endmacro %}
