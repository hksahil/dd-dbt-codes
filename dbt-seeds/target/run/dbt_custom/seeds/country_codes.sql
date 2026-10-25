 -- noqa: Should accept a string instead of a integer
    
    
    truncate table "dev"."main"."country_codes";
    -- dbt seed --
    
          COPY "dev"."main"."country_codes" FROM '/Users/seal/Desktop/dbt-duckdb/dbt-seeds/seeds/country_codes.csv' (FORMAT CSV, HEADER TRUE, DELIMITER ',')
        

;
  