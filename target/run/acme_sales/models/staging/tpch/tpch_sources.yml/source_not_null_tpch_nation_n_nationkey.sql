select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select n_nationkey
from raw.tpch_sf001.nation
where n_nationkey is null



      
    ) dbt_internal_test