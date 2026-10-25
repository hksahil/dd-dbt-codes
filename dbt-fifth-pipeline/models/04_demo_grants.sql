{#
  =========================================================================
  TEACHING TOPIC: dbt Grants (Access Control & RBAC)

  In production warehouses (Snowflake, Postgres, BigQuery, Databricks):
  dbt automatically executes `GRANT SELECT ON ... TO ROLE ...` after every run:

  grants={
      'select': ['reporting_role', 'bi_analysts']
  }

  NOTE ON DUCKDB:
  DuckDB is an embedded, single-user database (no multi-user RBAC),
  so SQL `GRANT` statements are used on multi-user enterprise warehouses.
  =========================================================================
#}

{{
    config(
        materialized='table'
    )
}}

select
    id as order_id,
    amount,
    'confidential_reporting' as data_classification
from orders
