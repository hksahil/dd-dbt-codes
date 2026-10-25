
  
    
    
    create temporary table
      "dbt_models__dbt_tmp_d17888cc_e9b0_404b_8c3e_4354f1bc8e04"
  
    as (
      

select * from (
            select
            
                
        cast('dummy_string' as varchar(4096)) as unique_id

,
                
        cast('dummy_string' as varchar(4096)) as alias

,
                
        cast('dummy_string' as varchar(4096)) as checksum

,
                
        cast('dummy_string' as varchar(4096)) as materialization

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as tags

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as meta

,
                
        cast('dummy_string' as varchar(4096)) as owner

,
                
        cast('dummy_string' as varchar(4096)) as database_name

,
                
        cast('dummy_string' as varchar(4096)) as schema_name

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as depends_on_macros

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as depends_on_nodes

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as description

,
                
        cast('dummy_string' as varchar(4096)) as name

,
                
        cast('dummy_string' as varchar(4096)) as package_name

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as original_path

,
                
        cast('dummy_string' as varchar(4096)) as path

,
                
        cast('dummy_string' as varchar(4096)) as patch_path

,
                
        cast('dummy_string' as varchar(4096)) as generated_at

,
                
        cast('dummy_string' as varchar(4096)) as metadata_hash

,
                
        cast('dummy_string' as varchar(4096)) as unique_key

,
                
        cast('dummy_string' as varchar(4096)) as incremental_strategy

,
                
        cast('dummy_string' as varchar(4096)) as group_name

,
                
        cast('dummy_string' as varchar(4096)) as access


        ) as empty_table
        where 1 = 0
    );
  
    
  ;

        
            delete from "dev"."main"."dbt_models"
            where (
                unique_id) in (
                select (unique_id)
                from "dbt_models__dbt_tmp_d17888cc_e9b0_404b_8c3e_4354f1bc8e04"
            );

        
    

    insert into "dev"."main"."dbt_models" ("unique_id", "alias", "checksum", "materialization", "tags", "meta", "owner", "database_name", "schema_name", "depends_on_macros", "depends_on_nodes", "description", "name", "package_name", "original_path", "path", "patch_path", "generated_at", "metadata_hash", "unique_key", "incremental_strategy", "group_name", "access")
    (
        select "unique_id", "alias", "checksum", "materialization", "tags", "meta", "owner", "database_name", "schema_name", "depends_on_macros", "depends_on_nodes", "description", "name", "package_name", "original_path", "path", "patch_path", "generated_at", "metadata_hash", "unique_key", "incremental_strategy", "group_name", "access"
        from "dbt_models__dbt_tmp_d17888cc_e9b0_404b_8c3e_4354f1bc8e04"
    )
  