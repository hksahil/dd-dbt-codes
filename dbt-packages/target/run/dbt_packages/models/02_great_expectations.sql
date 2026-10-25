
  
    
    
    create  table
      "dev"."main"."02_great_expectations__dbt_tmp"
  
    as (
      



select
    order_id,
    user_id,
    amount,
    status,
    'VALID_ORDER' as data_quality_flag,
    order_date
from "dev"."main"."orders"
    );
  
    
  