
  
    

        create or replace transient table analytics.dbt_kcoapman.fct_order_items
         as
        (

with order_item as (
    
    select * from analytics.dbt_kcoapman.order_items

),
part_supplier as (
    
    select * from analytics.dbt_kcoapman.part_suppliers

),
final as (
    select 
        order_item.order_item_key,
        order_item.order_key,
        order_item.order_date,
        order_item.customer_key,
        order_item.part_key,
        order_item.supplier_key,
        order_item.order_item_status_code,
        order_item.is_return,
        order_item.line_number,
        order_item.ship_date,
        order_item.commit_date,
        order_item.receipt_date,
        order_item.ship_mode,
        part_supplier.cost as supplier_cost,
        
        order_item.base_price,
        order_item.discount_percentage,
        order_item.discounted_price,
        order_item.tax_rate,
        part_supplier.nation_key,
        1 as order_item_count,
        order_item.quantity,
        order_item.gross_item_sales_amount,
        order_item.discounted_item_sales_amount,
        order_item.item_discount_amount,
        order_item.item_tax_amount,
        order_item.net_item_sales_amount

    from
        order_item
        inner join part_supplier
            on order_item.part_key = part_supplier.part_key and
                order_item.supplier_key = part_supplier.supplier_key
)
select 
    *
from
    final
order by
    order_date
        );
      
  