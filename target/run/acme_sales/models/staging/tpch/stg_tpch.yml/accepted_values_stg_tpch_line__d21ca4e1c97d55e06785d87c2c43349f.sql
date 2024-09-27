select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        status_code as value_field,
        count(*) as n_records

    from analytics.dbt_kcoapman.stg_tpch_line_items
    group by status_code

)

select *
from all_values
where value_field not in (
    'returned','billed','shipped'
)



      
    ) dbt_internal_test