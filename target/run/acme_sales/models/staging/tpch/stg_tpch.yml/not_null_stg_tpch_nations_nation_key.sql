select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select nation_key
from analytics.dbt_kcoapman.stg_tpch_nations
where nation_key is null



      
    ) dbt_internal_test