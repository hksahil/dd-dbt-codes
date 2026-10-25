
  
    
    
    create  table
      "dev"."main"."user_orders__dbt_tmp"
  
    as (
      

select
    o.order_id,
    o.customer_id,
    u.customer_name,
    o.amount,
    o.order_status,
    o.order_date
from "dev"."main"."stg_orders" o
join "dev"."main"."stg_users" u on o.customer_id = u.customer_id
    );
  
    
  