-- created_at: 2026-10-24T11:13:36.967449+00:00
-- finished_at: 2026-10-24T11:13:36.973840+00:00
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

-- created_at: 2026-10-24T11:13:36.977578+00:00
-- finished_at: 2026-10-24T11:13:36.978738+00:00
-- elapsed: 1ms
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

-- created_at: 2026-10-24T11:13:36.979747+00:00
-- finished_at: 2026-10-24T11:13:36.980810+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: not available
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "connection_name": "", "dbt_version": "2.0.0", "profile_name": "dbt_custom", "target_name": "dev"} */

    
    
        create schema if not exists "dev"."main"
    ;

-- created_at: 2026-10-24T11:13:37.029373+00:00
-- finished_at: 2026-10-24T11:13:37.039404+00:00
-- elapsed: 10ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.stg_orders
-- query_id: not available
-- desc: get_relation > list_relations call
SELECT table_catalog, table_schema, table_name, table_type FROM information_schema.tables WHERE table_schema = 'main' AND lower(table_catalog) = lower('dev');

-- created_at: 2026-10-24T11:13:37.029355+00:00
-- finished_at: 2026-10-24T11:13:37.039404+00:00
-- elapsed: 10ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.stg_users
-- query_id: not available
-- desc: get_relation > list_relations call
SELECT table_catalog, table_schema, table_name, table_type FROM information_schema.tables WHERE table_schema = 'main' AND lower(table_catalog) = lower('dev');

-- created_at: 2026-10-24T11:13:37.043961+00:00
-- finished_at: 2026-10-24T11:13:37.045202+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.stg_users
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.stg_users", "profile_name": "dbt_custom", "target_name": "dev"} */

  
  create view "dev"."main"."stg_users__dbt_tmp" as (
    -- Staging model: basic cleaning, renaming, and string transformations
select
    id as user_id,
    name as user_name,
    lower(trim(name)) as user_name_normalized,
    upper(name) as user_name_uppercase
from users
  );
;

-- created_at: 2026-10-24T11:13:37.043961+00:00
-- finished_at: 2026-10-24T11:13:37.045253+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.stg_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.stg_orders", "profile_name": "dbt_custom", "target_name": "dev"} */

  
  create view "dev"."main"."stg_orders__dbt_tmp" as (
    -- Staging model: type casting, foreign key mapping, and tier classification
select
    id as order_id,
    id - 100 as user_id,
    cast(amount as double) as amount_usd,
    case
        when amount >= 100 then 'High Value'
        when amount >= 50 then 'Medium Value'
        else 'Low Value'
    end as order_tier
from orders
  );
;

-- created_at: 2026-10-24T11:13:37.047435+00:00
-- finished_at: 2026-10-24T11:13:37.047933+00:00
-- elapsed: 498us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.stg_users
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.stg_users", "profile_name": "dbt_custom", "target_name": "dev"} */
alter view "dev"."main"."stg_users" rename to "stg_users__dbt_backup";

-- created_at: 2026-10-24T11:13:37.047436+00:00
-- finished_at: 2026-10-24T11:13:37.048125+00:00
-- elapsed: 689us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.stg_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.stg_orders", "profile_name": "dbt_custom", "target_name": "dev"} */
alter table "dev"."main"."stg_orders" rename to "stg_orders__dbt_backup";

-- created_at: 2026-10-24T11:13:37.048947+00:00
-- finished_at: 2026-10-24T11:13:37.049239+00:00
-- elapsed: 292us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.stg_users
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.stg_users", "profile_name": "dbt_custom", "target_name": "dev"} */
alter view "dev"."main"."stg_users__dbt_tmp" rename to "stg_users";

-- created_at: 2026-10-24T11:13:37.049089+00:00
-- finished_at: 2026-10-24T11:13:37.049464+00:00
-- elapsed: 375us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.stg_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.stg_orders", "profile_name": "dbt_custom", "target_name": "dev"} */
alter view "dev"."main"."stg_orders__dbt_tmp" rename to "stg_orders";

-- created_at: 2026-10-24T11:13:37.050942+00:00
-- finished_at: 2026-10-24T11:13:37.052612+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.stg_orders
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.stg_orders", "profile_name": "dbt_custom", "target_name": "dev"} */

      drop table if exists "dev"."main"."stg_orders__dbt_backup" cascade
    ;

-- created_at: 2026-10-24T11:13:37.050943+00:00
-- finished_at: 2026-10-24T11:13:37.052733+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.stg_users
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.stg_users", "profile_name": "dbt_custom", "target_name": "dev"} */

      drop view if exists "dev"."main"."stg_users__dbt_backup" cascade
    ;

-- created_at: 2026-10-24T11:13:37.069995+00:00
-- finished_at: 2026-10-24T11:13:37.071503+00:00
-- elapsed: 1ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.int_user_order_metrics
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.int_user_order_metrics", "profile_name": "dbt_custom", "target_name": "dev"} */

  
  create view "dev"."main"."int_user_order_metrics__dbt_tmp" as (
    -- Intermediate model: user-level metrics & aggregations using dbt ref()
select
    u.user_id,
    u.user_name,
    count(o.order_id) as total_orders,
    coalesce(sum(o.amount_usd), 0.0) as total_spent,
    coalesce(avg(o.amount_usd), 0.0) as avg_order_value,
    coalesce(max(o.amount_usd), 0.0) as max_order_amount,
    case
        when coalesce(sum(o.amount_usd), 0.0) >= 100 then 'VIP'
        else 'Standard'
    end as customer_segment
from "dev"."main"."stg_users" u
left join "dev"."main"."stg_orders" o
    on u.user_id = o.user_id
group by
    u.user_id,
    u.user_name
  );
;

-- created_at: 2026-10-24T11:13:37.072726+00:00
-- finished_at: 2026-10-24T11:13:37.073025+00:00
-- elapsed: 299us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.int_user_order_metrics
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.int_user_order_metrics", "profile_name": "dbt_custom", "target_name": "dev"} */
alter view "dev"."main"."int_user_order_metrics" rename to "int_user_order_metrics__dbt_backup";

-- created_at: 2026-10-24T11:13:37.074011+00:00
-- finished_at: 2026-10-24T11:13:37.074260+00:00
-- elapsed: 249us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.int_user_order_metrics
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.int_user_order_metrics", "profile_name": "dbt_custom", "target_name": "dev"} */
alter view "dev"."main"."int_user_order_metrics__dbt_tmp" rename to "int_user_order_metrics";

-- created_at: 2026-10-24T11:13:37.076332+00:00
-- finished_at: 2026-10-24T11:13:37.076762+00:00
-- elapsed: 430us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.int_user_order_metrics
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.int_user_order_metrics", "profile_name": "dbt_custom", "target_name": "dev"} */

      drop view if exists "dev"."main"."int_user_order_metrics__dbt_backup" cascade
    ;

-- created_at: 2026-10-24T11:13:37.071901+00:00
-- finished_at: 2026-10-24T11:13:37.089168+00:00
-- elapsed: 17ms
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.fct_user_orders_analytics
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.fct_user_orders_analytics", "profile_name": "dbt_custom", "target_name": "dev"} */

  
    
    
    create  table
      "dev"."main"."fct_user_orders_analytics__dbt_tmp"
  
    as (
      -- Advanced Analytics Mart: Materialized as a Table with Window Functions & DuckDB SQL


with user_orders as (
    select
        u.user_id,
        u.user_name,
        o.order_id,
        o.amount_usd,
        o.order_tier
    from "dev"."main"."stg_users" u
    join "dev"."main"."stg_orders" o
        on u.user_id = o.user_id
)

select
    user_id,
    user_name,
    order_id,
    amount_usd,
    order_tier,
    -- Window Function: Global ranking of orders by amount
    dense_rank() over (order by amount_usd desc) as order_amount_rank,
    -- Window Function: Cumulative running spend per customer
    sum(amount_usd) over (
        partition by user_id
        order by order_id
        rows between unbounded preceding and current row
    ) as running_spend,
    -- Analytical Window: Share of total company revenue (%)
    round(100.0 * amount_usd / sum(amount_usd) over (), 2)
        as pct_of_total_revenue,
    -- DuckDB Modern SQL: List of order IDs per customer
    list(order_id) over (partition by user_id) as customer_all_order_ids
from user_orders
    );
  
    
  ;

-- created_at: 2026-10-24T11:13:37.090340+00:00
-- finished_at: 2026-10-24T11:13:37.090938+00:00
-- elapsed: 598us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.fct_user_orders_analytics
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.fct_user_orders_analytics", "profile_name": "dbt_custom", "target_name": "dev"} */

    SELECT index_name
    FROM duckdb_indexes()
    WHERE schema_name = 'main'
      AND table_name = 'fct_user_orders_analytics'
  ;

-- created_at: 2026-10-24T11:13:37.091683+00:00
-- finished_at: 2026-10-24T11:13:37.092170+00:00
-- elapsed: 487us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.fct_user_orders_analytics
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.fct_user_orders_analytics", "profile_name": "dbt_custom", "target_name": "dev"} */

    SELECT COUNT(*) as remaining_indexes
    FROM duckdb_indexes()
    WHERE schema_name = 'main'
      AND table_name = 'fct_user_orders_analytics'
  ;

-- created_at: 2026-10-24T11:13:37.093437+00:00
-- finished_at: 2026-10-24T11:13:37.093763+00:00
-- elapsed: 326us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.fct_user_orders_analytics
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.fct_user_orders_analytics", "profile_name": "dbt_custom", "target_name": "dev"} */
alter table "dev"."main"."fct_user_orders_analytics" rename to "fct_user_orders_analytics__dbt_backup";

-- created_at: 2026-10-24T11:13:37.094893+00:00
-- finished_at: 2026-10-24T11:13:37.095447+00:00
-- elapsed: 554us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.fct_user_orders_analytics
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.fct_user_orders_analytics", "profile_name": "dbt_custom", "target_name": "dev"} */
alter table "dev"."main"."fct_user_orders_analytics__dbt_tmp" rename to "fct_user_orders_analytics";

-- created_at: 2026-10-24T11:13:37.098755+00:00
-- finished_at: 2026-10-24T11:13:37.099453+00:00
-- elapsed: 698us
-- outcome: success
-- dialect: duckdb
-- node_id: model.dbt_custom.fct_user_orders_analytics
-- query_id: not available
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_custom.fct_user_orders_analytics", "profile_name": "dbt_custom", "target_name": "dev"} */

      drop table if exists "dev"."main"."fct_user_orders_analytics__dbt_backup" cascade
    ;

