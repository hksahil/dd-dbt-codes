
  
    
    
    create temporary table
      "dbt_run_results__dbt_tmp_3f0541a0_bc67_4bfb_8054_05dfcfb818c1"
  
    as (
      

select * from (
            select
            
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as model_execution_id

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as unique_id

,
                
        cast('dummy_string' as varchar(4096)) as invocation_id

,
                
        cast('dummy_string' as varchar(4096)) as generated_at

,
                cast('2091-02-17' as timestamp) as created_at

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as name

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as message

,
                
        cast('dummy_string' as varchar(4096)) as status

,
                
        cast('dummy_string' as varchar(4096)) as resource_type

,
                
        cast(123456789.99 as float) as execution_time

,
                
        cast('dummy_string' as varchar(4096)) as execute_started_at

,
                
        cast('dummy_string' as varchar(4096)) as execute_completed_at

,
                
        cast('dummy_string' as varchar(4096)) as compile_started_at

,
                
        cast('dummy_string' as varchar(4096)) as compile_completed_at

,
                
        cast(31474836478 as bigint) as rows_affected

,
                
        cast (True as boolean) as full_refresh

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as compiled_code

,
                
        cast(31474836478 as bigint) as failures

,
                
        cast('dummy_string' as varchar(4096)) as query_id

,
                
        cast('dummy_string' as varchar(4096)) as thread_id

,
                
        cast('dummy_string' as varchar(4096)) as materialization

,
                
        cast('dummy_string' as varchar(4096)) as adapter_response

,
                
        cast('dummy_string' as varchar(4096)) as group_name


        ) as empty_table
        where 1 = 0
    );
  
    
  ;

        
            delete from "dev"."main"."dbt_run_results"
            where (
                model_execution_id) in (
                select (model_execution_id)
                from "dbt_run_results__dbt_tmp_3f0541a0_bc67_4bfb_8054_05dfcfb818c1"
            );

        
    

    insert into "dev"."main"."dbt_run_results" ("model_execution_id", "unique_id", "invocation_id", "generated_at", "created_at", "name", "message", "status", "resource_type", "execution_time", "execute_started_at", "execute_completed_at", "compile_started_at", "compile_completed_at", "rows_affected", "full_refresh", "compiled_code", "failures", "query_id", "thread_id", "materialization", "adapter_response", "group_name")
    (
        select "model_execution_id", "unique_id", "invocation_id", "generated_at", "created_at", "name", "message", "status", "resource_type", "execution_time", "execute_started_at", "execute_completed_at", "compile_started_at", "compile_completed_at", "rows_affected", "full_refresh", "compiled_code", "failures", "query_id", "thread_id", "materialization", "adapter_response", "group_name"
        from "dbt_run_results__dbt_tmp_3f0541a0_bc67_4bfb_8054_05dfcfb818c1"
    )
  