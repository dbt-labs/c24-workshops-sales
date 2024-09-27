select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    o_orderkey as unique_field,
    count(*) as n_records

from raw.tpch_sf001.orders
where o_orderkey is not null
group by o_orderkey
having count(*) > 1



      
    ) dbt_internal_test