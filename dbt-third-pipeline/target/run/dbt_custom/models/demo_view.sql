
  
  create view "dev"."main"."demo_view__dbt_tmp" as (
    with __dbt__cte__demo_ephemeral as (


-- Ephemeral: Exists ONLY within dbt as a reusable CTE (Common Table Expression).
-- It is NEVER created as a table or view in DuckDB.
select
    id as user_id,
    name as user_name,
    upper(name) as user_name_clean
from users
)
--EPHEMERAL-SELECT-WRAPPER-START
select * from (


-- View: Recomputed on each query; created in DuckDB as a VIEW.
-- Notice how referencing an ephemeral model embeds it as an inline CTE.
select
    u.user_id,
    u.user_name_clean,
    o.order_id,
    o.amount
from __dbt__cte__demo_ephemeral u
join orders o
    on u.user_id = o.user_id
--EPHEMERAL-SELECT-WRAPPER-END
)
  );
