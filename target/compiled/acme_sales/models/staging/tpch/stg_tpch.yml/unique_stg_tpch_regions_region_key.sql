
    
    

select
    region_key as unique_field,
    count(*) as n_records

from analytics.dbt_kcoapman.stg_tpch_regions
where region_key is not null
group by region_key
having count(*) > 1


