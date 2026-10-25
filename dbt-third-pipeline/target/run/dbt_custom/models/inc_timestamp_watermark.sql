
  
    
    
    create temporary table
      "inc_timestamp_watermark__dbt_tmp_6f140437_296d_408f_ae5a_f40617f4a1e5"
  
    as (
      



select
    order_id,
    user_id,
    amount,
    status,
    order_date,
    -- Tracks when dbt processed/updated this version in the warehouse:
    current_timestamp as dbt_loaded_at
from "dev"."main"."orders"


    -- WATERMARK FILTER:
    -- Only scan source records whose date is on or after the max date in this table.
    -- In production with high data volumes, add a lookback window (e.g. - 3 days):
    where order_date >= (select coalesce(max(order_date), '1970-01-01') from "dev"."main"."inc_timestamp_watermark")

    );
  
    
  ;


    MERGE INTO "dev"."main"."inc_timestamp_watermark" AS DBT_INTERNAL_DEST
        USING "inc_timestamp_watermark__dbt_tmp_6f140437_296d_408f_ae5a_f40617f4a1e5" AS DBT_INTERNAL_SOURCE
        
            
                
            
        
        ON (DBT_INTERNAL_SOURCE.order_id = DBT_INTERNAL_DEST.order_id)
    
    WHEN MATCHED
    THEN
        UPDATE BY NAME
    WHEN NOT MATCHED
        
    THEN
        INSERT BY NAME

  