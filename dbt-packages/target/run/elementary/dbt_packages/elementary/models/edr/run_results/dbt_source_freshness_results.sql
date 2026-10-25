
  
    
    
    create temporary table
      "dbt_source_freshness_results__dbt_tmp_0478bfef_6ef3_4172_99d5_28cfe746d9af"
  
    as (
      


    select * from (
            select
            
                
        cast('dummy_string' as varchar(4096)) as source_freshness_execution_id

,
                
        cast('dummy_string' as varchar(4096)) as unique_id

,
                
        cast('dummy_string' as varchar(4096)) as max_loaded_at

,
                
        cast('dummy_string' as varchar(4096)) as snapshotted_at

,
                
        cast('dummy_string' as varchar(4096)) as generated_at

,
                cast('2091-02-17' as timestamp) as created_at

,
                
        cast(123456789.99 as float) as max_loaded_at_time_ago_in_s

,
                
        cast('dummy_string' as varchar(4096)) as status

,
                
        cast('dummy_string' as varchar(4096)) as error

,
                
        cast('dummy_string' as varchar(4096)) as compile_started_at

,
                
        cast('dummy_string' as varchar(4096)) as compile_completed_at

,
                
        cast('dummy_string' as varchar(4096)) as execute_started_at

,
                
        cast('dummy_string' as varchar(4096)) as execute_completed_at

,
                
        cast('dummy_string' as varchar(4096)) as invocation_id

,
                
        cast('dummy_string' as varchar(4096)) as warn_after

,
                
        cast('dummy_string' as varchar(4096)) as error_after

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as filter


        ) as empty_table
        where 1 = 0

    );
  
    
  ;

        
            delete from "dev"."main"."dbt_source_freshness_results"
            where (
                source_freshness_execution_id) in (
                select (source_freshness_execution_id)
                from "dbt_source_freshness_results__dbt_tmp_0478bfef_6ef3_4172_99d5_28cfe746d9af"
            );

        
    

    insert into "dev"."main"."dbt_source_freshness_results" ("source_freshness_execution_id", "unique_id", "max_loaded_at", "snapshotted_at", "generated_at", "created_at", "max_loaded_at_time_ago_in_s", "status", "error", "compile_started_at", "compile_completed_at", "execute_started_at", "execute_completed_at", "invocation_id", "warn_after", "error_after", "filter")
    (
        select "source_freshness_execution_id", "unique_id", "max_loaded_at", "snapshotted_at", "generated_at", "created_at", "max_loaded_at_time_ago_in_s", "status", "error", "compile_started_at", "compile_completed_at", "execute_started_at", "execute_completed_at", "invocation_id", "warn_after", "error_after", "filter"
        from "dbt_source_freshness_results__dbt_tmp_0478bfef_6ef3_4172_99d5_28cfe746d9af"
    )
  