select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with child as (
    select ps_suppkey as from_field
    from raw.tpch_sf001.partsupp
    where ps_suppkey is not null
),

parent as (
    select s_suppkey as to_field
    from raw.tpch_sf001.supplier
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



      
    ) dbt_internal_test