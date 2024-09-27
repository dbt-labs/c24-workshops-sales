

with ad_spend as (
    select * from analytics.dbt_kcoapman.stg_ad_spend
)



select
    advertiser_id,
    sum(spend) as total_ad_spend
from ad_spend
group by advertiser_id