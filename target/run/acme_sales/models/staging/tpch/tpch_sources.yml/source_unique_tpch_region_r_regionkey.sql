select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    r_regionkey as unique_field,
    count(*) as n_records

from raw.tpch_sf001.region
where r_regionkey is not null
group by r_regionkey
having count(*) > 1



      
    ) dbt_internal_test