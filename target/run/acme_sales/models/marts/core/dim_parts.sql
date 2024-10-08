
  
    

        create or replace transient table analytics.dbt_kcoapman.dim_parts
         as
        (
with part as (

    select * from analytics.dbt_kcoapman.stg_tpch_parts

),

final as (
    select 
        part_key,
        manufacturer,
        name,
        brand,
        type,
        size,
        container,
        retail_price
    from
        part
)
select *
from final  
order by part_key
        );
      
  