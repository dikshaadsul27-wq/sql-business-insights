
Subject: What 10 SQL Queries Told Me About This Business

Date: July 2026

Dear Founder,
I’ve spent time digging into our e-commerce data with 10 targeted SQL queries. The results paint a clear picture of a healthy but maturing business with strong electronics-driven revenue, solid retention signals in places, and several operational levers we can pull for the next growth phase.
Here are the five most important insights I surfaced, backed directly by the data:

**1. Electronics Dominate True Profitability**
[Top products by net revenue after refunds](https://github.com/dikshaadsul27-wq/sql-business-insights/blob/ff2082803d582fa678f7c4b035b40b2d11e0b466/queries/04_top_products_by_net_revenue.sql) are overwhelmingly Headphones, Smartwatches, and Speakers. Top items like Eastlight Clarity ANC Headphones (₹918K net), Marigold Lite Wireless Earbuds, and Tarang Active Smartwatch show strong gross revenue with low-to-moderate returns.
Category breakdown (net revenue):

Smartwatch: ~₹59.7M
Headphones: ~₹38.1M
Speakers: ~₹32.9M

These three categories alone drive the bulk of profit. [Category-level health](https://github.com/dikshaadsul27-wq/sql-business-insights/blob/ff2082803d582fa678f7c4b035b40b2d11e0b466/queries/05_category_health.sql) confirms that Smartwatches lead in volume and revenue, followed strongly by Headphones and Speakers, with return rates low across the board (~2.5–3.1%).

**Takeaway:** We have a clear hero category. Prioritize expansion here (new variants, bundles, marketing) while optimizing higher-return non-electronics lines.

**2. Revenue Volatility Is High, But Recent Trends Show Resilience**
[Daily revenue](https://github.com/dikshaadsul27-wq/sql-business-insights/blob/3a33ed09b166ab7bdfaf46535b4620b0f0372e39/queries/01_daily_business_summary.sql) fluctuates significantly (e.g., peaks above ₹7M, dips below ₹2M), with notable day-over-day and week-over-week swings. However, the most recent days show recovery: several days with positive revenue vs. yesterday and same-weekday WoW growth in the 20-60% range on strong days.
Order volume and AOV are healthy (often ₹7K+ AOV), with paid order rates consistently >93-96% and cancellation rates low (4-7%). Refunds are present but manageable.

**Takeaway:** Seasonality and marketing-driven spikes are real. We need tighter forecasting, inventory buffers ahead of high days, and experiments to smooth baseline demand (e.g., email/retention campaigns on slower days).

**3. Strong Early Retention with Rapid Drop-Off — Room to Build Loyalty**
[Cohort data](https://github.com/dikshaadsul27-wq/sql-business-insights/blob/3a33ed09b166ab7bdfaf46535b4620b0f0372e39/queries/02_monthly_cohort_retention.sql) shows decent Month 1 retention (e.g., ~50% for the oldest cohort, 42% and 18% for more recent ones). By Month 2-3, retention falls sharply (e.g., 19% M3 for the earliest cohort).
This is typical for e-commerce but highlights an opportunity. Among [repeat buyers](https://github.com/dikshaadsul27-wq/sql-business-insights/blob/3a33ed09b166ab7bdfaf46535b4620b0f0372e39/queries/09_repeat_purchase_interval.sql), the median time to next order is only ~6 days (p90 ~19 days) — remarkably quick. This highlights a core of highly engaged, habitual customers.

**Takeaway:** Our acquisition is working, but post-purchase experience needs work. We should invest in onboarding sequences, loyalty programs, and repeat-purchase incentives. Repeat purchase intervals reinforces that among repeat buyers, the median time to next order is only 1 day, with p90 at 19 days, a core group of engaged customers exists and buys frequently when hooked.

**4. Acquisition Channels Perform Similarly — Optimize for Efficiency, Not Just Volume**
All major channels (Organic, Paid, Referral, Email, Affiliate) show remarkably consistent [funnel conversion](https://github.com/dikshaadsul27-wq/sql-business-insights/blob/e4ff801334293775fc80a2a65fe35dd028ccec4e/queries/03_funnel_conversion.sql):

View-to-cart ~40%
Cart-to-checkout ~81%
Checkout-to-purchase ~85-87%
Overall session-to-purchase ~28%

[First-touch vs. last-touch attribution](https://github.com/dikshaadsul27-wq/sql-business-insights/blob/e4ff801334293775fc80a2a65fe35dd028ccec4e/queries/10_attribution_comparison.sql) shows Organic and Paid dominating revenue share (~36-40% each), with Referral/Email/Affiliate in the 6-12% range. No channel is dramatically broken or magical.

**Takeaway:** Our site experience is multi-channel ready and solid. Focus on cost-per-acquisition and lifetime value differences. 'Paid' may drive more immediate volume, but Organic’s reliability is a defensible advantage. Continue nurturing Referral and Email for higher-efficiency growth.

**5. Operational Friction Points Exist but Are Fixable**

[Payment Failures](https://github.com/dikshaadsul27-wq/sql-business-insights/blob/a67db671561c586d526430ffbf8d5d0faeacdaab/queries/06_payment_failure_analysis.sql) : UPI has the highest failure rate (~5.5%), often due to gateway timeouts. Card and others are better but still see fraud/bank declines. Reducing friction here could lift conversions.
[Delivery breaches](https://github.com/dikshaadsul27-wq/sql-business-insights/blob/a67db671561c586d526430ffbf8d5d0faeacdaab/queries/07_delivery_sla_breach.sql): EcomExpress shows higher late rates (10-21%) vs. Bluedart/Delhivery (3-10%). Standard shipping is more reliable than express/same-day in some cases. Average delivery is 3-4 days, which is decent.
High-value customers are extremely concentrated: a small number of power users ([20000+ LTV bucket](https://github.com/dikshaadsul27-wq/sql-business-insights/blob/a67db671561c586d526430ffbf8d5d0faeacdaab/queries/08_customerltv_bucketshare_revenue.sql)) drive a huge share of revenue.

**Takeaway:** Tighten payment error handling (especially UPI) and carrier SLAs. Double down on delighting high-LTV customers with VIP treatment, exclusive drops, or loyalty perks.
Overall Picture & Recommendations
This business is in a strong position: electronics-led revenue with healthy unit economics on core products, solid (if improvable) retention among engaged users, and balanced acquisition channels. We’re not a flailing startup — we’re a real business with clear strengths and identifiable bottlenecks.

**Priority Actions:**
Product Strategy:Build the electronics flywheel — expand winners, prune high-return SKUs.
Retention Engine: Turn one-time buyers into the high-frequency repeaters we already see in the data.
Operations: Fix payment failures and delivery reliability to protect conversion and satisfaction.
Growth: Lean into Organic + Referral while optimizing Paid efficiency.
Analytics: Run these (or similar) queries monthly as a dashboard — they give us a repeatable health check.

We have the data. Now it’s about execution. I’m optimistic this foundation supports ambitious scaling.
Happy to discuss any query in more depth or build follow-up analyses.
