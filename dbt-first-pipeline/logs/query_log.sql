-- created_at: 2026-10-24T10:50:01.066740+00:00
-- finished_at: 2026-10-24T10:50:01.073345+00:00
-- elapsed: 6ms
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

-- created_at: 2026-10-24T10:50:01.078370+00:00
-- finished_at: 2026-10-24T10:50:01.079247+00:00
-- elapsed: 877us
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

-- created_at: 2026-10-24T10:50:01.080252+00:00
-- finished_at: 2026-10-24T10:50:01.081094+00:00
-- elapsed: 842us
-- outcome: success
-- dialect: duckdb
-- node_id: not available
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "connection_name": "", "dbt_version": "2.0.0", "profile_name": "dbt_custom", "target_name": "dev"} */

    
    
        create schema if not exists "dev"."main"
    ;

-- created_at: 2026-10-24T10:50:01.128591+00:00
-- finished_at: 2026-10-24T10:50:01.141145+00:00
-- elapsed: 12ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.user_orders
-- query_id: not available
-- desc: get_relation > list_relations call
SELECT table_catalog, table_schema, table_name, table_type FROM information_schema.tables WHERE table_schema = 'main' AND lower(table_catalog) = lower('dev');

-- created_at: 2026-10-24T10:50:01.148486+00:00
-- finished_at: 2026-10-24T10:50:01.153210+00:00
-- elapsed: 4ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.user_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.user_orders", "profile_name": "dbt_custom", "target_name": "dev"} */

  
  create view "dev"."main"."user_orders__dbt_tmp" as (
    select
    u.name,
    o.id as order_id,
    o.amount
from users u
join orders o on u.id = o.id - 100
  );
;

-- created_at: 2026-10-24T10:50:01.156381+00:00
-- finished_at: 2026-10-24T10:50:01.157082+00:00
-- elapsed: 701us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.user_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.user_orders", "profile_name": "dbt_custom", "target_name": "dev"} */
alter view "dev"."main"."user_orders" rename to "user_orders__dbt_backup";

-- created_at: 2026-10-24T10:50:01.160579+00:00
-- finished_at: 2026-10-24T10:50:01.161166+00:00
-- elapsed: 587us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.user_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.user_orders", "profile_name": "dbt_custom", "target_name": "dev"} */
alter view "dev"."main"."user_orders__dbt_tmp" rename to "user_orders";

-- created_at: 2026-10-24T10:50:01.164337+00:00
-- finished_at: 2026-10-24T10:50:01.165148+00:00
-- elapsed: 811us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.user_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.user_orders", "profile_name": "dbt_custom", "target_name": "dev"} */

      drop view if exists "dev"."main"."user_orders__dbt_backup" cascade
    ;

