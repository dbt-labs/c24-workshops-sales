
  
    

        create or replace transient table analytics.dbt_kcoapman.stg_ad_spend
          
  (
    advertiser_id int not null,
    spend int
    
    )

          
        
         as
        (
    select advertiser_id, spend
    from (
        

select * from analytics.dbt_kcoapman.ad_spend
    ) as model_subq
        );
      
  