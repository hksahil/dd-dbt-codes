
  
    
    
    create temporary table
      "inc_strategy_delete_insert__dbt_tmp_93f411bd_f324_41cd_a741_1c46764eb107"
  
    as (
      



select
    order_id,
    user_id,
    amount,
    status,
    order_date
from orders


    -- Filter candidate batch using timestamp watermark
    where order_date >= (select coalesce(max(order_date), '1970-01-01') from "dev"."main"."inc_strategy_delete_insert")

    );
  
    
  ;

        
            delete from "dev"."main"."inc_strategy_delete_insert"
            where (
                order_id) in (
                select (order_id)
                from "inc_strategy_delete_insert__dbt_tmp_93f411bd_f324_41cd_a741_1c46764eb107"
            );

        
    

    insert into "dev"."main"."inc_strategy_delete_insert" ("order_id", "user_id", "amount", "status", "order_date")
    (
        select "order_id", "user_id", "amount", "status", "order_date"
        from "inc_strategy_delete_insert__dbt_tmp_93f411bd_f324_41cd_a741_1c46764eb107"
    )
  