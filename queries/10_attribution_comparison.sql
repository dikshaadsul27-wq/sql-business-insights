-- Q10 — Attribution Comparison: First-Touch vs Last-Touch Revenue by Channel
-- Owner: Diksha Adsul |  Last updated: 2026-07-02
-- Sanity checks: Total revenue under first_touch = total under last_touch = total non-cancelled revenue in ecom.orders = 282,859,232.18

with first_touch as (
    select
        s.customer_id
      , at.channel
      , row_number() over (
            partition by s.customer_id
            order by at.touched_at asc
        ) as rn
    from ecom.attribution_touches at
    join ecom.sessions s on at.session_id = s.session_id
)

, last_touch as (
    select
        s.customer_id
      , at.channel
      , row_number() over (
            partition by s.customer_id
            order by at.touched_at desc
        ) as rn
    from ecom.attribution_touches at
    join ecom.sessions s on at.session_id = s.session_id
)

, first_touch_rev as (
    select
        'first_touch' as attribution_model
      , coalesce(ft.channel, 'direct') as channel
      , sum(o.total) as revenue
      , count(distinct o.order_id) as orders
    from ecom.orders o
    left join first_touch ft
        on o.customer_id = ft.customer_id
       and ft.rn = 1
    where o.status <> 'cancelled'
    group by coalesce(ft.channel, 'direct')
)

, last_touch_rev as (
    select
        'last_touch' as attribution_model
      , coalesce(lt.channel, 'direct') as channel
      , sum(o.total) as revenue
      , count(distinct o.order_id) as orders
    from ecom.orders o
    left join last_touch lt
        on o.customer_id = lt.customer_id
       and lt.rn = 1
    where o.status <> 'cancelled'
    group by coalesce(lt.channel, 'direct')
)

select
    attribution_model
  , channel
  , revenue
  , orders
  , revenue::numeric / sum(revenue) over (partition by attribution_model) as share_of_revenue
from (
    select * from first_touch_rev
    union all
    select * from last_touch_rev
) t
order by attribution_model, revenue desc;
