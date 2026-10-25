
  
    
    
    create temporary table
      "data_monitoring_metrics__dbt_tmp_e311b999_a433_4509_9de7_415caeb60ed6"
  
    as (
      


    
    
        
    
    select * from (
            select
            
                
        cast('dummy_string' as varchar(4096)) as id

,
                
        cast('dummy_string' as varchar(4096)) as full_table_name

,
                
        cast('dummy_string' as varchar(4096)) as column_name

,
                
        cast('dummy_string' as varchar(4096)) as metric_name

,
                
        cast('dummy_string' as varchar(4096)) as metric_type

,
                
        cast(123456789.99 as float) as metric_value

,
                
        cast('dummy_string' as varchar(4096)) as source_value

,
                cast('2091-02-17' as timestamp) as bucket_start

,
                cast('2091-02-17' as timestamp) as bucket_end

,
                
        cast(123456789 as integer) as bucket_duration_hours

,
                cast('2091-02-17' as timestamp) as updated_at

,
                
        cast('dummy_string' as varchar(4096)) as dimension

,
                
        cast('dummy_string' as varchar(4096)) as dimension_value

,
                
        cast('dummy_string' as varchar(4096)) as metric_properties

,
                cast('2091-02-17' as timestamp) as created_at


        ) as empty_table
        where 1 = 0

    );
  
    
  ;

        
            delete from "dev"."main"."data_monitoring_metrics"
            where (
                id) in (
                select (id)
                from "data_monitoring_metrics__dbt_tmp_e311b999_a433_4509_9de7_415caeb60ed6"
            );

        
    

    insert into "dev"."main"."data_monitoring_metrics" ("id", "full_table_name", "column_name", "metric_name", "metric_type", "metric_value", "source_value", "bucket_start", "bucket_end", "bucket_duration_hours", "updated_at", "dimension", "dimension_value", "metric_properties", "created_at")
    (
        select "id", "full_table_name", "column_name", "metric_name", "metric_type", "metric_value", "source_value", "bucket_start", "bucket_end", "bucket_duration_hours", "updated_at", "dimension", "dimension_value", "metric_properties", "created_at"
        from "data_monitoring_metrics__dbt_tmp_e311b999_a433_4509_9de7_415caeb60ed6"
    )
  