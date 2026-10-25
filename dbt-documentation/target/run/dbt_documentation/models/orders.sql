
  
    
    
    create  table
      "dev"."main"."orders__dbt_tmp"
  
    as (
      

select
    o.id as order_id,
    c.customer_id,
    o.amount
from orders o
left join "dev"."main"."customers" c on c.customer_id = o.id - 100
    );
  
    
  