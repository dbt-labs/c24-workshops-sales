

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