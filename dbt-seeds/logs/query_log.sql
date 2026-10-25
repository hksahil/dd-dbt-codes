-- created_at: 2026-10-25T10:15:20.833383+00:00
-- finished_at: 2026-10-25T10:15:20.833857+00:00
-- elapsed: 474us
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

-- created_at: 2026-10-25T10:15:20.834174+00:00
-- finished_at: 2026-10-25T10:15:20.834383+00:00
-- elapsed: 209us
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

-- created_at: 2026-10-25T10:15:20.834488+00:00
-- finished_at: 2026-10-25T10:15:20.834584+00:00
-- elapsed: 96us
-- outcome: success
-- dialect: duckdb
-- node_id: not available
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "connection_name": "", "dbt_version": "2.0.0", "profile_name": "dbt_custom", "target_name": "dev"} */

    
    
        create schema if not exists "dev"."main"
    ;

-- created_at: 2026-10-25T10:15:20.838812+00:00
-- finished_at: 2026-10-25T10:15:20.840800+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.user_orders
-- query_id: not available
-- desc: get_relation > list_relations call
SELECT table_catalog, table_schema, table_name, table_type FROM information_schema.tables WHERE table_schema = 'main' AND lower(table_catalog) = lower('dev');

-- created_at: 2026-10-25T10:15:20.840472+00:00
-- finished_at: 2026-10-25T10:15:20.841862+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.dim_orders_with_status
-- query_id: not available
-- desc: get_relation > list_relations call
SELECT table_catalog, table_schema, table_name, table_type FROM information_schema.tables WHERE table_schema = 'main' AND lower(table_catalog) = lower('dev');

-- created_at: 2026-10-25T10:15:20.842858+00:00
-- finished_at: 2026-10-25T10:15:20.843325+00:00
-- elapsed: 467us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.user_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.user_orders", "profile_name": "dbt_custom", "target_name": "dev"} */

  
  create view "dev"."main"."user_orders__dbt_tmp" as (
    select
*
from users u
  );
;

-- created_at: 2026-10-25T10:15:20.844212+00:00
-- finished_at: 2026-10-25T10:15:20.844460+00:00
-- elapsed: 248us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.user_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.user_orders", "profile_name": "dbt_custom", "target_name": "dev"} */
alter table "dev"."main"."user_orders" rename to "user_orders__dbt_backup";

-- created_at: 2026-10-25T10:15:20.843710+00:00
-- finished_at: 2026-10-25T10:15:20.845278+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.dim_orders_with_status
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.dim_orders_with_status", "profile_name": "dbt_custom", "target_name": "dev"} */

  
    
    
    create  table
      "dev"."main"."dim_orders_with_status__dbt_tmp"
  
    as (
      

select
*
from orders o
left join "dev"."main"."country_codes" c
    on c.country_code = 'US'
    );
  
    
  ;

-- created_at: 2026-10-25T10:15:20.845173+00:00
-- finished_at: 2026-10-25T10:15:20.845370+00:00
-- elapsed: 197us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.user_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.user_orders", "profile_name": "dbt_custom", "target_name": "dev"} */
alter view "dev"."main"."user_orders__dbt_tmp" rename to "user_orders";

-- created_at: 2026-10-25T10:15:20.845988+00:00
-- finished_at: 2026-10-25T10:15:20.846376+00:00
-- elapsed: 388us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.dim_orders_with_status
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.dim_orders_with_status", "profile_name": "dbt_custom", "target_name": "dev"} */

    SELECT index_name
    FROM duckdb_indexes()
    WHERE schema_name = 'main'
      AND table_name = 'dim_orders_with_status'
  ;

-- created_at: 2026-10-25T10:15:20.846947+00:00
-- finished_at: 2026-10-25T10:15:20.847524+00:00
-- elapsed: 577us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.user_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.user_orders", "profile_name": "dbt_custom", "target_name": "dev"} */

      drop table if exists "dev"."main"."user_orders__dbt_backup" cascade
    ;

-- created_at: 2026-10-25T10:15:20.847099+00:00
-- finished_at: 2026-10-25T10:15:20.848172+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.dim_orders_with_status
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.dim_orders_with_status", "profile_name": "dbt_custom", "target_name": "dev"} */

    SELECT COUNT(*) as remaining_indexes
    FROM duckdb_indexes()
    WHERE schema_name = 'main'
      AND table_name = 'dim_orders_with_status'
  ;

-- created_at: 2026-10-25T10:15:20.849101+00:00
-- finished_at: 2026-10-25T10:15:20.849444+00:00
-- elapsed: 343us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.dim_orders_with_status
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.dim_orders_with_status", "profile_name": "dbt_custom", "target_name": "dev"} */
alter table "dev"."main"."dim_orders_with_status" rename to "dim_orders_with_status__dbt_backup";

-- created_at: 2026-10-25T10:15:20.850215+00:00
-- finished_at: 2026-10-25T10:15:20.850659+00:00
-- elapsed: 444us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.dim_orders_with_status
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.dim_orders_with_status", "profile_name": "dbt_custom", "target_name": "dev"} */
alter table "dev"."main"."dim_orders_with_status__dbt_tmp" rename to "dim_orders_with_status";

-- created_at: 2026-10-25T10:15:20.852348+00:00
-- finished_at: 2026-10-25T10:15:20.852658+00:00
-- elapsed: 310us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.dim_orders_with_status
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.dim_orders_with_status", "profile_name": "dbt_custom", "target_name": "dev"} */

      drop table if exists "dev"."main"."dim_orders_with_status__dbt_backup" cascade
    ;

