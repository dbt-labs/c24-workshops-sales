select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select r_regionkey
from raw.tpch_sf001.region
where r_regionkey is null



      
    ) dbt_internal_test