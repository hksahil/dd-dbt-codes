
  
    
    
    create temporary table
      "dbt_sources__dbt_tmp_78f07099_48b7_4869_a658_440fc1193e80"
  
    as (
      

select * from (
            select
            
                
        cast('dummy_string' as varchar(4096)) as unique_id

,
                
        cast('dummy_string' as varchar(4096)) as database_name

,
                
        cast('dummy_string' as varchar(4096)) as schema_name

,
                
        cast('dummy_string' as varchar(4096)) as source_name

,
                
        cast('dummy_string' as varchar(4096)) as name

,
                
        cast('dummy_string' as varchar(4096)) as identifier

,
                
        cast('dummy_string' as varchar(4096)) as loaded_at_field

,
                
        cast('dummy_string' as varchar(4096)) as freshness_warn_after

,
                
        cast('dummy_string' as varchar(4096)) as freshness_error_after

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as freshness_filter

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as freshness_description

,
                
        cast('dummy_string' as varchar(4096)) as relation_name

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as tags

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as meta

,
                
        cast('dummy_string' as varchar(4096)) as owner

,
                
        cast('dummy_string' as varchar(4096)) as package_name

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as original_path

,
                
        cast('dummy_string' as varchar(4096)) as path

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as source_description

,
                
        cast('this_is_just_a_long_dummy_string' as varchar(4096)) as description

,
                
        cast('dummy_string' as varchar(4096)) as generated_at

,
                
        cast('dummy_string' as varchar(4096)) as metadata_hash


        ) as empty_table
        where 1 = 0
    );
  
    
  ;

        
            delete from "dev"."main"."dbt_sources"
            where (
                unique_id) in (
                select (unique_id)
                from "dbt_sources__dbt_tmp_78f07099_48b7_4869_a658_440fc1193e80"
            );

        
    

    insert into "dev"."main"."dbt_sources" ("unique_id", "database_name", "schema_name", "source_name", "name", "identifier", "loaded_at_field", "freshness_warn_after", "freshness_error_after", "freshness_filter", "freshness_description", "relation_name", "tags", "meta", "owner", "package_name", "original_path", "path", "source_description", "description", "generated_at", "metadata_hash")
    (
        select "unique_id", "database_name", "schema_name", "source_name", "name", "identifier", "loaded_at_field", "freshness_warn_after", "freshness_error_after", "freshness_filter", "freshness_description", "relation_name", "tags", "meta", "owner", "package_name", "original_path", "path", "source_description", "description", "generated_at", "metadata_hash"
        from "dbt_sources__dbt_tmp_78f07099_48b7_4869_a658_440fc1193e80"
    )
  