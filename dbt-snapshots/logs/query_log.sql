-- created_at: 2026-10-25T12:09:03.183500+00:00
-- finished_at: 2026-10-25T12:09:03.184937+00:00
-- elapsed: 1ms
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

-- created_at: 2026-10-25T12:09:03.186347+00:00
-- finished_at: 2026-10-25T12:09:03.186811+00:00
-- elapsed: 464us
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

-- created_at: 2026-10-25T12:09:03.187099+00:00
-- finished_at: 2026-10-25T12:09:03.187346+00:00
-- elapsed: 247us
-- outcome: success
-- dialect: duckdb
-- node_id: not available
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "connection_name": "", "dbt_version": "2.0.0", "profile_name": "dbt_custom", "target_name": "dev"} */

    
    
        create schema if not exists "dev"."main"
    ;

-- created_at: 2026-10-25T12:09:03.198182+00:00
-- finished_at: 2026-10-25T12:09:03.201734+00:00
-- elapsed: 3ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.user_orders
-- query_id: not available
-- desc: get_relation > list_relations call
SELECT table_catalog, table_schema, table_name, table_type FROM information_schema.tables WHERE table_schema = 'main' AND lower(table_catalog) = lower('dev');

-- created_at: 2026-10-25T12:09:03.198282+00:00
-- finished_at: 2026-10-25T12:09:03.201851+00:00
-- elapsed: 3ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.dim_users_scd1
-- query_id: not available
-- desc: get_relation > list_relations call
SELECT table_catalog, table_schema, table_name, table_type FROM information_schema.tables WHERE table_schema = 'main' AND lower(table_catalog) = lower('dev');

-- created_at: 2026-10-25T12:09:03.204936+00:00
-- finished_at: 2026-10-25T12:09:03.205566+00:00
-- elapsed: 630us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.user_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.user_orders", "profile_name": "dbt_custom", "target_name": "dev"} */

  
  create view "dev"."main"."user_orders__dbt_tmp" as (
    select *
from users 
  );
;

-- created_at: 2026-10-25T12:09:03.204343+00:00
-- finished_at: 2026-10-25T12:09:03.205804+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.dim_users_scd1
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.dim_users_scd1", "profile_name": "dbt_custom", "target_name": "dev"} */

  
    
    
    create  table
      "dev"."main"."dim_users_scd1__dbt_tmp"
  
    as (
      

-- SCD Type 1 (Slowly Changing Dimension Type 1)
-- Strategy: Overwrite old values with new values.
-- Result: No historical record is preserved; always reflects the latest state.

select
    id as user_id,
    name as user_name
from "dev"."main"."users"
    );
  
    
  ;

-- created_at: 2026-10-25T12:09:03.205638+00:00
-- finished_at: 2026-10-25T12:09:03.206148+00:00
-- elapsed: 510us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.dim_users_scd3
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.dim_users_scd3", "profile_name": "dbt_custom", "target_name": "dev"} */

  
  create view "dev"."main"."dim_users_scd3__dbt_tmp" as (
    

-- SCD Type 2 (Slowly Changing Dimension Type 2)
-- Strategy: Query the dbt snapshot to expose historical versions alongside the active version.
-- Result: Complete history with surrogate key (user_sk), effective date ranges, and is_current flag.

select
    dbt_scd_id as user_sk,
    id as user_id,
    name as user_name,
    dbt_valid_from as effective_start_date,
    dbt_valid_to as effective_end_date,
    case
        when dbt_valid_to is null then true
        else false
    end as is_current
from "dev"."main"."users_snapshot1"
  );
;

-- created_at: 2026-10-25T12:09:03.206367+00:00
-- finished_at: 2026-10-25T12:09:03.206666+00:00
-- elapsed: 299us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.dim_users_scd1
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.dim_users_scd1", "profile_name": "dbt_custom", "target_name": "dev"} */

    SELECT index_name
    FROM duckdb_indexes()
    WHERE schema_name = 'main'
      AND table_name = 'dim_users_scd1'
  ;

-- created_at: 2026-10-25T12:09:03.206640+00:00
-- finished_at: 2026-10-25T12:09:03.206840+00:00
-- elapsed: 200us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.user_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.user_orders", "profile_name": "dbt_custom", "target_name": "dev"} */
alter view "dev"."main"."user_orders" rename to "user_orders__dbt_backup";

-- created_at: 2026-10-25T12:09:03.207556+00:00
-- finished_at: 2026-10-25T12:09:03.207889+00:00
-- elapsed: 333us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.dim_users_scd3
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.dim_users_scd3", "profile_name": "dbt_custom", "target_name": "dev"} */
alter view "dev"."main"."dim_users_scd3" rename to "dim_users_scd3__dbt_backup";

-- created_at: 2026-10-25T12:09:03.207524+00:00
-- finished_at: 2026-10-25T12:09:03.208051+00:00
-- elapsed: 527us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.dim_users_scd1
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.dim_users_scd1", "profile_name": "dbt_custom", "target_name": "dev"} */

    SELECT COUNT(*) as remaining_indexes
    FROM duckdb_indexes()
    WHERE schema_name = 'main'
      AND table_name = 'dim_users_scd1'
  ;

-- created_at: 2026-10-25T12:09:03.207843+00:00
-- finished_at: 2026-10-25T12:09:03.208072+00:00
-- elapsed: 229us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.user_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.user_orders", "profile_name": "dbt_custom", "target_name": "dev"} */
alter view "dev"."main"."user_orders__dbt_tmp" rename to "user_orders";

-- created_at: 2026-10-25T12:09:03.208686+00:00
-- finished_at: 2026-10-25T12:09:03.208931+00:00
-- elapsed: 245us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.dim_users_scd3
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.dim_users_scd3", "profile_name": "dbt_custom", "target_name": "dev"} */
alter view "dev"."main"."dim_users_scd3__dbt_tmp" rename to "dim_users_scd3";

-- created_at: 2026-10-25T12:09:03.208751+00:00
-- finished_at: 2026-10-25T12:09:03.208997+00:00
-- elapsed: 246us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.dim_users_scd1
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.dim_users_scd1", "profile_name": "dbt_custom", "target_name": "dev"} */
alter table "dev"."main"."dim_users_scd1" rename to "dim_users_scd1__dbt_backup";

-- created_at: 2026-10-25T12:09:03.209245+00:00
-- finished_at: 2026-10-25T12:09:03.209445+00:00
-- elapsed: 200us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.user_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.user_orders", "profile_name": "dbt_custom", "target_name": "dev"} */

      drop view if exists "dev"."main"."user_orders__dbt_backup" cascade
    ;

-- created_at: 2026-10-25T12:09:03.209895+00:00
-- finished_at: 2026-10-25T12:09:03.210056+00:00
-- elapsed: 161us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.dim_users_scd1
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.dim_users_scd1", "profile_name": "dbt_custom", "target_name": "dev"} */
alter table "dev"."main"."dim_users_scd1__dbt_tmp" rename to "dim_users_scd1";

-- created_at: 2026-10-25T12:09:03.210117+00:00
-- finished_at: 2026-10-25T12:09:03.210286+00:00
-- elapsed: 169us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.dim_users_scd3
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.dim_users_scd3", "profile_name": "dbt_custom", "target_name": "dev"} */

      drop view if exists "dev"."main"."dim_users_scd3__dbt_backup" cascade
    ;

-- created_at: 2026-10-25T12:09:03.211175+00:00
-- finished_at: 2026-10-25T12:09:03.211361+00:00
-- elapsed: 186us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.dim_users_scd1
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.dim_users_scd1", "profile_name": "dbt_custom", "target_name": "dev"} */

      drop table if exists "dev"."main"."dim_users_scd1__dbt_backup" cascade
    ;

