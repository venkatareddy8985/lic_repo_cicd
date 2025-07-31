{% macro LIC_CICD_STORAGE_INTE_CREATE_MCO(database_name,schema_name,integration_name,stage_name) %}
    {% set create_sto_inte %}
    create or replace storage integration {{integration_name}}
    type=external_stage
    storage_provider=s3
    enabled=true
    storage_aws_role_arn='arn:aws:iam::743938722121:role/DBT_CICD_LIC_INCREMENTAL_STORAGE_INTEGRATION'
    storage_allowed_locations=('s3://dbtincrementallics3bucketfulldata ')
    comment='integration with aws s3 bucket to snowfalke';
    {% endset %}
    {% do run_query(create_sto_inte) %}

     {% set create_stg %}
    use database {{database_name}};
    use schema {{database_name}}.{{schema_name}};
    create or replace stage {{database_name}}.{{schema_name}}.{{stage_name}}
    storage_integration={{integration_name}}
    url='s3://dbtincrementallics3bucketfulldata'
    file_format=LIC_CICD_CSV_FORMAT;
    {% endset %}
    {% do run_query(create_stg) %}

    
{% endmacro %}
----dbt run-operation LIC_CICD_STORAGE_INTE_CREATE_MCO --args "{'database_name':'DBT_CICD_LICRAW_DB','schema_name':'DBT_CICD_LICRAW_SC','integration_name':'DBT_LIC_CICD_STORAGE_INTEGRAT','stage_name':'CICD_LIC_EXT_STG'}"