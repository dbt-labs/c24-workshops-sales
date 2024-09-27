
    
    

with all_values as (

    select
        l_linestatus as value_field,
        count(*) as n_records

    from raw.tpch_sf001.lineitem
    group by l_linestatus

)

select *
from all_values
where value_field not in (
    'P','F','O'
)


