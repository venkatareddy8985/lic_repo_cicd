{% macro create_table_mco(database_name,schema_name,table_name) %}
    {% set create_db %}
    create or replace database {{database_name}};
    {% endset %}
    {% do run_query(create_db) %}

    {% set create_sc %}
    create or replace schema {{database_name}}.{{schema_name}};
    {% endset %}
    {% do run_query(create_sc) %}

    {% set create_table %}
    create or replace table {{database_name}}.{{schema_name}}.{{table_name}}
        (
            customer_id varchar(10),
            customer_name varchar(50),
            customer_address varchar(50)
        );
    {% endset %}
    {% do run_query(create_table) %}

{% endmacro %}