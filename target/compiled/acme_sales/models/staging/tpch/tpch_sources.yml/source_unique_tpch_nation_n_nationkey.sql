
    
    

select
    n_nationkey as unique_field,
    count(*) as n_records

from raw.tpch_sf001.nation
where n_nationkey is not null
group by n_nationkey
having count(*) > 1


