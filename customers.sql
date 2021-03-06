with customer_orders as (
    select
        customer_id, 
        min(created_at) as first_order_at,
        count(distinct id) as number_orders,
        max(created_at) as last_order_at
    from `analytics-engineers-club.coffee_shop.orders`
    group by 1
)

select
    customers.id as customer_id,
    customers.name,
    customers.email,
    customer_orders.first_order_at,
    customer_orders.number_orders,
    customer_orders.last_order_at
from `analytics-engineers-club.coffee_shop.customers` as customers
left join customer_orders
  on customers.id = customer_orders.customer_id 
order by first_order_at asc