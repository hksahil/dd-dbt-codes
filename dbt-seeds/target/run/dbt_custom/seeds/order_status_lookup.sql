 -- noqa: Should accept a string instead of a integer
    
    
    truncate table "dev"."main"."order_status_lookup";
    -- dbt seed --
    
          COPY "dev"."main"."order_status_lookup" FROM '/Users/seal/Desktop/dbt-duckdb/dbt-seeds/seeds/order_status_lookup.csv' (FORMAT CSV, HEADER TRUE, DELIMITER ',')
        

;
  