-- Q9 .1— Repeat Purchase Interval (Row Level)
-- Owner: Diksha Adsul |  Last updated: 2026-07-09
-- Sanity checks: days_to_next_order >= 0 on every row.

with intervals as (
    select
        o.customer_id
      , o.order_id
      , o.created_at as order_date
      , lead(o.created_at) over (
            partition by o.customer_id
            order by o.created_at
        ) as next_order_date
      , date_part(
            'day'
          , lead(o.created_at) over (
                partition by o.customer_id
                order by o.created_at
            ) - o.created_at
        ) as days_to_next_order
    from ecom.orders o
    where o.payment_status = 'paid'
)

select
    customer_id
  , order_id
  , order_date
  , next_order_date
  , days_to_next_order
from intervals
order by customer_id, order_date;

-- Q9 .2— Repeat Purchase Interval (Summary)
-- Owner: Diksha Adsul |  Last updated: 2026-07-08
-- Sanity checks: median <= p90.

with intervals as (
    select
        o.customer_id
      , o.order_id
      , o.created_at as order_date
      , lead(o.created_at) over (
            partition by o.customer_id
            order by o.created_at
        ) as next_order_date
      , date_part(
            'day'
          , lead(o.created_at) over (
                partition by o.customer_id
                order by o.created_at
            ) - o.created_at
        ) as days_to_next_order
    from ecom.orders o
    where o.payment_status = 'paid' and lower(o.status) <> 'cancelled'
)

select
    round(avg(days_to_next_order)::numeric, 2) as avg_days_to_next_order
  , percentile_cont(0.5) within group (order by days_to_next_order) as median_days_to_next_order
  , percentile_cont(0.9) within group (order by days_to_next_order) as p90_days_to_next_order
  , count(distinct customer_id) as customers_with_repeat_order
from intervals
where next_order_date is not null;
