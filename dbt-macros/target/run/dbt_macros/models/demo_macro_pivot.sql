
  
    
    
    create  table
      "dev"."main"."demo_macro_pivot__dbt_tmp"
  
    as (
      





select
    user_id,
    count(order_id) as total_orders,
    -- Macro call generates pivot columns dynamically:
    sum(case when status = 'completed' then amount else 0 end) as total_completed_amount,
    sum(case when status = 'pending' then amount else 0 end) as total_pending_amount,
    sum(case when status = 'cancelled' then amount else 0 end) as total_cancelled_amount
    
from "dev"."main"."orders"
group by user_id
    );
  
    
  