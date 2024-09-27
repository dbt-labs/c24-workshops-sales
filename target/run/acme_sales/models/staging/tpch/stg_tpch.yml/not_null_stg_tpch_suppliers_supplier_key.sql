select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select supplier_key
from analytics.dbt_kcoapman.stg_tpch_suppliers
where supplier_key is null



      
    ) dbt_internal_test