
  
    

        create or replace transient table analytics.dbt_kcoapman.ad_spend_per_adv_v2
          
  (
    advertiser_id int not null,
    total_ad_spend int
    
    )

          
        
         as
        (
    select advertiser_id, total_ad_spend
    from (
        

with ad_spend as (
    select * from analytics.dbt_kcoapman.stg_ad_spend
)



select
    advertiser_id,
    sum(spend) as total_ad_spend
from ad_spend
group by advertiser_id
    ) as model_subq
        );
      
  