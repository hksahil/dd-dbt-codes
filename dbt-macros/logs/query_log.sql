-- created_at: 2026-10-25T11:00:22.449927+00:00
-- finished_at: 2026-10-25T11:00:22.450548+00:00
-- elapsed: 621us
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

-- created_at: 2026-10-25T11:00:22.450893+00:00
-- finished_at: 2026-10-25T11:00:22.451108+00:00
-- elapsed: 215us
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

-- created_at: 2026-10-25T11:00:22.451225+00:00
-- finished_at: 2026-10-25T11:00:22.451330+00:00
-- elapsed: 105us
-- outcome: success
-- dialect: duckdb
-- node_id: not available
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "connection_name": "", "dbt_version": "2.0.0", "profile_name": "dbt_custom", "target_name": "dev"} */

    
    
        create schema if not exists "dev"."main"
    ;

-- created_at: 2026-10-25T11:00:22.460810+00:00
-- finished_at: 2026-10-25T11:00:22.462647+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_macros.demo_macro_conversions
-- query_id: not available
-- desc: get_relation > list_relations call
SELECT table_catalog, table_schema, table_name, table_type FROM information_schema.tables WHERE table_schema = 'main' AND lower(table_catalog) = lower('dev');

-- created_at: 2026-10-25T11:00:22.464239+00:00
-- finished_at: 2026-10-25T11:00:22.467488+00:00
-- elapsed: 3ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_macros.demo_macro_conversions
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_macros.demo_macro_conversions", "profile_name": "dbt_custom", "target_name": "dev"} */

  
    
    
    create  table
      "dev"."main"."demo_macro_conversions__dbt_tmp"
  
    as (
      

select
    o.order_id,
    upper(trim(u.name)) as customer_name_cleaned,
    o.amount as raw_amount_cents,
    -- Macro converts cents to dollars:
    round(o.amount / 100.0, 2) as amount_dollars
from "dev"."main"."orders" o
left join "dev"."main"."users" u on o.user_id = u.id
    );
  
    
  ;

-- created_at: 2026-10-25T11:00:22.467944+00:00
-- finished_at: 2026-10-25T11:00:22.468158+00:00
-- elapsed: 214us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_macros.demo_macro_conversions
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_macros.demo_macro_conversions", "profile_name": "dbt_custom", "target_name": "dev"} */

    SELECT index_name
    FROM duckdb_indexes()
    WHERE schema_name = 'main'
      AND table_name = 'demo_macro_conversions'
  ;

-- created_at: 2026-10-25T11:00:22.468464+00:00
-- finished_at: 2026-10-25T11:00:22.468659+00:00
-- elapsed: 195us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_macros.demo_macro_conversions
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_macros.demo_macro_conversions", "profile_name": "dbt_custom", "target_name": "dev"} */

    SELECT COUNT(*) as remaining_indexes
    FROM duckdb_indexes()
    WHERE schema_name = 'main'
      AND table_name = 'demo_macro_conversions'
  ;

-- created_at: 2026-10-25T11:00:22.469265+00:00
-- finished_at: 2026-10-25T11:00:22.469452+00:00
-- elapsed: 187us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_macros.demo_macro_conversions
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_macros.demo_macro_conversions", "profile_name": "dbt_custom", "target_name": "dev"} */
alter table "dev"."main"."demo_macro_conversions" rename to "demo_macro_conversions__dbt_backup";

-- created_at: 2026-10-25T11:00:22.470006+00:00
-- finished_at: 2026-10-25T11:00:22.470142+00:00
-- elapsed: 136us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_macros.demo_macro_conversions
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_macros.demo_macro_conversions", "profile_name": "dbt_custom", "target_name": "dev"} */
alter table "dev"."main"."demo_macro_conversions__dbt_tmp" rename to "demo_macro_conversions";

-- created_at: 2026-10-25T11:00:22.471364+00:00
-- finished_at: 2026-10-25T11:00:22.471770+00:00
-- elapsed: 406us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_macros.demo_macro_conversions
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_macros.demo_macro_conversions", "profile_name": "dbt_custom", "target_name": "dev"} */

      drop table if exists "dev"."main"."demo_macro_conversions__dbt_backup" cascade
    ;

