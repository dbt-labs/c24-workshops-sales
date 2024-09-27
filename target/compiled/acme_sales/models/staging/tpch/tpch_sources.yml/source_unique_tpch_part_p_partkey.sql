
    
    

select
    p_partkey as unique_field,
    count(*) as n_records

from raw.tpch_sf001.part
where p_partkey is not null
group by p_partkey
having count(*) > 1


