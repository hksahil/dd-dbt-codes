{{ config(materialized='ephemeral') }}

-- Ephemeral: Exists ONLY within dbt as a reusable CTE (Common Table Expression).
-- It is NEVER created as a table or view in DuckDB.
select
    id as user_id,
    name as user_name,
    upper(name) as user_name_clean
from users
