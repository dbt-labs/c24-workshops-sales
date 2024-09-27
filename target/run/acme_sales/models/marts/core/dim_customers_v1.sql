
  
    

        create or replace  table analytics.dbt_kcoapman.dim_customers_v1
          
  (
    customer_key int,
    region varchar(25),
    name varchar(25),
    address varchar(40),
    nation varchar(25),
    phone_number varchar(15),
    account_balance number(38,0),
    market_segment varchar(10),
    lifetime_value int,
    tier_name TEXT
    
    )

          
        
         as
        (
    select customer_key, region, name, address, nation, phone_number, account_balance, market_segment, lifetime_value, tier_name
    from (
        

with customer as (

    select * from analytics.dbt_kcoapman.stg_tpch_customers

),
nation as (

    select * from analytics.dbt_kcoapman.stg_tpch_nations
),
region as (

    select * from analytics.dbt_kcoapman.stg_tpch_regions

),
customer_tier as (
    select * from analytics.dbt_kcoapman.customer_tier
),
final as (
    select 
        customer.customer_key,
        customer.name,
        customer.address,
        
        nation.name as nation,
        
        region.name as region,
        customer.phone_number,
        customer.account_balance,
        customer.market_segment,
        customer_tier.lifetime_value,
        customer_tier.tier_name
    from
        customer
        inner join nation
            on customer.nation_key = nation.nation_key
        inner join region
            on nation.region_key = region.region_key
        left join customer_tier
            on customer.customer_key = customer_tier.customer_key
)
select 
    *
from
    final
order by
    customer_key
    ) as model_subq
        );
      
  