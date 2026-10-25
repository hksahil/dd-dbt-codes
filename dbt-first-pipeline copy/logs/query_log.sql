-- created_at: 2026-10-25T09:07:55.506832+00:00
-- finished_at: 2026-10-25T09:07:55.507308+00:00
-- elapsed: 476us
-- outcome: success
-- dialect: duckdb
-- node_id: not available
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "connection_name": "", "dbt_version": "2.0.0", "profile_name": "dbt_custom", "target_name": "dev"} */

    
    select schema_name
    from system.information_schema.schemata
    
    where lower(catalog_name) = '"dev"'
    
  
  ;

-- created_at: 2026-10-25T09:07:55.507556+00:00
-- finished_at: 2026-10-25T09:07:55.507709+00:00
-- elapsed: 153us
-- outcome: success
-- dialect: duckdb
-- node_id: not available
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "connection_name": "", "dbt_version": "2.0.0", "profile_name": "dbt_custom", "target_name": "dev"} */

    
        select type from duckdb_databases()
        where lower(database_name)='dev'
        and type='sqlite'
    
  ;

-- created_at: 2026-10-25T09:07:55.507791+00:00
-- finished_at: 2026-10-25T09:07:55.507872+00:00
-- elapsed: 81us
-- outcome: success
-- dialect: duckdb
-- node_id: not available
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "connection_name": "", "dbt_version": "2.0.0", "profile_name": "dbt_custom", "target_name": "dev"} */

    
    
        create schema if not exists "dev"."main"
    ;

-- created_at: 2026-10-25T09:07:55.511183+00:00
-- finished_at: 2026-10-25T09:07:55.512526+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_reusability.stg_orders
-- query_id: not available
-- desc: get_relation > list_relations call
SELECT table_catalog, table_schema, table_name, table_type FROM information_schema.tables WHERE table_schema = 'main' AND lower(table_catalog) = lower('dev');

-- created_at: 2026-10-25T09:07:55.511180+00:00
-- finished_at: 2026-10-25T09:07:55.512526+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_reusability.stg_users
-- query_id: not available
-- desc: get_relation > list_relations call
SELECT table_catalog, table_schema, table_name, table_type FROM information_schema.tables WHERE table_schema = 'main' AND lower(table_catalog) = lower('dev');

-- created_at: 2026-10-25T09:07:55.513717+00:00
-- finished_at: 2026-10-25T09:07:55.513979+00:00
-- elapsed: 262us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_reusability.stg_users
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_reusability.stg_users", "profile_name": "dbt_custom", "target_name": "dev"} */

  
  create view "dev"."main"."stg_users__dbt_tmp" as (
    

select
    id as customer_id,
    name as customer_name
from "dev"."main"."users"
  );
;

-- created_at: 2026-10-25T09:07:55.513730+00:00
-- finished_at: 2026-10-25T09:07:55.514028+00:00
-- elapsed: 298us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_reusability.stg_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_reusability.stg_orders", "profile_name": "dbt_custom", "target_name": "dev"} */

  
  create view "dev"."main"."stg_orders__dbt_tmp" as (
    

select
    order_id,
    user_id as customer_id,
    amount,
    status as order_status,
    order_date
from "dev"."main"."orders"
  );
;

-- created_at: 2026-10-25T09:07:55.514500+00:00
-- finished_at: 2026-10-25T09:07:55.514631+00:00
-- elapsed: 131us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_reusability.stg_users
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_reusability.stg_users", "profile_name": "dbt_custom", "target_name": "dev"} */
alter view "dev"."main"."stg_users" rename to "stg_users__dbt_backup";

-- created_at: 2026-10-25T09:07:55.514562+00:00
-- finished_at: 2026-10-25T09:07:55.514734+00:00
-- elapsed: 172us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_reusability.stg_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_reusability.stg_orders", "profile_name": "dbt_custom", "target_name": "dev"} */
alter table "dev"."main"."stg_orders" rename to "stg_orders__dbt_backup";

-- created_at: 2026-10-25T09:07:55.515024+00:00
-- finished_at: 2026-10-25T09:07:55.515117+00:00
-- elapsed: 93us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_reusability.stg_users
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_reusability.stg_users", "profile_name": "dbt_custom", "target_name": "dev"} */
alter view "dev"."main"."stg_users__dbt_tmp" rename to "stg_users";

-- created_at: 2026-10-25T09:07:55.515182+00:00
-- finished_at: 2026-10-25T09:07:55.515301+00:00
-- elapsed: 119us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_reusability.stg_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_reusability.stg_orders", "profile_name": "dbt_custom", "target_name": "dev"} */
alter view "dev"."main"."stg_orders__dbt_tmp" rename to "stg_orders";

-- created_at: 2026-10-25T09:07:55.515758+00:00
-- finished_at: 2026-10-25T09:07:55.515876+00:00
-- elapsed: 118us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_reusability.stg_users
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_reusability.stg_users", "profile_name": "dbt_custom", "target_name": "dev"} */

      drop view if exists "dev"."main"."stg_users__dbt_backup" cascade
    ;

-- created_at: 2026-10-25T09:07:55.516046+00:00
-- finished_at: 2026-10-25T09:07:55.516224+00:00
-- elapsed: 178us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_reusability.stg_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_reusability.stg_orders", "profile_name": "dbt_custom", "target_name": "dev"} */

      drop table if exists "dev"."main"."stg_orders__dbt_backup" cascade
    ;

-- created_at: 2026-10-25T09:07:55.519619+00:00
-- finished_at: 2026-10-25T09:07:55.520033+00:00
-- elapsed: 414us
-- outcome: success
-- dialect: duckdb
-- node_id: test.dbt_reusability.not_null_stg_orders_order_id.81cfe2fe64
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.dbt_reusability.not_null_stg_orders_order_id.81cfe2fe64", "profile_name": "dbt_custom", "target_name": "dev"} */

    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select order_id
from "dev"."main"."stg_orders"
where order_id is null



  
  
      
    ) dbt_internal_test;

-- created_at: 2026-10-25T09:07:55.519625+00:00
-- finished_at: 2026-10-25T09:07:55.520044+00:00
-- elapsed: 419us
-- outcome: success
-- dialect: duckdb
-- node_id: test.dbt_reusability.not_null_stg_users_customer_id.300e3d6eae
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.dbt_reusability.not_null_stg_users_customer_id.300e3d6eae", "profile_name": "dbt_custom", "target_name": "dev"} */

    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select customer_id
from "dev"."main"."stg_users"
where customer_id is null



  
  
      
    ) dbt_internal_test;

-- created_at: 2026-10-25T09:07:55.519632+00:00
-- finished_at: 2026-10-25T09:07:55.520246+00:00
-- elapsed: 614us
-- outcome: success
-- dialect: duckdb
-- node_id: test.dbt_reusability.not_null_stg_orders_amount.2546645448
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.dbt_reusability.not_null_stg_orders_amount.2546645448", "profile_name": "dbt_custom", "target_name": "dev"} */

    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select amount
from "dev"."main"."stg_orders"
where amount is null



  
  
      
    ) dbt_internal_test;

-- created_at: 2026-10-25T09:07:55.520172+00:00
-- finished_at: 2026-10-25T09:07:55.520487+00:00
-- elapsed: 315us
-- outcome: success
-- dialect: duckdb
-- node_id: test.dbt_reusability.not_null_stg_orders_customer_id.af79d5e4b5
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.dbt_reusability.not_null_stg_orders_customer_id.af79d5e4b5", "profile_name": "dbt_custom", "target_name": "dev"} */

    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select customer_id
from "dev"."main"."stg_orders"
where customer_id is null



  
  
      
    ) dbt_internal_test;

-- created_at: 2026-10-25T09:07:55.521047+00:00
-- finished_at: 2026-10-25T09:07:55.521547+00:00
-- elapsed: 500us
-- outcome: success
-- dialect: duckdb
-- node_id: test.dbt_reusability.unique_stg_users_customer_id.7074f9b54f
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.dbt_reusability.unique_stg_users_customer_id.7074f9b54f", "profile_name": "dbt_custom", "target_name": "dev"} */

    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    customer_id as unique_field,
    count(*) as n_records

from "dev"."main"."stg_users"
where customer_id is not null
group by customer_id
having count(*) > 1



  
  
      
    ) dbt_internal_test;

-- created_at: 2026-10-25T09:07:55.521361+00:00
-- finished_at: 2026-10-25T09:07:55.521973+00:00
-- elapsed: 612us
-- outcome: success
-- dialect: duckdb
-- node_id: test.dbt_reusability.accepted_values_stg_orders_order_status__completed__processing__cancelled__refunded.c796f576f9
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.dbt_reusability.accepted_values_stg_orders_order_status__completed__processing__cancelled__refunded.c796f576f9", "profile_name": "dbt_custom", "target_name": "dev"} */

    
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

-- created_at: 2026-10-25T09:07:55.521355+00:00
-- finished_at: 2026-10-25T09:07:55.522031+00:00
-- elapsed: 676us
-- outcome: success
-- dialect: duckdb
-- node_id: test.dbt_reusability.unique_stg_orders_order_id.e3b841c71a
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.dbt_reusability.unique_stg_orders_order_id.e3b841c71a", "profile_name": "dbt_custom", "target_name": "dev"} */

    
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

-- created_at: 2026-10-25T09:07:55.521878+00:00
-- finished_at: 2026-10-25T09:07:55.522392+00:00
-- elapsed: 514us
-- outcome: success
-- dialect: duckdb
-- node_id: test.dbt_reusability.relationships_stg_orders_customer_id__customer_id__ref_stg_users_.901a8ae09f
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.dbt_reusability.relationships_stg_orders_customer_id__customer_id__ref_stg_users_.901a8ae09f", "profile_name": "dbt_custom", "target_name": "dev"} */

    
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
    from "dev"."main"."stg_users"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



  
  
      
    ) dbt_internal_test;

-- created_at: 2026-10-25T09:07:55.523728+00:00
-- finished_at: 2026-10-25T09:07:55.524675+00:00
-- elapsed: 947us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_reusability.user_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_reusability.user_orders", "profile_name": "dbt_custom", "target_name": "dev"} */

  
    
    
    create  table
      "dev"."main"."user_orders__dbt_tmp"
  
    as (
      

select
    o.order_id,
    o.customer_id,
    u.customer_name,
    o.amount,
    o.order_status,
    o.order_date
from "dev"."main"."stg_orders" o
join "dev"."main"."stg_users" u on o.customer_id = u.customer_id
    );
  
    
  ;

-- created_at: 2026-10-25T09:07:55.524942+00:00
-- finished_at: 2026-10-25T09:07:55.525078+00:00
-- elapsed: 136us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_reusability.user_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_reusability.user_orders", "profile_name": "dbt_custom", "target_name": "dev"} */

    SELECT index_name
    FROM duckdb_indexes()
    WHERE schema_name = 'main'
      AND table_name = 'user_orders'
  ;

-- created_at: 2026-10-25T09:07:55.525311+00:00
-- finished_at: 2026-10-25T09:07:55.525448+00:00
-- elapsed: 137us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_reusability.user_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_reusability.user_orders", "profile_name": "dbt_custom", "target_name": "dev"} */

    SELECT COUNT(*) as remaining_indexes
    FROM duckdb_indexes()
    WHERE schema_name = 'main'
      AND table_name = 'user_orders'
  ;

-- created_at: 2026-10-25T09:07:55.525918+00:00
-- finished_at: 2026-10-25T09:07:55.526041+00:00
-- elapsed: 123us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_reusability.user_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_reusability.user_orders", "profile_name": "dbt_custom", "target_name": "dev"} */
alter view "dev"."main"."user_orders" rename to "user_orders__dbt_backup";

-- created_at: 2026-10-25T09:07:55.526462+00:00
-- finished_at: 2026-10-25T09:07:55.526561+00:00
-- elapsed: 99us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_reusability.user_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_reusability.user_orders", "profile_name": "dbt_custom", "target_name": "dev"} */
alter table "dev"."main"."user_orders__dbt_tmp" rename to "user_orders";

-- created_at: 2026-10-25T09:07:55.527238+00:00
-- finished_at: 2026-10-25T09:07:55.527333+00:00
-- elapsed: 95us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_reusability.user_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_reusability.user_orders", "profile_name": "dbt_custom", "target_name": "dev"} */

      drop view if exists "dev"."main"."user_orders__dbt_backup" cascade
    ;

-- created_at: 2026-10-25T09:07:55.528824+00:00
-- finished_at: 2026-10-25T09:07:55.529018+00:00
-- elapsed: 194us
-- outcome: success
-- dialect: duckdb
-- node_id: test.dbt_reusability.not_null_user_orders_order_id.30ed18842c
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.dbt_reusability.not_null_user_orders_order_id.30ed18842c", "profile_name": "dbt_custom", "target_name": "dev"} */

    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select order_id
from "dev"."main"."user_orders"
where order_id is null



  
  
      
    ) dbt_internal_test;

-- created_at: 2026-10-25T09:07:55.528924+00:00
-- finished_at: 2026-10-25T09:07:55.529170+00:00
-- elapsed: 246us
-- outcome: success
-- dialect: duckdb
-- node_id: test.dbt_reusability.unique_user_orders_order_id.95f1522a60
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.dbt_reusability.unique_user_orders_order_id.95f1522a60", "profile_name": "dbt_custom", "target_name": "dev"} */

    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    order_id as unique_field,
    count(*) as n_records

from "dev"."main"."user_orders"
where order_id is not null
group by order_id
having count(*) > 1



  
  
      
    ) dbt_internal_test;

