
    
    

with all_values as (

    select
        region as value_field,
        count(*) as n_records

    from analytics.dbt_kcoapman.dim_customers_v2
    group by region

)

select *
from all_values
where value_field not in (
    'AFRICA','MIDDLE EAST','ASIA','EUROPE','AMERICA'
)


