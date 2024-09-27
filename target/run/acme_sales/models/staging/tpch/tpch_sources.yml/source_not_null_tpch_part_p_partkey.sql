select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select p_partkey
from raw.tpch_sf001.part
where p_partkey is null



      
    ) dbt_internal_test