{% macro mcr_agency_id_from_database_name(database_name) -%}
{% if database_name %}
 {{ return(database_name[3:database_name|length -4]) }}
{% endif %}
{%- endmacro %}