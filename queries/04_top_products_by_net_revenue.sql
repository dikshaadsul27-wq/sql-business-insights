-- Q4 : Top Products by Net Revenue (After Refunds)
-- Owner: Diksha Adsul |  Last updated: 2026-07-03
-- Sanity checks: Sum of gross revenue = sum (qty * unit price) = 25,30,47,045

with product_revenue as (
    select
        pv.product_id
      , p.product_name
      , p.category_id
      , sum(oi.qty * oi.unit_price) as gross_revenue
      , count(distinct oi.order_id) as orders_count
      , sum(oi.qty) as units_sold
    from ecom.order_items oi
    join ecom.product_variants pv on oi.variant_id = pv.variant_id
    join ecom.products p on pv.product_id = p.product_id
    group by pv.product_id, p.product_name, p.category_id
)

, product_returns as (
    select
        pv.product_id
      , count(*) as returns_count
      , sum(ri.qty) as units_returned
    from ecom.return_items ri
    join ecom.product_variants pv on ri.variant_id = pv.variant_id
    group by pv.product_id
)

, product_refunds as (
    select
        pv.product_id
      , coalesce(sum(r.refund_amount), 0) as refunds_amount
    from ecom.order_items oi
    join ecom.product_variants pv on oi.variant_id = pv.variant_id
    join ecom.order_refunds r on oi.order_id = r.order_id
    group by pv.product_id
)

select
    pr.product_id
  , pr.product_name
  , c.category_name
  , pr.gross_revenue
  , pr.orders_count
  , pr.units_sold
  , coalesce(ret.returns_count, 0) as returns_count
  , round(coalesce(ret.returns_count, 0) * 1.0 / nullif(pr.orders_count, 0), 4) as return_rate
  , coalesce(ref.refunds_amount, 0) as refunds_amount
  , pr.gross_revenue - coalesce(ref.refunds_amount, 0) as net_revenue
from product_revenue pr
left join product_returns ret on pr.product_id = ret.product_id
left join product_refunds ref on pr.product_id = ref.product_id
left join ecom.categories c on pr.category_id = c.category_id
order by net_revenue desc;
