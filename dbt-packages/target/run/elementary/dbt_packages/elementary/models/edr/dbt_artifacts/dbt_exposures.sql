
  
    
    
    create temporary table
      "dbt_exposures__dbt_tmp_f05a0d9a_470d_46b9_bf13_206dca9be909"
  
    as (
      

select * from (
            select
            
                
        cast('dummy_string' as varchar(4096)) as unique_id

,
                
        cast('dummy_string' as varchar(4096)) as name

,
                
        cast('dummy_string' as varchar(4096)) as maturity

,
                
        cast('dummy_string' as varchar(4096)) as type

,
                
        cast('dummy_string' as varchar(4096)) as owner_email

,
                
        cast('dummy_string' as varchar(4096)) as owner_name

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as url

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as depends_on_macros

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as depends_on_nodes

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as depends_on_columns

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
                
        cast('dummy_string' as varchar(4096)) as label

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as raw_queries


        ) as empty_table
        where 1 = 0
    );
  
    
  ;

        
            delete from "dev"."main"."dbt_exposures"
            where (
                unique_id) in (
                select (unique_id)
                from "dbt_exposures__dbt_tmp_f05a0d9a_470d_46b9_bf13_206dca9be909"
            );

        
    

    insert into "dev"."main"."dbt_exposures" ("unique_id", "name", "maturity", "type", "owner_email", "owner_name", "url", "depends_on_macros", "depends_on_nodes", "depends_on_columns", "description", "tags", "meta", "package_name", "original_path", "path", "generated_at", "metadata_hash", "label", "raw_queries")
    (
        select "unique_id", "name", "maturity", "type", "owner_email", "owner_name", "url", "depends_on_macros", "depends_on_nodes", "depends_on_columns", "description", "tags", "meta", "package_name", "original_path", "path", "generated_at", "metadata_hash", "label", "raw_queries"
        from "dbt_exposures__dbt_tmp_f05a0d9a_470d_46b9_bf13_206dca9be909"
    )
  