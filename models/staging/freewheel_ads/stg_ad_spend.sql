{{
    config(
        materialized='table'
    )
}}

select * from {{ ref('ad_spend') }}