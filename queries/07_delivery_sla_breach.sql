-- Q7 : Delivery SLA Breach by Carrier × Shipping Method
-- Owner: Diksha Adsul |  Last updated: 2026-06-23
-- Sanity checks: avg_delivery_days <= p90_delivery_days on every row.
-- late_rate is between 0 and 1.

with shipment_days as (
    select
        sc.carrier_name as carrier
      , sm.method_name as shipping_method
      , s.shipment_id
      , (s.delivered_at::date - s.shipped_at::date) as delivery_days
    from ecom.shipments s
    join ecom.shipping_carriers sc on s.carrier_id = sc.carrier_id
    join ecom.shipping_methods sm on s.shipping_method_id = sm.shipping_method_id
    where s.delivered_at is not null   -- exclude in-transit
)

select
    carrier
  , shipping_method
  , count(*) as delivered_orders
  , avg(delivery_days) as avg_delivery_days
  , percentile_cont(0.5) within group (order by delivery_days) as median_delivery_days
  , percentile_cont(0.9) within group (order by delivery_days) as p90_delivery_days
  , sum(case when delivery_days > 5 then 1 else 0 end) as late_deliveries
  , sum(case when delivery_days > 5 then 1 else 0 end)::float / nullif(count(*), 0) as late_rate
from shipment_days
group by carrier, shipping_method
order by late_rate desc;
