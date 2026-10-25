{{ config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key='order_id'
) }}

{#
  ==============================================================================
  INCREMENTAL STRATEGY: TIMESTAMP WATERMARK + MERGE KEY PATTERN
  ==============================================================================
  This model solves the classic bug where existing orders are updated upstream
  but get missed if you only filter by "order_id > max(order_id)".

  THE TWO DISTINCT KEYS:
  ----------------------
  1. MERGE UNIQUE KEY (unique_key = 'order_id'):
     - Configured in {{ config(...) }}.
     - Generates the SQL MERGE clause: 
       "ON target.order_id = source.order_id"
     - Tells the database engine: "If this order_id already exists, UPDATE it! 
       If it doesn't exist, INSERT it."

  2. TIMESTAMP / WATERMARK KEY (order_date / updated_at):
     - Configured in the "where" clause under {% if is_incremental() %}.
     - Tells dbt: "Only pull candidate records that were created or modified 
       on or after our table's last known watermark."

  WHY BOTH ARE CRITICAL:
  - When customer #1 updates their existing order #101, its order_id stays 101.
  - If we filtered on max(order_id), 101 > 102 would be FALSE, and the update 
    would be lost.
  - With this timestamp filter, order #101 is fetched because its date/timestamp
    is new, and then safely merged into the target table by order_id!
  ==============================================================================
#}

select
    order_id,
    user_id,
    amount,
    status,
    order_date,
    -- Tracks when dbt processed/updated this version in the warehouse:
    current_timestamp as dbt_loaded_at
from {{ source('raw_duckdb', 'orders') }}

{% if is_incremental() %}
    -- WATERMARK FILTER:
    -- Only scan source records whose date is on or after the max date in this table.
    -- In production with high data volumes, add a lookback window (e.g. - 3 days):
    where order_date >= (select coalesce(max(order_date), '1970-01-01') from {{ this }})
{% endif %}
