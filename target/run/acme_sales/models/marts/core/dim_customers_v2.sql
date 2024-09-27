
  
    

        create or replace  table analytics.dbt_kcoapman.dim_customers_v2
          
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
    is_high_value varchar(1),
    is_mid_value varchar(1),
    is_low_value varchar(1)
    
    )

          
        
         as
        (
    select customer_key, region, name, address, nation, phone_number, account_balance, market_segment, lifetime_value, is_high_value, is_mid_value, is_low_value
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
customer_flags as (
    select * from analytics.dbt_kcoapman.customer_flags
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
        customer_flags.lifetime_value,
        customer_flags.is_high_value,
        customer_flags.is_mid_value,
        customer_flags.is_low_value
    from
        customer
        inner join nation
            on customer.nation_key = nation.nation_key
        inner join region
            on nation.region_key = region.region_key
        left join customer_flags
            on customer.customer_key = customer_flags.customer_key
)
select 
    *
from
    final
order by
    customer_key
    ) as model_subq
        );
      
  