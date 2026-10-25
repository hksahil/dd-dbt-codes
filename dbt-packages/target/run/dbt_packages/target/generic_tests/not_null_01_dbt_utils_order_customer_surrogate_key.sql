
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select order_customer_surrogate_key
from "dev"."main"."01_dbt_utils"
where order_customer_surrogate_key is null



  
  
      
    ) dbt_internal_test