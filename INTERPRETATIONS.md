**Q1 — Daily Business Summary (DoD & WoW)**

*Question :* 
How are we performing today compared to yesterday, and compared to the same weekday last week?

*Summary of the Output :*
Revenue is moving up and down quite sharply. Day‑over‑day changes range from drops of around ‑74% to gains of nearly +49%. When we compare to the same weekday last week, the swings are also big from ‑78% declines to +65% growth. Orders vary a lot too, from under 200 on weaker days to close to 1,000 on stronger ones, while AOV stays fairly steady around ₹7,000–₹8,000. Paid order rates are mostly healthy at 93–96%, except for one day where cancellations spiked above 50%. Refunds are usually small, but there are occasional large reversals (₹30,000+).

*Sanity checks :*  
1. paid_order_rate and cancelled_order_rate are between 0 and 1. 
2. sum(orders) in the output = count(*) of orders = 40000

*Interpretation :*  
The main driver of revenue changes is order volume, not ticket size. Some weekdays consistently underperform with WoW declines of 30–40%, while others show strong growth of 47–65%. The cancellation spike is a clear anomaly and points to an operational issue that needs attention. Refund spikes, though rare, can still dent net revenue and customer confidence.

*Actionable Takeaways :*
1. Focus on stabilizing weekday performance by pushing promotions or campaigns on weaker days.
2. Investigate the cancellation anomaly quickly to avoid repeat issues.
3. Since growth is coming from volume, prioritize acquisition and conversion rather than upselling.
4. Keep an eye on refund trends and strengthen fulfillment or quality checks to reduce reversals.

**Q2 — Monthly Signup Cohort Retention**

*Question :* 
How well are new customer cohorts retained over the first three months after signup?

*Summary of the Output :*
The March 2026 cohort started with 1,664 signups. Retention was ~50% in month 1, ~42% in month 2, and dropped to ~19% in month 3. The April 2026 cohort was larger (3,382 signups) but retention fell faster: ~43% in month 1, ~18% in month 2, and no retention recorded in month 3. The May 2026 cohort had 3,461 signups, but only ~18% were retained in month 1, with no retention recorded beyond that. The June 2026 cohort had 1,493 signups, but retention is recorded as zero as there is not enough data available.

*Sanity checks :*  
1. Cohort size validated for each month cohort size(month) = count(Distinct customer_id) of month
2. Retention rate is between 0 and 1.
3. As there are only 4 months of data, later cohorts show Null instead of 0 retention.
  
*Interpretation :*  
Retention is strongest in the first month but declines sharply by month 3. The March cohort shows a healthier retention curve compared to later cohorts, suggesting either better onboarding or stronger engagement at that time. The steep drop in Apr and May cohorts highlights a challenge in sustaining customer interest beyond the first month. The June cohort’s zero values may indicate missing data.

*Actionable Takeaways :*
1. Strengthen onboarding and engagement programs to sustain retention beyond the first month.
2. Investigate why later cohorts show weaker retention compared to March, possible changes in campaigns, product experience, or customer mix.
3. Consider targeted re‑engagement campaigns for cohorts with sharp drop‑offs, especially around month 2.

**Q3 — Funnel Conversion by Acquisition Channel**

*Question :*
The CMO wants to know: where in the funnel does each channel’s traffic leak — browsing, cart, checkout, or payment?

*Summary of the Output :*
Organic and Paid traffic both show similar patterns: ~40% of sessions add to cart, ~81% move to checkout, and ~86% complete purchase. Overall session‑to‑purchase conversion is ~28%. Referral, Email, and Affiliate channels perform slightly better, with session‑to‑purchase rates around 28–29%. Email stands out with the highest checkout‑to‑purchase rate (~87%). Direct traffic is negligible (60 sessions, no conversions).
Across all channels, the biggest drop happens at the view → cart stage (only ~40% of sessions add to cart). Later stages (cart → checkout and checkout → purchase) are relatively strong, with 80–87% conversion.

*Sanity checks :*  
1. All funnel rates are between 0 and 1.
2. Stage counts are monotonically non-increasing per channel: sessions >= product_view_sessions >= add_to_cart_sessions >= begin_checkout_sessions >= purchase_sessions.
3. Funnel events only exist on or after 2026‑04‑19.

*Interpretation :*    
The funnel is healthy once customers add items to cart as most proceed through checkout and payment. The main leakage is at the browse stage, where less than half of sessions convert to cart. This suggests product discovery, merchandising, or initial engagement is the biggest challenge. Email campaigns show slightly stronger purchase completion, indicating that more targeted or personalized traffic converts better.

*Actionable Takeaways :*
1. Focus on improving product discovery and cart initiation, optimize landing pages, recommendations, and promotions to push more sessions into the cart stage.
2. Leverage email and referral channels since they show stronger end‑to‑end conversion, scale these campaigns further.
3. Investigate direct traffic attribution to ensure sessions are tracked correctly, as current data shows zero conversions.
4. Since checkout and payment stages are strong, prioritize top‑of‑funnel improvements rather than backend fixes.

**Q4 — Top Products by Net Revenue (After Refunds)**

*Question :*
“Which products actually make us money : Net Revenue?”

*Summary of the Output :*
The top products by net revenue (after refunds/returns) are dominated by electronics, particularly Headphones, Smartwatches, and Speakers. The dataset covers ~4,000 products with total gross revenue of approximately ₹253M and net revenue of ₹250M (refunds/returns totaling ~₹3.3M).
Key Highlights from Top Performers:
1. Eastlight Clarity ANC Headphones (Headphones) — ₹918K net, 0% return rate.
2. Marigold Home Craft Lite Wireless Earbuds — ₹908K net.
3. Tarang Active Smartwatch — ₹905K net.

*Sanity checks :*  
1. Sum of gross revenue = sum (qty * unit price) = 25,30,47,045

*Interpretation :*      
The business is heavily driven by consumer electronics (wearables + audio), which deliver high volume, strong margins, and generally low return rates. Returns/refunds are modest overall (~1.3% of gross), but a small number of products show elevated return rates (some >10-20%, often lower-volume SKUs in apparel, beauty, or niche items).

*Actionable Takeaways :*
1. Prioritize inventory, marketing, and promotions for top Smartwatches, ANC Headphones, and Speakers. Explore bundling or variants of high-net performers.
2. Investigate SKUs with unusually high return rates, could indicate quality, sizing, expectation mismatch, or description issues. Set return rate thresholds for product reviews.
3. Electronics drive the bulk of profit; continue expanding successful sub-categories (e.g., kids smartwatches, premium audio) while cautiously scaling apparel/beauty lines where returns can hurt more.

**Q5 — Category Health: Purchases → Returns**

*Question :*
The Category Manager wants to know: which categories generate the most revenue, and which suffer the highest return rates?

*Summary of the Output :*
The dataset covers 14 categories with total revenue of approximately ₹210M. Tech categories (Smartwatches, Headphones, Speakers) dominate revenue, while lifestyle categories (Shoes, Kitchen, Decor, Accessories, Haircare, Skincare) contribute smaller shares but show higher return rates.
Key Highlights from Top Performers:
1. Smartwatches — ₹59.7M revenue, 2.53% return rate.
2. Headphones — ₹38.1M revenue, 2.68% return rate.
3. Speakers — ₹32.9M revenue, 2.65% return rate.

*Sanity checks :*  
1. Return rate % is between 0 to 100.
2. Returns are less than orders with the category.
3. sum(line_total) paid = sum of revenue for each category =  239,583,750

*Interpretation :*      
The business is heavily driven by consumer electronics (wearables + audio), which deliver high revenue and relatively low return rates (~2.5–2.7%). Lifestyle categories (Shoes, Kitchen, Decor, Accessories, Haircare, Skincare) generate moderate revenue but show higher return rates (approaching or exceeding 3%). Even small differences in return rate matter at scale, Accessories at 3.14% and Haircare at 2.94% represent significant margin leakage relative to their revenue size. Bedding and Jeans are stable mid‑tier categories with lower return rates (~2.4–2.5%), suggesting reliable performance.

*Actionable Takeaways :*
1. Smartwatches, Headphones, and Speakers are clear profit engines. Continue investing in inventory, marketing, and bundling strategies here.
2. Accessories, Haircare, and Kitchen show elevated return rates. Audit product quality, sizing, and customer expectations to reduce refund leakage.
3. Reallocate resources toward proven tech earners while cautiously scaling lifestyle categories where returns erode margins.
4. Establish return rate benchmarks (e.g., >3% triggers review) to systematically monitor category health.

**Q6 — Payment Failure Analysis (Method × Top Error Code)**

*Question :*
The Payments PM wants to know: which payment methods fail most, and what’s the top reason?

*Summary of the Output :*
UPI: 12,835 attempts, 711 failures, failure rate 5.5% (highest). Top error: GATEWAY_TIMEOUT (24% of failures).
Card: 14,166 attempts, 592 failures, failure rate 4.2%. Top error: FRAUD (27.5% of failures).
COD: 4,779 attempts, 224 failures, failure rate 4.7%. Top error: UPI_TIMEOUT (27.2% of failures).
Wallet: 4,655 attempts, 223 failures, failure rate 4.8%. Top error: BANK_DECLINE (27.4% of failures).
Netbanking: 3,599 attempts, 150 failures, failure rate 4.2%. Top error: BANK_DECLINE (30% of failures).

*Sanity checks :*  
1. failure_rate and top_error_share_of_failures are between 0 and 1.

*Interpretation :*      
Failure rates are relatively consistent across methods (4–5.5%), but the reasons differ:
UPI is most prone to gateway timeouts, suggesting infrastructure or API reliability issues. Card payments fail mainly due to fraud checks, which may be overly strict or misconfigured. Wallet and Netbanking failures are dominated by bank declines, pointing to either customer credit/debit issues or bank‑side restrictions. COD failures tied to UPI_TIMEOUT are unusual, possibly a misclassification in error logging.

*Actionable Takeaways :*
1. UPI: Work with gateway providers to reduce timeout errors.
2. Card: Review fraud detection rules to balance risk and/or fine‑tune thresholds.
3. Wallet/Netbanking: Engage with partner banks to understand decline reasons; improve customer messaging when declines occur.
4. COD: Audit error logging to ensure COD failures aren’t incorrectly attributed to UPI errors.

**Q7 — Delivery SLA Breach by Carrier × Shipping Method**

*Question :*
Ops wants to know: who’s missing the 5‑day SLA, and by how much?

*Summary of the Output :*
EcomExpress (express & same‑day): Avg delivery ~4.1 days, median 4, p90 = 8. Late rate ~20–21%.
EcomExpress (standard): Avg 3.6 days, median 3, p90 = 6. Late rate ~10%.
Bluedart (express & same‑day): Avg ~3.5 days, median 3, p90 ~6. Late rate ~10%.
Bluedart (standard): Avg 3.34 days, median 3, p90 = 5. Late rate ~5.7%.
Delhivery (express & same‑day): Avg ~3.36 days, median 3, p90 = 5. Late rate ~7%.
Delhivery (standard): Avg 3.16 days, median 3, p90 = 5. Late rate ~3.1% (best performer).

*Sanity checks :*  
1. avg_delivery_days <= p90_delivery_days on every row.
2. late_rate is between 0 and 1.

*Interpretation :*      
EcomExpress is the weakest performer: nearly 1 in 5 express/same‑day shipments breach the SLA, with long‑tail delays up to 8 days. Bluedart is stronger, keeping late rates around 10% for express/same‑day, and only ~6% for standard. Delhivery is the most reliable: both express and same‑day average under 3.4 days, with late rates ~7%, and standard shipping is outstanding at just 3% late.
Overall, SLA breaches are concentrated in EcomExpress fast‑shipping methods, not in standard deliveries.

*Actionable Takeaways :*
1. Escalate with EcomExpress: their express/same‑day performance is missing SLA ~20% of the time.
2. Shift volume to Delhivery standard where possible, consistently lowest late rate and fastest median delivery.
3. Bluedart is acceptable but not best‑in‑class; monitor express/same‑day to ensure late rates don’t creep above 10%.
Ops focus: reduce long‑tail delays (p90 hitting 8 days for EcomExpress) by tightening SLA enforcement and improving exception handling.

**Q8 — Customer LTV + Bucket Share of Revenue**

*Question :*
The CRM Lead wants to know: who are our top spenders, and what share of total revenue do they represent?

*Summary of the Output :*
Customers are grouped into four lifetime value (LTV) buckets:
₹0–999: Low‑value customers, many in number but contribute only a small share of revenue.
₹1,000–4,999: Mid‑value customers, larger share than the lowest bucket but still modest overall.
₹5,000–19,999: High‑value customers, contribute a significant portion of revenue.
₹20,000+: Top spenders, very small in number but disproportionately large share of revenue.

The bucket share calculation shows that the ₹20,000+ group contributes the majority of revenue, followed by the ₹5,000–19,999 group. The lower buckets together represent a large customer base but only a minority of revenue.

*Sanity checks :*  
1. Total revenue of all customers = sum(total) of all orders excluding 'cancelled' = 282,859,232.18
2. ltv_bucket_share_of_revenue summed across distinct buckets equals 0.994

*Interpretation :*      
Revenue is highly concentrated among a small set of top spenders. While thousands of customers fall into the lower buckets, their combined contribution is overshadowed by a few high‑LTV customers. This indicates strong dependence on a small elite segment, which is both an opportunity (high ROI from retention) and a risk (over‑reliance on a narrow base).

*Actionable Takeaways :*
1. Protect and retain top spenders (₹20,000+): They are the backbone of revenue. Personalized engagement, loyalty programs, and premium support are critical.
2. Grow the mid‑tier (₹5,000–19,999): This group has potential to move into the top bucket; targeted upsell and cross‑sell campaigns can lift them.
3. Diversify revenue sources: Reduce risk by expanding the high‑value base rather than relying too heavily on a small elite.

**Q9 — Repeat Purchase Interval**

*Question :*  
“How long until a customer comes back? When should we send the win‑back email?”

*Summary of the Output :*
Average days to next order: ~5.91 days
Median days to next order: 1 day
90th percentile (p90): 19 days
Customers with repeat orders: 3759

*Sanity checks :*  
1. days_to_next_order >= 0 on every row.
2. median <= p90 in the summary.

*Interpretation :*      
The median of 1 day shows a fat cluster of customers placing multiple orders in the same session or within 24 hours. These are not meaningful for lifecycle marketing — a win‑back email is irrelevant here. The average of ~6 days reflects a broader mix of behaviors, but is still pulled down by near‑zero intervals. The p90 of 19 days is more representative of the long‑tail, most customers who return do so within ~3 weeks. Excluding 0‑day intervals shifts the average upward (closer to ~17 days in prior recalculations), giving a truer picture of lifecycle repeats.
Customers either return almost immediately (same‑session) or after ~1–3 weeks. There is a clear bifurcation between “session splits” and “true repeat purchases.”

*Actionable Takeaways :*
1. Target emails around day 7–10 (when average return occurs) and a reminder around day 19–20 (p90 cutoff).
2. Do not count 0‑day or same‑session repeats in lifecycle metrics — they distort averages and median.
3. Separate “immediate repeaters” (session splits) from “true lifecycle repeaters” to design more relevant campaigns.
4. The difference between including vs. excluding 0‑day intervals materially changes the story (median 1 vs. ~7 days). Document the choice clearly for leadership.
 
**Q10 — Attribution Comparison: First‑Touch vs Last‑Touch Revenue by Channel**

*Question :*
Marketing wants to know: does our channel mix look different under first‑touch vs last‑touch attribution? Which channels open the funnel vs close it?

*Summary of the Output :*
Organic: First‑touch ₹113.7M (40.2% share), Last‑touch ₹109.4M (38.7% share).
Paid: First‑touch ₹101.4M (35.9%), Last‑touch ₹102.0M (36.1%).
Referral: First‑touch ₹32.6M (11.5%), Last‑touch ₹33.2M (11.8%).
Email: First‑touch ₹17.7M (6.3%), Last‑touch ₹20.2M (7.2%).
Affiliate: First‑touch ₹17.4M (6.2%), Last‑touch ₹18.0M (6.4%).

*Sanity checks :*  
1. Total revenue under first_touch = total under last_touch = total non-cancelled revenue in ecom.orders = 282,859,232.18

*Interpretation :*
Organic and Paid dominate both models, but organic is slightly stronger at the top of the funnel (first‑touch), while paid holds steady or gains slightly at the bottom (last‑touch). Referral traffic is consistent across both models, contributing ~11–12% of revenue. Email and Affiliate show a clear shift: they contribute less as first‑touch channels but gain share as last‑touch, meaning they are more effective at closing deals than opening them.
Overall, the mix is stable, but attribution highlights different roles: organic/paid drive discovery, while email/affiliate help convert.

*Actionable Takeaways :*
1. Organic: Invest in SEO/content to keep fueling the top of funnel, the strongest opener.
2. Paid: Reliable across both models; continue balancing acquisition and retargeting spend.
3. Email & Affiliate: Position as closing channels — strengthen retargeting, personalized offers, and affiliate incentives to maximize their last‑touch impact.
4. Referral: Stable contributor; maintain partnerships but don’t expect major shifts.
