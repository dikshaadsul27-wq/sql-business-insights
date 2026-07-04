-- Q2 : Monthly Signup Cohort Retention
-- Owner: Diksha Adsul |  Last updated: 2026-06-19
-- Sanity checks: Cohort size validated for each month cohort size(month) = count(Distinct customer_id) of month
-- Retention rate is between 0 and 1.
-- As there are only 4 months of data, later cohorts show Null instead of 0 retention.

with cohorts as (
    select
        customer_id
      , date_trunc('month', created_at)::date as cohort_month
    from ecom.customers
)

, customer_active_months as (
    select distinct
        customer_id
      , date_trunc('month', created_at)::date as active_month
    from ecom.orders o
    where lower(o.status) != 'cancelled'
)

, cohort_sizes as (
    select
        cohort_month
      , count(distinct customer_id) as cohort_size
    from cohorts
    group by 1
)

, max_order_month as (
    select
        date_trunc('month', max(created_at))::date as max_month
    from ecom.orders
)

select
    c.cohort_month
  , cs.cohort_size

  -- retained counts
  , count(distinct case
        when cam.active_month = (c.cohort_month + interval '1 month')::date
        then c.customer_id end
    ) as m1_retained

  , case
        when (c.cohort_month + interval '2 months')::date > mo.max_month
        then null
        else count(distinct case
            when cam.active_month = (c.cohort_month + interval '2 months')::date
            then c.customer_id end)
    end as m2_retained

  , case
        when (c.cohort_month + interval '3 months')::date > mo.max_month
        then null
        else count(distinct case
            when cam.active_month = (c.cohort_month + interval '3 months')::date
            then c.customer_id end)
    end as m3_retained

  , round(
        count(distinct case
            when cam.active_month = (c.cohort_month + interval '1 month')::date
            then c.customer_id end
        ) * 1.0 / nullif(cs.cohort_size, 0)
    , 4) as m1_retention_rate

  , case
        when (c.cohort_month + interval '2 months')::date > mo.max_month
        then null
        else round(
            count(distinct case
                when cam.active_month = (c.cohort_month + interval '2 months')::date
                then c.customer_id end
            ) * 1.0 / nullif(cs.cohort_size, 0)
        , 4)
    end as m2_retention_rate

  , case
        when (c.cohort_month + interval '3 months')::date > mo.max_month
        then null
        else round(
            count(distinct case
                when cam.active_month = (c.cohort_month + interval '3 months')::date
                then c.customer_id end
            ) * 1.0 / nullif(cs.cohort_size, 0)
        , 4)
    end as m3_retention_rate

from cohorts c
join cohort_sizes cs using (cohort_month)
left join customer_active_months cam on c.customer_id = cam.customer_id
cross join max_order_month mo
group by c.cohort_month, cs.cohort_size, mo.max_month
order by c.cohort_month;
