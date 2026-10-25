
  
    
    
    create  table
      "dev"."main"."int_customer_orders__dbt_tmp"
  
    as (
      

-- Upstream dependencies: ref('stg_orders') AND ref('stg_users')
-- dbt will automatically wait for both stg models to finish before running this!

select
    o.order_id,
    o.user_id,
    u.user_name,
    o.amount
from "dev"."main"."stg_orders" o
left join "dev"."main"."stg_users" u on o.user_id = u.user_id
    );
  
    
  