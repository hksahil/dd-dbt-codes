
  
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
