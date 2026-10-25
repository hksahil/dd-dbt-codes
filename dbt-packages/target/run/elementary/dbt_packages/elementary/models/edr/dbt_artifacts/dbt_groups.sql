
  
    
    
    create temporary table
      "dbt_groups__dbt_tmp_7d6c041b_0d1d_4cad_a06b_c9d0e0bb985a"
  
    as (
      

select * from (
            select
            
                
        cast('dummy_string' as varchar(4096)) as unique_id

,
                
        cast('dummy_string' as varchar(4096)) as name

,
                
        cast('dummy_string' as varchar(4096)) as owner_email

,
                
        cast('dummy_string' as varchar(4096)) as owner_name

,
                
        cast('dummy_string' as varchar(4096)) as generated_at

,
                
        cast('dummy_string' as varchar(4096)) as metadata_hash


        ) as empty_table
        where 1 = 0
    );
  
    
  ;

        
            delete from "dev"."main"."dbt_groups"
            where (
                unique_id) in (
                select (unique_id)
                from "dbt_groups__dbt_tmp_7d6c041b_0d1d_4cad_a06b_c9d0e0bb985a"
            );

        
    

    insert into "dev"."main"."dbt_groups" ("unique_id", "name", "owner_email", "owner_name", "generated_at", "metadata_hash")
    (
        select "unique_id", "name", "owner_email", "owner_name", "generated_at", "metadata_hash"
        from "dbt_groups__dbt_tmp_7d6c041b_0d1d_4cad_a06b_c9d0e0bb985a"
    )
  