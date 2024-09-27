
    
    

with all_values as (

    select
        return_flag as value_field,
        count(*) as n_records

    from analytics.dbt_kcoapman.stg_tpch_line_items
    group by return_flag

)

select *
from all_values
where value_field not in (
    'returned','accepted'
)


