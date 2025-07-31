{% macro LIC_Fileformat_create_mco(database_name,schema_name,format_name,type,field_delimiter,skip_header) %}
    {% set create_ff %}
    use database {{database_name}};
    use schema {{database_name}}.{{schema_name}};
    create or replace file format {{database_name}}.{{schema_name}}.{{format_name}} 
    type = {{type}}
    field_delimiter = '{{field_delimiter}}'
    skip_header = {{skip_header}};
    {% endset %}
    {% do run_query(create_ff) %}
   
{% endmacro %}
---dbt run-operation LIC_Fileformat_create_mco --args "{'database_name':'DBT_CICD_LICRAW_DB','schema_name':'DBT_CICD_LICRAW_SC','format_name':'LIC_CICD_CSV_FORMAT','type':'CSV','field_delimiter':',','skip_header':'1'}"
