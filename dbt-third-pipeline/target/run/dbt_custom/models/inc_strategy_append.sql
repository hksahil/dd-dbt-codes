
  
    
    
    create temporary table
      "inc_strategy_append__dbt_tmp_d1cc80ed_b46a_45f2_95b1_58677f55df20"
  
    as (
      



select
    order_id,
    user_id,
    amount,
    status,
    order_date
from orders


    -- In an immutable table, filtering on max(order_id) or max(order_date) is valid
    where order_date > (select coalesce(max(order_date), '1970-01-01') from "dev"."main"."inc_strategy_append")

    );
  
    
  ;
insert into "dev"."main"."inc_strategy_append" ("order_id", "user_id", "amount", "status", "order_date")
    (
        select "order_id", "user_id", "amount", "status", "order_date"
        from "inc_strategy_append__dbt_tmp_d1cc80ed_b46a_45f2_95b1_58677f55df20"
    )


  