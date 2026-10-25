
  
    
    
    create  table
      "dev"."main"."03_elementary__dbt_tmp"
  
    as (
      



select
    order_id,
    user_id,
    amount,
    status,
    order_date,
    current_timestamp as observed_at
from "dev"."main"."orders"
    );
  
    
  