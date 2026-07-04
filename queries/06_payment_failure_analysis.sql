-- Q6 : Payment Failure Analysis (Method × Top Error Code)
-- Owner: Diksha Adsul |  Last updated: 2026-06-22
-- Sanity checks: failure_rate and top_error_share_of_failures are between 0 and 1.

with method_stats as (
    select
        pm.method_name as payment_method
      , count(*) as attempts
      , sum(case when pt.status = 'failed' then 1 else 0 end) as failures
      , sum(case when pt.status = 'failed' then 1 else 0 end)::float / nullif(count(*), 0) as failure_rate
    from ecom.payment_transactions pt
    join ecom.payment_intents pi on pt.payment_intent_id = pi.payment_intent_id
    join ecom.payment_methods pm on pi.payment_method_id = pm.payment_method_id
    group by pm.method_name
)

, top_errors as (
    select
        pm.method_name as payment_method
      , pt.error_code
      , max(pt.error_message) as error_message
      , count(*) as error_count
      , row_number() over (
            partition by pm.method_name
            order by count(*) desc
        ) as rn
    from ecom.payment_transactions pt
    join ecom.payment_intents pi on pt.payment_intent_id = pi.payment_intent_id
    join ecom.payment_methods pm on pi.payment_method_id = pm.payment_method_id
    where pt.status = 'failed'
    group by pm.method_name, pt.error_code
)

select
    ms.payment_method
  , ms.attempts
  , ms.failures
  , (ms.failure_rate)::numeric(12,4) as failure_rate
  , te.error_code as top_error_code
  , te.error_message as top_error_message
  , (te.error_count::numeric / nullif(ms.failures, 0))::numeric(12,4) as top_error_share_of_failures
from method_stats ms
left join top_errors te
    on ms.payment_method = te.payment_method
   and te.rn = 1
order by ms.failures desc;
