-- created_at: 2026-10-31T09:21:17.088186+00:00
-- finished_at: 2026-10-31T09:21:17.089488+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: not available
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "connection_name": "", "dbt_version": "2.0.0", "profile_name": "dbt_custom", "target_name": "staging"} */

    
    select schema_name
    from system.information_schema.schemata
    
    where lower(catalog_name) = '"staging"'
    
  
  ;

-- created_at: 2026-10-31T09:21:17.092752+00:00
-- finished_at: 2026-10-31T09:21:17.093006+00:00
-- elapsed: 254us
-- outcome: success
-- dialect: duckdb
-- node_id: not available
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "connection_name": "", "dbt_version": "2.0.0", "profile_name": "dbt_custom", "target_name": "staging"} */

    
        select type from duckdb_databases()
        where lower(database_name)='staging'
        and type='sqlite'
    
  ;

-- created_at: 2026-10-31T09:21:17.093498+00:00
-- finished_at: 2026-10-31T09:21:17.093740+00:00
-- elapsed: 242us
-- outcome: success
-- dialect: duckdb
-- node_id: not available
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "connection_name": "", "dbt_version": "2.0.0", "profile_name": "dbt_custom", "target_name": "staging"} */

    
    
        create schema if not exists "staging"."main"
    ;

-- created_at: 2026-10-31T09:21:17.132118+00:00
-- finished_at: 2026-10-31T09:21:17.135137+00:00
-- elapsed: 3ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.user_orders
-- query_id: not available
-- desc: get_relation > list_relations call
SELECT table_catalog, table_schema, table_name, table_type FROM information_schema.tables WHERE table_schema = 'main' AND lower(table_catalog) = lower('staging');

-- created_at: 2026-10-31T09:21:17.136617+00:00
-- finished_at: 2026-10-31T09:21:17.136803+00:00
-- elapsed: 186us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.user_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.user_orders", "profile_name": "dbt_custom", "target_name": "staging"} */

        CREATE TABLE IF NOT EXISTS dbt_audit_logs (event_type VARCHAR, model_name VARCHAR, logged_at TIMESTAMP);
      ;

-- created_at: 2026-10-31T09:21:17.137178+00:00
-- finished_at: 2026-10-31T09:21:17.137961+00:00
-- elapsed: 783us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.user_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.user_orders", "profile_name": "dbt_custom", "target_name": "staging"} */

        INSERT INTO dbt_audit_logs VALUES ('MODEL_START', 'user_orders', current_timestamp);
      ;

-- created_at: 2026-10-31T09:21:17.138823+00:00
-- finished_at: 2026-10-31T09:21:17.139035+00:00
-- elapsed: 212us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.user_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.user_orders", "profile_name": "dbt_custom", "target_name": "staging"} */

  
  create view "staging"."main"."user_orders__dbt_tmp" as (
    -- dbt-bp/models/user_orders.sql


-- ========================================================
-- BEST PRACTICES DEMONSTRATED:
-- 1. Tags: tags=['core', 'daily'] (run via: dbt run --select tag:core)
-- 2. Hooks: pre_hook (before model builds) & post_hook (after model builds)
-- 3. Variables: 10
-- 4. Target Awareness: conditional logic based on target.name
-- ========================================================

select
    u.id as user_id,
    u.name as user_name,
    o.order_id,
    o.amount,
    o.status
from users u
join orders o on u.id = o.user_id
where o.amount >= 10

  );
;

-- created_at: 2026-10-31T09:21:17.139966+00:00
-- finished_at: 2026-10-31T09:21:17.140110+00:00
-- elapsed: 144us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.user_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.user_orders", "profile_name": "dbt_custom", "target_name": "staging"} */
alter view "staging"."main"."user_orders" rename to "user_orders__dbt_backup";

-- created_at: 2026-10-31T09:21:17.140659+00:00
-- finished_at: 2026-10-31T09:21:17.140778+00:00
-- elapsed: 119us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.user_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.user_orders", "profile_name": "dbt_custom", "target_name": "staging"} */
alter view "staging"."main"."user_orders__dbt_tmp" rename to "user_orders";

-- created_at: 2026-10-31T09:21:17.141362+00:00
-- finished_at: 2026-10-31T09:21:17.141651+00:00
-- elapsed: 289us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.user_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.user_orders", "profile_name": "dbt_custom", "target_name": "staging"} */

        INSERT INTO dbt_audit_logs VALUES ('MODEL_END', 'user_orders', current_timestamp);
      ;

-- created_at: 2026-10-31T09:21:17.142333+00:00
-- finished_at: 2026-10-31T09:21:17.142453+00:00
-- elapsed: 120us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.user_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.user_orders", "profile_name": "dbt_custom", "target_name": "staging"} */

      drop view if exists "staging"."main"."user_orders__dbt_backup" cascade
    ;

