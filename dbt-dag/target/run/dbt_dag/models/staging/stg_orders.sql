
  
  create view "dev"."main"."stg_orders__dbt_tmp" as (
    

-- Upstream dependency: source('raw_duckdb', 'orders')
select
*
from "dev"."main"."orders"
  );
