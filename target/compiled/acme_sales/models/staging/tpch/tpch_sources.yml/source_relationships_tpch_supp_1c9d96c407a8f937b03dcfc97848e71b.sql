
    
    

with child as (
    select s_nationkey as from_field
    from raw.tpch_sf001.supplier
    where s_nationkey is not null
),

parent as (
    select n_nationkey as to_field
    from raw.tpch_sf001.nation
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


