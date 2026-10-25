
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select amount
from "dev"."main"."02_great_expectations"
where amount is null



  
  
      
    ) dbt_internal_test