# Elist eCommerce Insights - Project Overview

**The goal of this project is to investigate multi-year order trends at Elist and translate them into clear recommendations on inventory, marketing, and loyalty-program strategy to be shared with various stakeholder teams.** The analysis focuses on 2019–2022 and is designed to be scan-friendly for leadership and town-hall use.

Founded as a digital-first electronics retailer, Elist sells devices and accessories through web and mobile channels. Coming out of the pandemic demand surge, leadership wants a grounded view of how sales have normalized, which products truly drive the business, and whether their loyalty program is delivering sufficient ROI to justify its continuation.

**Elist rode a pandemic surge with strong Q4 seasonality, then normalized in 2022. The loyalty program concentrates volume (many months where member orders meet or beat non-members) but trails on long-run AOV, with clear windows where members out-spend non-members.**

This repository includes a stakeholder-ready set of insights, a reproducible SQL workbook, a high-level KPI dashboard, and recommendations that map directly to budget and planning levers.

## Dataset Structure

This dataset consists of five tables, including information on customers, suppliers, orders, order statuses, and geographic information.

<img width="1875" height="1114" alt="image" src="https://github.com/user-attachments/assets/03b1c815-d25c-4056-a693-edac05d4eac6" />

### KPIs At-a-Glance (2019–2022)

- **Total Orders Peak:** 4,019 (Dec-2020)
- **AOV by Year (USD):** 2019 **$229.64** → 2020 **$300.16** → 2021 **$254.71** → 2022 **$229.91**  
- **Loyalty Share:** **42%** of orders (45,693 / 108,124) and **39%** of sales ($10.97M / $28.11M)  
- **AOV (Grand Totals):** Non-loyalty **$275** vs Loyalty **$240**  
- **Refund Rate (All Products):** 2019 **5.73%**, 2020 **9.22%**, 2021 **3.61%**, 2022 **0.00%**; overall **4.97%**  

<img width="839" height="169" alt="image" src="https://github.com/user-attachments/assets/4ad56522-ad40-4c91-8bc1-96c4ba18af87" />

## Insights Summary

In order to evaluate Elist’s performance, I focused on the following key metrics:

- **Monthly Orders:** Seasonality and growth
- **Average Order Value (AOV):** Trends by year/month
- **Refund Rate:** By product, channel, and country
- **Loyalty Signals:** Member vs non-member order share, revenue, and AOV

### Order Volume & Growth
- Volume climbs through 2020, stays elevated into 2021, then steps down through 2022; Q4 is the most reliable spike each year.
- Member orders and revenue **overtake non-members for much of 2021 through Sep-2022**, before both cohorts cool.
- The volume curve is consistent across major products: fast run-up, holiday peak, then taper.

### Product Mix & Category Notes
- Members **over-index on AirPods, Webcams, and the 27" 4K Monitor**; **MacBook** skews non-member.
- Bose Soundsport weakens for members in 2022 relative to 2021.

### Average Order Value (AOV)
- Non-member AOV surges in 2020, then compresses through 2021–2022; member AOV is steadier.
- Clear **inversion windows** (mid-2021 to early-2022) where **member AOV ≥ non-member**.

### Refunds
- **Apple items refund more often** than non-Apple; **laptops** lead refund rates.
- **Refunded orders are higher value** than fulfilled orders, concentrating lost revenue; **MacBook Air** and the **27" monitor** account for the largest losses.
- **US/GB/CA** show higher Apple refund rates than several other countries.
- For Apple products, **direct/email/social** channels show higher refund incidence than those channels for non-Apple.

### Loyalty Program Performance
- Members **match or exceed** non-members on **order count** in multiple 2021 months and maintain strength into Sep-2022.
- **Member revenue** matches/exceeds non-member revenue across several 2021 months despite mixed AOV.
- Members’ product mix tilts to **accessories and monitors**, aligning with their volume advantage.

<img width="837" height="475" alt="image" src="https://github.com/user-attachments/assets/f7e6ac4c-9cc3-4985-8cb6-ed1c37916cda" />

*Figure 1 — Monthly Sales:* pronounced Q4 spikes; surge through 2020–2021; normalization in 2022.  



<img width="838" height="485" alt="image" src="https://github.com/user-attachments/assets/f689943c-2fc1-4710-96dd-a7d3e731f1b5" />

*Figure 2 — Average Order Value:* step-up in 2020, then compression in 2021–2022; loyalty outperforms in several months.  



<img width="835" height="480" alt="image" src="https://github.com/user-attachments/assets/94621264-7b19-4379-b93b-7d889ce41f9c" />

*Figure 3 — Order Count:* loyalty reaches parity/exceeds on order count in multiple 2021 months; select months show higher member revenue despite lower long-run AOV.

<img width="1418" height="844" alt="image" src="https://github.com/user-attachments/assets/f78308a7-4148-47ff-ba63-a9e3453f1376" />

*Figure 4 - Order Count by Country:* Sales recorded in most countries showing global reach. Most orders placed in English-speaking countries and Europe. 
*Please note that the United States (with 50,692 orders) has been excluded from this map for increased clarity.*


## Recommendations

- **Q4 demand is the biggest spike and members match/exceed non-members on orders in peak months.**  
  Shift more loyalty activity into **Oct–Dec** (promos, points boosts, reminders) to ride existing peaks; track lift in **member order share** and the **AOV gap** during Q4.

- **Member AOV trails long-run ($240 vs $275) but shows clear inversion months (e.g., Jul/Dec-2021, Jan-2022).**  
  Close the gap with **member-only bundles** that mirror those wins: anchor with **Monitors/Webcams/AirPods** (and MacBook where appropriate); aim for **AOV parity**.

- **Email is the strongest revenue channel for members (notably 2020 & 2022).**  
  Make **email the primary vehicle** for loyalty offers with a simple cadence (launch → reminder → last-chance); back it up with direct/social retargets. A/B test subject, offer, and timing.

- **Members over-index on accessories; attach rates drive member revenue even when AOV is flatter.**  
  Add **always-on attach prompts** for members at cart/checkout (cables, cases, webcams, AirPods). Measure **attach rate** and **basket lift** per cohort.

- **Refunds cluster in high-value Apple/laptop orders; refunded orders have higher AOV than fulfilled.**  
  Reduce risk with **pre-purchase compatibility/fit checks**, clearer specs, and **signature/confirmation** on high-ticket items. Monitor **refund rate & $ lost** before/after changes.

- **Apple refunds are higher in direct/email/social than the same channels for non-Apple.**  
  Add **gating content** in those flows (compatibility checkboxes, “what to expect” on returns) and throttle the most lenient offers on the highest-risk SKUs; compare **member vs non-member** refund deltas by channel.

- **Refunds disproportionately hit large orders.**  
  Create a **large-order watchlist**: flag carts above a threshold for proactive confirmation and post-purchase guidance to protect revenue.

  ## Dashboard

  This dashboard lets users filter by purchase month, product, region, and loyalty status, and highlights trends and performance across total sales, average order value, order count, refund rate, top products, regional contribution, and Member vs Non-Member comparisons.

<img width="1552" height="874" alt="image" src="https://github.com/user-attachments/assets/cbad7130-0676-4af9-8e0e-433dc81e4d26" />

## Appendix

See `Data and Queries/Elist SQL Queries.sql` for AOV by year, product name normalization, refund rates, loyalty splits, and various other metrics.  
