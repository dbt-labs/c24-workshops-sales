select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    supplier_key as unique_field,
    count(*) as n_records

from analytics.dbt_kcoapman.stg_tpch_suppliers
where supplier_key is not null
group by supplier_key
having count(*) > 1



      
    ) dbt_internal_test