-- Q5 — Category Health: Purchases → Returns
-- Owner: Diksha Adsul |  Last updated: 2026-06-20
-- Sanity checks: Return rate % is between 0 to 100.
-- Returns are less than orders with the category.
-- sum(line_total) paid = sum of revenue for each category = 24,381,138

with category_sales as (
    select
        c.category_name
      , count(distinct oi.order_id) as orders_with_category
      , sum(oi.qty) as units_sold
      , sum(oi.line_total) as revenue
    from ecom.order_items oi
    join ecom.product_variants pv on oi.variant_id = pv.variant_id
    join ecom.products p on pv.product_id = p.product_id
    join ecom.categories c on p.category_id = c.category_id
    join ecom.orders o on oi.order_id = o.order_id
    where o.status = 'paid'   -- only paid orders
    group by c.category_name
)

, category_returns as (
    select
        c.category_name
      , count(*) as returns
    from ecom.return_items ri
    join ecom.product_variants pv on ri.variant_id = pv.variant_id
    join ecom.products p on pv.product_id = p.product_id
    join ecom.categories c on p.category_id = c.category_id
    group by c.category_name
)

select
    cs.category_name as category
  , cs.orders_with_category
  , cs.units_sold
  , cs.revenue
  , coalesce(cr.returns, 0) as returns
  , round(coalesce(cr.returns, 0) * 100.0 / nullif(cs.orders_with_category, 0), 2) as return_rate_pct
from category_sales cs
left join category_returns cr on cs.category_name = cr.category_name
order by cs.revenue desc;
