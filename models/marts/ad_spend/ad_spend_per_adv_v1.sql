{{
    config(
        materialized='table'
    )
}}

with ad_spend as (
    select * from {{ ref('stg_ad_spend') }}
)



select
    advertiser_id,
    sum(spend) as total_ad_spend,
    COUNT(DISTINCT advertiser_id) AS advertiser_count
from ad_spend
group by advertiser_id