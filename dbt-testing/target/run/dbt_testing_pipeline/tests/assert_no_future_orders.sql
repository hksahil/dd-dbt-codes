
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  -- ========================================================
-- TYPE 2: Singular Test (Business Logic / Temporal Assertion)
-- Asserts that no order is timestamped in the future.
-- ========================================================

select
*
from "dev"."main"."stg_orders"
where order_date > current_date
  
  
      
    ) dbt_internal_test