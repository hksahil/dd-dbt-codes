{{
    config(
        materialized='table',
        pre_hook=[
            "CREATE TABLE IF NOT EXISTS dbt_audit_logs (event_type VARCHAR, model_name VARCHAR, logged_at TIMESTAMP);",
            "INSERT INTO dbt_audit_logs VALUES ('START_RUN', '{{ this.name }}', current_timestamp);"
        ],
        post_hook=[
            "INSERT INTO dbt_audit_logs VALUES ('END_RUN', '{{ this.name }}', current_timestamp);"
        ]
    )
}}

-- ========================================================
-- TEACHING TOPIC: Hooks (pre-hook & post-hook)
-- 1. pre_hook: SQL executed BEFORE this model builds
-- 2. post_hook: SQL executed AFTER this model builds
-- 3. Common uses: Audit logging, vacuuming, grant checks, partition management
-- ========================================================

select
    id as order_id,
    amount,
    current_timestamp as processed_at
from orders
