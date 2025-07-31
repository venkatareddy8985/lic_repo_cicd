{% macro create_clone_tables_mco(trg_db,trg_sc,src_db,src_sc,table_list) %}
   
    {% set create_db %}
    create or replace database {{trg_db}};
    {% endset %}
    {% do run_query(create_db) %}

    {% set create_sc %}
    create or replace schema {{trg_db}}.{{trg_sc}};
    {% endset %}
    {% do run_query(create_sc) %}

    {% for tbl in table_list %}
    
    {% set source_table = src_db ~ '.' ~ src_sc ~ '.' ~ tbl %}
    {% set target_table = trg_db ~ '.' ~ trg_sc ~ '.' ~ tbl %}
    
    {% set create_clone_table %}
    create or replace table {{target_table}} clone {{source_table}};
    {% endset %}
    
    {% do run_query(create_clone_table) %}
 
    {% endfor %}
    
{% endmacro %}
---dbt run-operation create_clone_tables_mco --args "{'trg_db':'DBT_NEWCV_DB','trg_sc':'DBT_NEWCV_SC','src_db':'DBT_CV_DB','src_sc':'DBT_CV_SC','table_list':['C1','C2','C3','C4','C5','C6','C7','C8','CUSTOMER']}"