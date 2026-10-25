-- created_at: 2026-10-25T11:25:25.997862+00:00
-- finished_at: 2026-10-25T11:25:25.998825+00:00
-- elapsed: 963us
-- outcome: success
-- dialect: duckdb
-- node_id: test.dbt_testing_pipeline.not_null_stg_orders_customer_id.af79d5e4b5
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.dbt_testing_pipeline.not_null_stg_orders_customer_id.af79d5e4b5", "profile_name": "dbt_custom", "target_name": "dev"} */

    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select customer_id
from "dev"."main"."stg_orders"
where customer_id is null



  
  
      
    ) dbt_internal_test;

-- created_at: 2026-10-25T11:25:25.997885+00:00
-- finished_at: 2026-10-25T11:25:25.998825+00:00
-- elapsed: 940us
-- outcome: success
-- dialect: duckdb
-- node_id: test.dbt_testing_pipeline.assert_total_order_amount_positive
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.dbt_testing_pipeline.assert_total_order_amount_positive", "profile_name": "dbt_custom", "target_name": "dev"} */

    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  select
*
from "dev"."main"."stg_orders"
where amount <= 0
  
  
      
    ) dbt_internal_test;

-- created_at: 2026-10-25T11:25:25.997864+00:00
-- finished_at: 2026-10-25T11:25:25.998927+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: test.dbt_testing_pipeline.not_null_stg_orders_order_id.81cfe2fe64
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.dbt_testing_pipeline.not_null_stg_orders_order_id.81cfe2fe64", "profile_name": "dbt_custom", "target_name": "dev"} */

    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select order_id
from "dev"."main"."stg_orders"
where order_id is null



  
  
      
    ) dbt_internal_test;

-- created_at: 2026-10-25T11:25:25.997864+00:00
-- finished_at: 2026-10-25T11:25:25.998936+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: test.dbt_testing_pipeline.is_positive_stg_orders_amount.033194cf5f
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.dbt_testing_pipeline.is_positive_stg_orders_amount.033194cf5f", "profile_name": "dbt_custom", "target_name": "dev"} */

    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  

select
    amount as invalid_value
from "dev"."main"."stg_orders"
where amount <= 0


  
  
      
    ) dbt_internal_test;

-- created_at: 2026-10-25T11:25:25.997961+00:00
-- finished_at: 2026-10-25T11:25:25.999303+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: test.dbt_testing_pipeline.not_null_stg_orders_amount.2546645448
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.dbt_testing_pipeline.not_null_stg_orders_amount.2546645448", "profile_name": "dbt_custom", "target_name": "dev"} */

    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select amount
from "dev"."main"."stg_orders"
where amount is null



  
  
      
    ) dbt_internal_test;

-- created_at: 2026-10-25T11:25:25.997894+00:00
-- finished_at: 2026-10-25T11:25:25.999733+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: test.dbt_testing_pipeline.unique_stg_orders_order_id.e3b841c71a
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.dbt_testing_pipeline.unique_stg_orders_order_id.e3b841c71a", "profile_name": "dbt_custom", "target_name": "dev"} */

    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    order_id as unique_field,
    count(*) as n_records

from "dev"."main"."stg_orders"
where order_id is not null
group by order_id
having count(*) > 1



  
  
      
    ) dbt_internal_test;

-- created_at: 2026-10-25T11:25:25.997899+00:00
-- finished_at: 2026-10-25T11:25:25.999731+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: test.dbt_testing_pipeline.accepted_values_stg_customers_status__active__inactive__pending.02916822e1
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.dbt_testing_pipeline.accepted_values_stg_customers_status__active__inactive__pending.02916822e1", "profile_name": "dbt_custom", "target_name": "dev"} */

    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        status as value_field,
        count(*) as n_records

    from "dev"."main"."stg_customers"
    group by status

)

select *
from all_values
where value_field not in (
    'active','inactive','pending'
)



  
  
      
    ) dbt_internal_test;

-- created_at: 2026-10-25T11:25:25.997864+00:00
-- finished_at: 2026-10-25T11:25:25.999818+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: test.dbt_testing_pipeline.accepted_values_stg_orders_order_status__completed__processing__cancelled__refunded.c796f576f9
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.dbt_testing_pipeline.accepted_values_stg_orders_order_status__completed__processing__cancelled__refunded.c796f576f9", "profile_name": "dbt_custom", "target_name": "dev"} */

    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        order_status as value_field,
        count(*) as n_records

    from "dev"."main"."stg_orders"
    group by order_status

)

select *
from all_values
where value_field not in (
    'completed','processing','cancelled','refunded'
)



  
  
      
    ) dbt_internal_test;

-- created_at: 2026-10-25T11:25:25.997937+00:00
-- finished_at: 2026-10-25T11:25:26.000456+00:00
-- elapsed: 2ms
-- outcome: success
-- dialect: duckdb
-- node_id: test.dbt_testing_pipeline.assert_no_future_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.dbt_testing_pipeline.assert_no_future_orders", "profile_name": "dbt_custom", "target_name": "dev"} */

    
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
  
  
      
    ) dbt_internal_test;

-- created_at: 2026-10-25T11:25:26.007485+00:00
-- finished_at: 2026-10-25T11:25:26.007873+00:00
-- elapsed: 388us
-- outcome: success
-- dialect: duckdb
-- node_id: test.dbt_testing_pipeline.not_null_stg_customers_customer_id.e2cfb1f9aa
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.dbt_testing_pipeline.not_null_stg_customers_customer_id.e2cfb1f9aa", "profile_name": "dbt_custom", "target_name": "dev"} */

    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select customer_id
from "dev"."main"."stg_customers"
where customer_id is null



  
  
      
    ) dbt_internal_test;

-- created_at: 2026-10-25T11:25:26.007018+00:00
-- finished_at: 2026-10-25T11:25:26.008045+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: test.dbt_testing_pipeline.unique_stg_customers_customer_id.c7614daada
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.dbt_testing_pipeline.unique_stg_customers_customer_id.c7614daada", "profile_name": "dbt_custom", "target_name": "dev"} */

    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    customer_id as unique_field,
    count(*) as n_records

from "dev"."main"."stg_customers"
where customer_id is not null
group by customer_id
having count(*) > 1



  
  
      
    ) dbt_internal_test;

-- created_at: 2026-10-25T11:25:26.007021+00:00
-- finished_at: 2026-10-25T11:25:26.008421+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: test.dbt_testing_pipeline.relationships_stg_orders_customer_id__customer_id__ref_stg_customers_.430bf21500
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.dbt_testing_pipeline.relationships_stg_orders_customer_id__customer_id__ref_stg_customers_.430bf21500", "profile_name": "dbt_custom", "target_name": "dev"} */

    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with child as (
    select customer_id as from_field
    from "dev"."main"."stg_orders"
    where customer_id is not null
),

parent as (
    select customer_id as to_field
    from "dev"."main"."stg_customers"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



  
  
      
    ) dbt_internal_test;

