select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with child as (
    select n_regionkey as from_field
    from raw.tpch_sf001.nation
    where n_regionkey is not null
),

parent as (
    select r_regionkey as to_field
    from raw.tpch_sf001.region
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



      
    ) dbt_internal_test