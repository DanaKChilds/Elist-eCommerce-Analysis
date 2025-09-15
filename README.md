# Elist eCommerce Insights - Project Overview

**The goal of this project is to investigate multi-year order trends at Elist and translate them into clear recommendations on inventory, marketing, and loyalty-program strategy.** The analysis focuses on 2019–2022 and is designed to be scan-friendly for leadership and town-hall use.

Founded as a digital-first electronics retailer, Elist sells devices and accessories through web and mobile channels. Coming out of the pandemic demand surge, leadership wants a grounded view of how sales have normalized, which products truly drive the business, and whether their loyalty program is delivering sufficient ROI to justify its continuation.

This repository includes a stakeholder-ready set of insights, a reproducible SQL workbook, and recommendations that map directly to budget and planning levers.

## Dataset Structure

This dataset consists of four tables, including information on customers, orders, order statuses, and geographic information.

<img width="1875" height="1114" alt="image" src="https://github.com/user-attachments/assets/8a0be6d0-4300-4d20-a403-baf5d4e4fad9" />

### KPIs At-a-Glance (2019–2022)

- **Shipped Orders Peak:** 3,940 (Dec-2020); 3,593 (Dec-2021)  
- **AOV by Year (USD):** 2019 **$257.49** → 2020 **$355.90** → 2021 **$311.53** → 2022 **$276.66**  
- **Loyalty Share:** **42%** of orders (45,693 / 108,124) and **39%** of sales ($10.97M / $28.11M)  
- **AOV (Grand Totals):** Non-loyalty **$275** vs Loyalty **$240**  
- **Refund Rate (All Products):** 2019 **5.73%**, 2020 **9.22%**, 2021 **3.61%**, 2022 **0.00%**; overall **4.97%**  

<img width="712" height="169" alt="image" src="https://github.com/user-attachments/assets/92bbb4c9-d346-449b-a001-839972a697c2" />

## Insights Summary

In order to evaluate Elist’s performance, we focused on the following key metrics:

- **Monthly Orders:** Count of shipped orders by month (seasonality + MoM/YoY growth).  
- **Average Order Value (AOV):** Yearly average USD order value.
- **Refund Rate:** Share of orders with a refund flag; monitored by product and year.
- **Loyalty Program Signals:** Adoption, time-to-first-purchase, AOV / order frequency vs. non-loyalty.  

### Order Volume & Growth
- Demand surges through the pandemic with a clear **Q4 peak**, remains elevated into late 2021, and **normalizes in 2022** with softer monthlies.  
- YoY profile: **strong expansion 2019→2020**, **moderation in 2021**, and a **pullback in 2022** as the pandemic bump unwinds.

### Product Mix & Category Notes
- **Apple AirPods** lead unit volume across months, spiking to **1,851 units (Dec 2020)**.  
- **27in 4K Gaming Monitor** shows a pandemic spike with **851 units (Dec 2020)**; remains holiday-sensitive afterward.  
- **Webcams** exhibit remote-work spikes (e.g., **307 units in Dec 2020**) before tapering to lower baselines.

### Average Order Value (AOV)
- AOV **accelerates into 2020** and **compresses through 2021–2022**, reflecting a mix shift toward lower-ticket accessories and fewer high-ticket orders.

### Refunds & Operations
- Refunds **elevate during the 2020 surge** and **improve in 2021**; the apparent **zero in 2022** likely reflects posting/completeness timing and should be validated before external use.

### Loyalty Program Performance
- **AOV windows of strength:** Loyalty meets/exceeds non-loyalty in several months, including **Jul 2021 ($259.32 vs $215.57)**, **Dec 2021 ($257.69 vs $223.44)**, and **Jan 2022 ($244.20 vs $223.74)**.  
- **Volume contribution:** Near-parity at the holiday peak (**Dec 2020 orders: 2,002 loyalty vs 2,017 non-loyalty**), with **multiple 2021 months where loyalty order counts exceed non-loyalty**.  
- **Revenue parity moments:** Member revenue **matches or surpasses** non-member revenue in several 2021 months (e.g., **Dec 2021: $507.7K loyalty vs $374.7K non-loyalty**), driven by higher member order counts despite mixed AOV.

<img width="670" height="388" alt="image" src="https://github.com/user-attachments/assets/1695c8f8-68be-4535-b29e-9a289cbb18bb" />
<img width="670" height="380" alt="image" src="https://github.com/user-attachments/assets/6ad92558-f302-43fe-a069-656eea056dc3" />
<img width="668" height="384" alt="image" src="https://github.com/user-attachments/assets/29accb8d-e1f9-4ef1-823a-7f4950a4af06" />

## Recommendations

### 1) Q4 Loyalty Acceleration
- Holiday months are the biggest spike each year.  
- At the peak, loyalty keeps up or wins on volume (e.g., **Dec-2020:** 2,002 loyalty vs 2,017 non-loyalty; **Dec-2021:** 1,971 vs 1,678).  
- Putting more focus on members in Oct–Dec builds on a pattern that already shows up in the **Order Count** chart.

### 2) Member AOV Uplift via Bundles
- Overall, loyalty’s average order value is lower (**$240** vs **$275**), but there are clear months where members spend more per order (e.g., **Jul-2021:** $259.32 vs $215.57; **Dec-2021:** $257.69 vs $223.44; **Jan-2022:** $244.20 vs $223.74).  
- AOV was highest in 2020 and then eased in 2021–2022, so it helps to recreate those “member-wins” months rather than fight the overall trend.

### 3) Always-On Attach at Checkout (Members)
- Accessories surge with core devices in holidays (e.g., **Dec-2020:** AirPods **1,851** units, 27" 4K Monitor **851**, Webcam **307**).  
- In several 2021 months, **member revenue meets or beats non-members** (e.g., **Dec-2021:** **$507.7K** loyalty vs **$374.7K** non-loyalty), mostly because members place more orders.  
- Small, well-timed add-ons for members can lift AOV without needing more traffic.

### 4) Member Mix & Frequency
- Over 2019–2022, loyalty makes up about **42% of orders** (45,693 of 108,124) and **39% of sales** (~$11.0M of $28.1M).  
- Members out-ordered non-members in multiple **2021** months (including December). Keeping a steady drumbeat for members helps keep that mix.

### 5) Refund Guardrail on Member Offers
- Overall refund rate sits around **5%** (2019–2022 overall **4.97%**), was higher in **2020 (9.22%)**, and improved in **2021 (3.61%)**.  
- When running member-only promos, watch member vs non-member refund rates so lift in AOV doesn’t come with more returns.

## Appendix — Reproducibility

See `sql/Business Queries.sql` for AOV by year, product name normalization, refund rates, loyalty splits, and shipped-orders series.  
