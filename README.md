# Elist eCommerce Insights - Project Overview

**The goal of this project is to investigate multi-year order trends at Elist and translate them into clear recommendations on inventory, marketing, and loyalty-program strategy.** The analysis focuses on 2019–2022 and is designed to be scan-friendly for leadership and town-hall use.

Founded as a digital-first electronics retailer, Elist sells devices and accessories through web and mobile channels. Coming out of the pandemic demand surge, leadership wants a grounded view of how sales have normalized, which products truly drive the business, and whether their loyalty program is delivering sufficient ROI to justify its continuation.

This repository includes a stakeholder-ready set of insights, a reproducible SQL workbook, and recommendations that map directly to budget and planning levers.

## Dataset Structure

This dataset consists of four tables, including information on customers, orders, order statuses, and geographic information.

<img width="1875" height="1114" alt="image" src="https://github.com/user-attachments/assets/8a0be6d0-4300-4d20-a403-baf5d4e4fad9" />

## Insights Summary

In order to evaluate Elist’s performance, we focused on the following key metrics:

- **Monthly Orders:** Count of shipped orders by month (seasonality + MoM/YoY growth).  
- **Average Order Value (AOV):** Yearly average USD order value.  
- **Loyalty Program Signals:** Adoption, time-to-first-purchase, AOV / order frequency vs. non-loyalty.  
- **Refund Rate:** Share of orders with a refund flag; monitored by product and year.

### Order Volume & Growth
- Demand **surged through 2020**, peaking at **4,019 orders in Dec 2020**, and stayed elevated into 2021 (e.g., **3,649 in Dec 2021**), then **normalized in 2022** with softer monthly totals.  
- Clear **Q4 seasonality** each year; strongest lifts in Oct–Dec.  
- YoY: **2019→2020** strong expansion, **2021** moderate, **2022** contraction as pandemic bump unwinds.

### Product Mix & Category Notes
- **Apple AirPods** lead by unit volume across months, spiking to **1,851 units (Dec 2020)**.  
- **27in 4K Gaming Monitor** shows pandemic-era growth with a **Dec 2020 peak of 851 units**; remains holiday-sensitive. 
- **Webcams** exhibit classic remote-work spikes (**307 units in Dec 2020**) before tapering.

### Average Order Value (AOV)
- **AOV by year (USD):** **2019 $257.49 → 2020 $355.90 → 2021 $311.53 → 2022 $276.66.**  

### Refunds & Operations
- **Refund rate (all products):** 2019 **5.73%**, 2020 **9.22%**, 2021 **3.61%**, 2022 **0.00%**; **overall 4.97%**.

### Loyalty Program Performance

- **AOV (grand totals 2019–2022):** Non-loyalty **$275** vs Loyalty **$240** (loyalty lower overall).
- **Order count (grand totals):** Non-loyalty **62,431**; Loyalty **45,693** (loyalty ≈ **42%** of orders).
- **Order mix at peak:** **Dec 2020** near parity — 2,017 (non-loyalty) vs **2,002 (loyalty)**.
- **Total sales (grand totals):** Non-loyalty **$17,140,809**; Loyalty **$10,972,012** (loyalty ≈ **39%** of sales).

<img width="670" height="388" alt="image" src="https://github.com/user-attachments/assets/1695c8f8-68be-4535-b29e-9a289cbb18bb" />
<img width="670" height="380" alt="image" src="https://github.com/user-attachments/assets/6ad92558-f302-43fe-a069-656eea056dc3" />
<img width="668" height="384" alt="image" src="https://github.com/user-attachments/assets/29accb8d-e1f9-4ef1-823a-7f4950a4af06" />

## Recommendations

- **Q4 Focus (AirPods & Monitors):** Reallocate spend from softer months to **Oct–Dec**, where demand is consistently strongest (e.g., **Dec 2021:** 1,971 loyalty orders vs. 1,678 non-loyalty; **Dec 2020:** near parity at 2,002 vs. 2,017). Prioritize **Apple AirPods** and **27in 4K Monitors**, which show the largest holiday lifts by unit volume.

- **Macbook-Anchored Bundles:** Use **Macbook Air** as the high-ticket anchor and attach **AirPods/cables** to recover AOV. This aligns to the multi-year AOV drift (**$355.90 → $276.66** from 2020→2022) while leveraging categories that already pull larger baskets in peak periods.

- **Loyalty AOV Parity Target:** Loyalty contributes ~**42%** of orders and **39%** of sales (2019–2022) but trails on AOV overall (**$240** vs. **$275**). Set a near-term target for **AOV parity within 5–10%**, concentrating on months with the widest gaps and replicating months where loyalty outperformed (e.g., **Jul/Dec 2021; Jan 2022**).

- **Refund Guardrails on High-Return SKUs:** Keep overall refunds near the observed **~5%** (2019–2022 overall **4.97%**; **2020: 9.22%**, **2021: 3.61%**). Monitor headphones/peripherals first and add return-reason tagging so product teams can address root causes without suppressing healthy holiday demand.
