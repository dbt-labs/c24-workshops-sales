select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select part_key
from analytics.dbt_kcoapman.stg_tpch_parts
where part_key is null



      
    ) dbt_internal_test