
  
    
    
    create temporary table
      "inc_strategy_merge__dbt_tmp_aea3ffa1_368f_4a67_ba18_d36fb3c63a5e"
  
    as (
      



select
    order_id,
    user_id,
    amount,
    status,
    order_date
from orders


    -- Filter candidate batch using timestamp watermark
    where order_date >= (select coalesce(max(order_date), '1970-01-01') from "dev"."main"."inc_strategy_merge")

    );
  
    
  ;


    MERGE INTO "dev"."main"."inc_strategy_merge" AS DBT_INTERNAL_DEST
        USING "inc_strategy_merge__dbt_tmp_aea3ffa1_368f_4a67_ba18_d36fb3c63a5e" AS DBT_INTERNAL_SOURCE
        
            
                
            
        
        ON (DBT_INTERNAL_SOURCE.order_id = DBT_INTERNAL_DEST.order_id)
    
    WHEN MATCHED
    THEN
        UPDATE BY NAME
    WHEN NOT MATCHED
        
    THEN
        INSERT BY NAME

  