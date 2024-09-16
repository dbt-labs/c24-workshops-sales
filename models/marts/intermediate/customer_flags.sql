{{
    config(
        materialized='table'
    )
}}

with customer as (

    select * from {{ source('tpch', 'customer') }}

),

    orders as (

    select * from {{ source('tpch', 'orders') }}

),
    
    final as (

    select
    
        c_custkey as customer_key,
        coalesce(sum(o_totalprice),0) as lifetime_value,
        iff(lifetime_value > 3000000, 'Y', 'N') as is_high_value,
        iff(lifetime_value between 1000000 and 2999999, 'Y', 'N') as is_mid_value,
        iff(lifetime_value between 0 and 999999, 'Y','N') as is_low_value

    from customer
        inner join orders
            on customer.c_custkey = o_custkey
    group by 1
)

select * from final