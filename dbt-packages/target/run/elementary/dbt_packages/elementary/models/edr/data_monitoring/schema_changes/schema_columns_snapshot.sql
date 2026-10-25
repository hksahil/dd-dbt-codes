
  
    
    
    create temporary table
      "schema_columns_snapshot__dbt_tmp_21c478dc_0217_4cf1_be64_be3b377fb2bb"
  
    as (
      


    select * from (
            select
            
                
        cast('dummy_string' as varchar(4096)) as column_state_id

,
                
        cast('dummy_string' as varchar(4096)) as full_column_name

,
                
        cast('dummy_string' as varchar(4096)) as full_table_name

,
                
        cast('dummy_string' as varchar(4096)) as column_name

,
                
        cast('dummy_string' as varchar(4096)) as data_type

,
                
        cast (True as boolean) as is_new

,
                cast('2091-02-17' as timestamp) as detected_at

,
                cast('2091-02-17' as timestamp) as created_at


        ) as empty_table
        where 1 = 0

    );
  
    
  ;

        
            delete from "dev"."main"."schema_columns_snapshot"
            where (
                column_state_id) in (
                select (column_state_id)
                from "schema_columns_snapshot__dbt_tmp_21c478dc_0217_4cf1_be64_be3b377fb2bb"
            );

        
    

    insert into "dev"."main"."schema_columns_snapshot" ("column_state_id", "full_column_name", "full_table_name", "column_name", "data_type", "is_new", "detected_at", "created_at")
    (
        select "column_state_id", "full_column_name", "full_table_name", "column_name", "data_type", "is_new", "detected_at", "created_at"
        from "schema_columns_snapshot__dbt_tmp_21c478dc_0217_4cf1_be64_be3b377fb2bb"
    )
  