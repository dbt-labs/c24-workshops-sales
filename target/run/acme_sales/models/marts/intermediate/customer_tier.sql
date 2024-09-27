
  
    

        create or replace transient table analytics.dbt_kcoapman.customer_tier
         as
        (

with customer as (

    select * from raw.tpch_sf001.customer

),

    orders as (

    select * from raw.tpch_sf001.orders

),
    
    final as (

    select
    
        c_custkey as customer_key,
        sum(o_totalprice) as lifetime_value,
        case when rank() over (order by lifetime_value desc) <=20 then 'tier1'
        when lifetime_value > 2000000 then 'tier2'
        when lifetime_value between 1000000 and 1999999 then 'tier3'
        when lifetime_value between 0 and 999999 then 'tier4' end as tier_name
        

    from customer
        inner join orders
            on customer.c_custkey = o_custkey
    group by 1
)

select * from final
        );
      
  