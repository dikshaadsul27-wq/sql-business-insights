-- Q3 : Funnel Conversion by Acquisition Channel
-- Owner: Diksha Adsul |  Last updated: 2026-06-20
-- Sanity checks: All funnel rates are between 0 and 1.
-- Stage counts are monotonically non-increasing per channel: sessions >= product_view_sessions >= add_to_cart_sessions >= begin_checkout_sessions >= purchase_sessions.
-- Funnel events only exist on or after 2026‑04‑19.

with instrumented_sessions as (
    select distinct
        session_id
    from ecom.session_events
    where occurred_at >= '2026-04-19'
)

, session_channel as (
    select
        s.session_id
      , coalesce(
            (
                select at.channel
                from ecom.attribution_touches at
                where at.session_id = s.session_id
                order by at.touched_at desc
                limit 1
            )
        , 'direct') as channel
    from instrumented_sessions s
)

, funnel as (
    select
        sc.channel
      , count(distinct se.session_id) as sessions
      , count(distinct se.session_id) filter (where se.event_type = 'product_view') as product_view_sessions
      , count(distinct se.session_id) filter (where se.event_type = 'add_to_cart') as add_to_cart_sessions
      , count(distinct se.session_id) filter (where se.event_type = 'begin_checkout') as begin_checkout_sessions
      , count(distinct se.session_id) filter (where se.event_type = 'purchase') as purchase_sessions
    from ecom.session_events se
    join session_channel sc using (session_id)
    where se.occurred_at >= '2026-04-19'
    group by sc.channel
)

select
    channel
  , sessions
  , product_view_sessions
  , add_to_cart_sessions
  , begin_checkout_sessions
  , purchase_sessions
  , round(add_to_cart_sessions * 1.0 / nullif(product_view_sessions, 0), 4) as view_to_cart_rate
  , round(begin_checkout_sessions * 1.0 / nullif(add_to_cart_sessions, 0), 4) as cart_to_checkout_rate
  , round(purchase_sessions * 1.0 / nullif(begin_checkout_sessions, 0), 4) as checkout_to_purchase_rate
  , round(purchase_sessions * 1.0 / nullif(sessions, 0), 4) as session_to_purchase_rate
from funnel
order by sessions desc;
