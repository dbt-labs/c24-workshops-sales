
    
    

with child as (
    select l_partkey as from_field
    from raw.tpch_sf001.lineitem
    where l_partkey is not null
),

parent as (
    select p_partkey as to_field
    from raw.tpch_sf001.part
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


