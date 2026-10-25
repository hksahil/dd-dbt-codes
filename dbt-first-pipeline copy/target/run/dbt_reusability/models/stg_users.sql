
  
  create view "dev"."main"."stg_users__dbt_tmp" as (
    

select
    id as customer_id,
    name as customer_name
from "dev"."main"."users"
  );
