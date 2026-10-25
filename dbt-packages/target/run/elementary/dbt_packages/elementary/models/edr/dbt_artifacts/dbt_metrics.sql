
  
    
    
    create temporary table
      "dbt_metrics__dbt_tmp_60adf065_de4b_404b_a679_ff917a885b3f"
  
    as (
      

select * from (
            select
            
                
        cast('dummy_string' as varchar(4096)) as unique_id

,
                
        cast('dummy_string' as varchar(4096)) as name

,
                
        cast('dummy_string' as varchar(4096)) as label

,
                
        cast('dummy_string' as varchar(4096)) as model

,
                
        cast('dummy_string' as varchar(4096)) as type

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as sql

,
                
        cast('dummy_string' as varchar(4096)) as timestamp

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as filters

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as time_grains

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as dimensions

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as depends_on_macros

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as depends_on_nodes

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as description

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as tags

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as meta

,
                
        cast('dummy_string' as varchar(4096)) as package_name

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as original_path

,
                
        cast('dummy_string' as varchar(4096)) as path

,
                
        cast('dummy_string' as varchar(4096)) as generated_at

,
                
        cast('dummy_string' as varchar(4096)) as metadata_hash

,
                
        cast('dummy_string' as varchar(4096)) as group_name


        ) as empty_table
        where 1 = 0
    );
  
    
  ;

        
            delete from "dev"."main"."dbt_metrics"
            where (
                unique_id) in (
                select (unique_id)
                from "dbt_metrics__dbt_tmp_60adf065_de4b_404b_a679_ff917a885b3f"
            );

        
    

    insert into "dev"."main"."dbt_metrics" ("unique_id", "name", "label", "model", "type", "sql", "timestamp", "filters", "time_grains", "dimensions", "depends_on_macros", "depends_on_nodes", "description", "tags", "meta", "package_name", "original_path", "path", "generated_at", "metadata_hash", "group_name")
    (
        select "unique_id", "name", "label", "model", "type", "sql", "timestamp", "filters", "time_grains", "dimensions", "depends_on_macros", "depends_on_nodes", "description", "tags", "meta", "package_name", "original_path", "path", "generated_at", "metadata_hash", "group_name"
        from "dbt_metrics__dbt_tmp_60adf065_de4b_404b_a679_ff917a885b3f"
    )
  