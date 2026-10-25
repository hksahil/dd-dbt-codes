
  
    
    
    create temporary table
      "demo_incremental__dbt_tmp_3f8ee93e_43a1_44ef_93e4_3feaf165384a"
  
    as (
      



select
    order_id,
    user_id,
    amount,
    status,
    order_date
from orders


    -- Watermark filter: only fetch records modified on or after our table's latest date
    where order_date >= (select coalesce(max(order_date), '1970-01-01') from "dev"."main"."demo_incremental")

    );
  
    
  ;

        
            delete from "dev"."main"."demo_incremental"
            where (
                order_id) in (
                select (order_id)
                from "demo_incremental__dbt_tmp_3f8ee93e_43a1_44ef_93e4_3feaf165384a"
            );

        
    

    insert into "dev"."main"."demo_incremental" ("order_id", "user_id", "amount", "status", "order_date")
    (
        select "order_id", "user_id", "amount", "status", "order_date"
        from "demo_incremental__dbt_tmp_3f8ee93e_43a1_44ef_93e4_3feaf165384a"
    )
  