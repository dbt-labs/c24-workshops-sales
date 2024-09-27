select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select part_supplier_key
from analytics.dbt_kcoapman.stg_tpch_part_suppliers
where part_supplier_key is null



      
    ) dbt_internal_test