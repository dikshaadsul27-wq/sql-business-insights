-- Q8 — Customer LTV + Bucket Share of Revenue
-- Owner: Diksha Adsul |  Last updated: 2026-06-25
-- Sanity checks: Total revenue of all customers = sum(total) of all orders excluding 'cancelled' = 282,859,232.18
-- ltv_bucket_share_of_revenue summed across distinct buckets equals 0.994

with customer_spend as (
    select
        o.customer_id
      , min(o.created_at)::date as first_order_date
      , max(o.created_at)::date as last_order_date
      , count(distinct o.order_id) as total_orders
      , sum(o.total) as total_revenue
      , sum(o.total)::float / nullif(count(distinct o.order_id), 0) as aov
    from ecom.orders o
    where o.status <> 'cancelled'
    group by o.customer_id
)

, bucketed as (
    select
        cs.*
      , case
            when cs.total_revenue < 1000 then '0-999'
            when cs.total_revenue < 5000 then '1000-4999'
            when cs.total_revenue < 20000 then '5000-19999'
            else '20000+'
        end as ltv_bucket
    from customer_spend cs
)

select
    customer_id
  , first_order_date
  , last_order_date
  , total_orders
  , total_revenue
  , aov
  , ltv_bucket
  , (sum(total_revenue) over (partition by ltv_bucket))::numeric
    / (sum(total_revenue) over ())::numeric as ltv_bucket_share_of_revenue
from bucketed
order by total_revenue desc;
