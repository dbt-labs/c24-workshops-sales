
    
    

select
    customer_key as unique_field,
    count(*) as n_records

from analytics.dbt_kcoapman.dim_customers_v2
where customer_key is not null
group by customer_key
having count(*) > 1


