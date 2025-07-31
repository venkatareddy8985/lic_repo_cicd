{% macro create_table_clones_mco(trg_db,trg_sc,src_db,src_sc) %}
    {% set create_db %}
    create or replace database {{trg_db}};
    {% endset %}  
    {% do run_query(create_db) %}

    {% set create_sc %}
    create or replace schema {{trg_db}}.{{trg_sc}};
    {% endset %}
    {% do run_query(create_sc) %}

    {% set create_clone_tables %}
    create or replace table {{trg_db}}.{{trg_sc}}.C1 CLONE {{src_db}}.{{src_sc}}.C1;
    create or replace table {{trg_db}}.{{trg_sc}}.C2 CLONE {{src_db}}.{{src_sc}}.C2;
    create or replace table {{trg_db}}.{{trg_sc}}.C3 CLONE {{src_db}}.{{src_sc}}.C3;
    create or replace table {{trg_db}}.{{trg_sc}}.C4 CLONE {{src_db}}.{{src_sc}}.C4;
    create or replace table {{trg_db}}.{{trg_sc}}.C5 CLONE {{src_db}}.{{src_sc}}.C5;
    create or replace table {{trg_db}}.{{trg_sc}}.C6 CLONE {{src_db}}.{{src_sc}}.C6;
    create or replace table {{trg_db}}.{{trg_sc}}.C7 CLONE {{src_db}}.{{src_sc}}.C7;
    create or replace table {{trg_db}}.{{trg_sc}}.C8 CLONE {{src_db}}.{{src_sc}}.C8;
    create or replace table {{trg_db}}.{{trg_sc}}.CUSTOMER CLONE {{src_db}}.{{src_sc}}.CUSTOMER;
    {% endset %}
    {% do run_query(create_clone_tables) %}

{% endmacro %}

---dbt run-operation create_table_clones_mco --args "{'trg_db':'CVSR_RAWDB','trg_sc':'CVSR_RAWSC','src_db':'DBT_NEWCV_DB','src_sc':'DBT_NEWCV_SC'}"