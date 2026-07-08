# ecom-analytics
[ecom_schema.md](https://github.com/dikshaadsul27-wq/ecom-analytics/blob/main/notes/ecom_schema.md)
# SQL Business Insights — Task 1 (ecom)

[Case study](CASE_STUDY.md) · [LinkedIn](https://www.linkedin.com/in/diksha-adsul-2607ba90/)

## Key Findings
- ...
- ...
- ...

## Schema (ER Diagram)

```mermaid
erDiagram
    customers          ||--o{ orders : places
    orders             ||--|{ order_items : contains
    order_items        }o--|| product_variants : ships
    product_variants   }o--|| products : sku_of
    products           }o--|| categories : in
    orders             ||--o{ payment_intents : pays_via
    payment_intents    ||--o{ payment_transactions : attempts
    orders             ||--o{ refunds : may_have
    orders             ||--o{ return_requests : may_return
    return_requests    ||--|{ return_items : with
    orders             ||--o{ shipments : ships
    customers          ||--o{ sessions : starts
    sessions           ||--o{ session_events : logs
    sessions           ||--o{ attribution_touches : has
    attribution_touches }o--o| attribution_campaigns : maps_via_bridge
    attribution_campaigns }o--|| marketing_campaigns : refs
```

## Dashboard
Dashboard link : [Business Dashboard](https://metabase.topfolio.in/dashboard/42-task-1-sql-foundation)

The dashboard consists of below metrics
1. [Revenue by Order Date](screenshots/Revenue by Order Date)
2. Cohort by Month : 
3. Customer Retention by Month : 
4. Funnel Conversion by Acquisition Channel : 
5. Top Products by Net Revenue (After Refunds): 
6. Category by Revenue and Return Rate : 
7. Payment Failure Rate with Top Reasons : 
8. Delivery SLA Breach by Carrier × Shipping Method : 
9. Attribution Comparison: First-Touch vs Last-Touch Revenue by Channel : 


## What's in this repo
...

## How to run
...

## Reflection
