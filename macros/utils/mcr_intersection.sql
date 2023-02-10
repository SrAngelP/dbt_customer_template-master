{% macro mcr_intersection(list1, list2) -%}

{%- set intersection = [] -%}

{%- for elem in list1 -%}
    {%- if elem in list2 -%}
        {%- do intersection.append( elem ) -%}
    {%- endif -%}
{%- endfor -%}

{% if execute %}
    {{ return(intersection) }}
{% endif %}

{%- endmacro %}