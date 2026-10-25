
  
  create view "dev"."main"."stg_orders__dbt_tmp" as (
    

select
    order_id,
    user_id as customer_id,
    amount,
    status as order_status,
    order_date
from "dev"."main"."orders"
  );
