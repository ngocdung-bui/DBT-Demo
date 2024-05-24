{% macro get_post_date() %}

{%- set post_date = var("post_date_tkt") -%}
{%- if post_date is none -%}
{%- set post_date = modules.datetime.date.today().strftime('%Y-%m-%d') -%}
{%- endif -%}

{{ post_date }}

 {% endmacro %}