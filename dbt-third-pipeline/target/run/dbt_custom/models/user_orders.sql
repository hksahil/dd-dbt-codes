
  
    
    
    create  table
      "dev"."main"."user_orders__dbt_tmp"
  
    as (
      

select
    u.name,
    o.order_id,
    o.amount
from users u
join orders o on u.id = o.user_id
    );
  
    
  