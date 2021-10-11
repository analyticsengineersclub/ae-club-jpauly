select 
    o.customer_id, 
    c.name,
    c.email,
    min(o.created_at) as first_order_at, 
    count(o.id) as number_of_orders
from analytics-engineers-club.coffee_shop.orders o
join analytics-engineers-club.coffee_shop.customers c on o.customer_id = c.id

group by 1,2,3
order by first_order_at;