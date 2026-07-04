-- Q1: Daily Business Summary + DoD / Same-Weekday WoW Comparisons
-- Owner: Diksha Adsul |  Last updated: 2026-06-19
-- Sanity checks: Sanity checks : paid_order_rate and cancelled_order_rate are between 0 and 1.
-- sum(orders) in the output = count(*) of orders = 40000

with daily_orders as (
    select
        date_trunc('day', o.created_at)::date as order_date
      , count(*) as orders
      , sum(o.total) as revenue
      , count(*) filter (where o.payment_status = 'paid') as paid_orders
      , count(*) filter (where lower(o.status) = 'cancelled') as cancelled_orders
    from ecom.orders o
    group by 1
)

, daily_refunds as (
    select
        date_trunc('day', r.created_at)::date as order_date
      , sum(r.amount) as refunds_amount
    from ecom.refunds r
    group by 1
)

select
    ord.order_date
  , ord.revenue
  , ord.orders
  , (ord.revenue * 1.0 / nullif(ord.orders, 0)) as aov
  , (ord.paid_orders * 1.0 / ord.orders) as paid_order_rate
  , (ord.cancelled_orders * 1.0 / ord.orders) as cancelled_order_rate
  , coalesce(dr.refunds_amount, 0) as refunds_amount
  , (
        (ord.revenue - lag(ord.revenue, 1) over (order by ord.order_date))
        / nullif(lag(ord.revenue, 1) over (order by ord.order_date), 0)
    ) * 100 as revenue_vs_yesterday_pct
  , (
        (ord.revenue - lag(ord.revenue, 7) over (order by ord.order_date))
        / nullif(lag(ord.revenue, 7) over (order by ord.order_date), 0)
    ) * 100 as revenue_vs_last_weekday_pct
from daily_orders ord
left join daily_refunds dr using (order_date)
order by ord.order_date desc;
