**Q1 — Daily Business Summary (DoD & WoW)**

*Question :* 
How are we performing today compared to yesterday, and compared to the same weekday last week?

*Summary of the Output :*
Revenue is moving up and down quite sharply. Day‑over‑day changes range from drops of around ‑74% to gains of nearly +49%. When we compare to the same weekday last week, the swings are also big from ‑78% declines to +65% growth. Orders vary a lot too, from under 200 on weaker days to close to 1,000 on stronger ones, while AOV stays fairly steady around ₹7,000–₹8,000. Paid order rates are mostly healthy at 93–96%, except for one day where cancellations spiked above 50%. Refunds are usually small, but there are occasional large reversals (₹30,000+).

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

*Interpretation :*    
The funnel is healthy once customers add items to cart as most proceed through checkout and payment. The main leakage is at the browse stage, where less than half of sessions convert to cart. This suggests product discovery, merchandising, or initial engagement is the biggest challenge. Email campaigns show slightly stronger purchase completion, indicating that more targeted or personalized traffic converts better.

*Actionable Takeaways :*
1. Focus on improving product discovery and cart initiation, optimize landing pages, recommendations, and promotions to push more sessions into the cart stage.
2. Leverage email and referral channels since they show stronger end‑to‑end conversion, scale these campaigns further.
3. Investigate direct traffic attribution to ensure sessions are tracked correctly, as current data shows zero conversions.
4. Since checkout and payment stages are strong, prioritize top‑of‑funnel improvements rather than backend fixes.

**Q5 — Category Health: Purchases → Returns**

*Question :*
The Category Manager wants to know: which categories generate the most revenue, and which suffer the highest return rates?

*Summary of the Output :*
Smartwatch: ₹6.22M revenue, 720 units sold, 127 returns, return rate 24.1%.
Headphones: ₹3.95M revenue, 792 units sold, 143 returns, return rate 24.5%.
Speakers: ₹3.25M revenue, 638 units sold, 129 returns, return rate 26.7%.
Shoes: ₹1.62M revenue, 815 units sold, 162 returns, return rate 27.6%.
Kitchen: ₹1.37M revenue, 745 units sold, 157 returns, return rate 29.3% (highest).
Accessories: ₹0.68M revenue, 859 units sold, 173 returns, return rate 27.6%.
Other apparel categories (Jackets, Jeans, Tops) and beauty (Skincare, Haircare, Makeup) all show return rates in the 25–28% range.

*Interpretation :*      
High‑value electronics (Smartwatches, Headphones, Speakers) generate the most revenue but still face return rates above 24%. Fashion and lifestyle categories (Shoes, Jackets, Accessories) show even higher return rates, often exceeding 27%. Kitchen products are the worst performer, with nearly 1 in 3 units returned. Bedding and Jeans are slightly better, but still above 24%. Overall, no category is below 24% return rate.

*Actionable Takeaways :*
1. Electronics (Smartwatches, Headphones) are strong revenue drivers, but their return rates need attention, possibly due to product fit, expectations, or technical issues.
2. Kitchen and Shoes categories are red flags: return rates above 27–29% suggest quality or mismatch problems. These need immediate investigation.
3. Apparel and beauty categories show consistently high returns (25–28%), indicating sizing, fit, or expectation issues. Consider better product descriptions, sizing guides, or stricter quality checks.
4. Focus retention and profitability efforts on categories like Smartwatches and Headphones, where revenue is high, while aggressively reducing returns in categories like Kitchen and Shoes.

**Q6 — Payment Failure Analysis (Method × Top Error Code)**

*Question :*
The Payments PM wants to know: which payment methods fail most, and what’s the top reason?

*Summary of the Output :*
UPI: 12,835 attempts, 711 failures, failure rate 5.5% (highest). Top error: GATEWAY_TIMEOUT (24% of failures).
Card: 14,166 attempts, 592 failures, failure rate 4.2%. Top error: FRAUD (27.5% of failures).
COD: 4,779 attempts, 224 failures, failure rate 4.7%. Top error: UPI_TIMEOUT (27.2% of failures).
Wallet: 4,655 attempts, 223 failures, failure rate 4.8%. Top error: BANK_DECLINE (27.4% of failures).
Netbanking: 3,599 attempts, 150 failures, failure rate 4.2%. Top error: BANK_DECLINE (30% of failures).

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

*Interpretation :*      
EcomExpress is the weakest performer: nearly 1 in 5 express/same‑day shipments breach the SLA, with long‑tail delays up to 8 days. Bluedart is stronger, keeping late rates around 10% for express/same‑day, and only ~6% for standard. Delhivery is the most reliable: both express and same‑day average under 3.4 days, with late rates ~7%, and standard shipping is outstanding at just 3% late.
Overall, SLA breaches are concentrated in EcomExpress fast‑shipping methods, not in standard deliveries.

*Actionable Takeaways :*
1. Escalate with EcomExpress: their express/same‑day performance is missing SLA ~20% of the time.
2. Shift volume to Delhivery standard where possible, consistently lowest late rate and fastest median delivery.
3. Bluedart is acceptable but not best‑in‑class; monitor express/same‑day to ensure late rates don’t creep above 10%.
Ops focus: reduce long‑tail delays (p90 hitting 8 days for EcomExpress) by tightening SLA enforcement and improving exception handling.

