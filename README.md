# Elist eCommerce Insights and Recommendation Engine - Project Overview

**The goal of this project is to investigate multi-year order trends at Elist and translate them into clear recommendations on inventory, marketing, and loyalty-program strategy to be shared with various stakeholder teams.** The analysis focuses on 2019–2022 and is designed to be scan-friendly for leadership and town-hall use.

Founded as a digital-first electronics retailer, Elist sells devices and accessories through web and mobile channels. Coming out of the pandemic demand surge, leadership wants a grounded view of how sales have normalized, which products truly drive the business, and whether their loyalty program is delivering sufficient ROI to justify its continuation.

**Elist rode a pandemic surge with strong Q4 seasonality, then normalized in 2022. The loyalty program concentrates volume (many months where member orders meet or beat non-members) but trails on long-run AOV, with clear windows where members out-spend non-members.**

This project also includes a machine learning-based Recommendation Engine that uses sign-up context to generate Top-K product suggestions for new members. It is designed to run at sign-up and feed a short recommendations block into the welcome email to accelerate first-order conversion. This model was able to to achieve **~95%** accuracy on the test set.

This repository includes a stakeholder-ready set of insights, a reproducible SQL workbook, a high-level KPI dashboard, a Recommendation Engine, and recommendations that map directly to budget and planning levers.

## Dataset Structure

This dataset consists of five tables, including information on customers, suppliers, orders, order statuses, and geographic information.

<img width="1875" height="1114" alt="image" src="https://github.com/user-attachments/assets/03b1c815-d25c-4056-a693-edac05d4eac6" />

### KPIs At-a-Glance (2019–2022)

- **Total Orders Peak:** 4,019 (Dec-2020)
- **AOV by Year (USD):** 2019 **$229.64** → 2020 **$300.16** → 2021 **$254.71** → 2022 **$229.91**  
- **Loyalty Share:** **42%** of orders (45,693 / 108,124) and **39%** of sales ($10.97M / $28.11M)  
- **AOV (Grand Totals):** Non-loyalty **$275** vs Loyalty **$240**  
- **Refund Rate (All Products):** 2019 **5.73%**, 2020 **9.22%**, 2021 **3.61%**, 2022 **0.00%**; overall **4.97%**

*Note that the 2022 refund rate is likely anaomolous or due to a data error. The next step would be communication with the Sales team to understand the cause.*

<img width="839" height="169" alt="image" src="https://github.com/user-attachments/assets/4ad56522-ad40-4c91-8bc1-96c4ba18af87" />

## Insights Summary

In order to evaluate Elist’s performance, I focused on the following key metrics:

- **Monthly Orders:** Seasonality and growth
- **Average Order Value (AOV):** Trends by year/month
- **Refund Rate:** By product, channel, and country
- **Loyalty Signals:** Member vs non-member order share, revenue, and AOV

### Order Volume & Growth
- Volume climbs through 2020, stays elevated into 2021, then steps down through 2022; **Q4 is the most reliable spike each year**.
- Member orders and revenue **overtake non-members for much of 2021 through Sep-2022**, before both groups cool.
- The volume curve is consistent across major products: fast run-up, holiday peak, then taper.

### Product Mix & Category Notes
- Members **over-index on AirPods, Webcams, and the 27" 4K Monitor**; **MacBook** skews non-member.
- Bose Soundsport weakens for members in 2022 relative to 2021.

### Average Order Value (AOV)
- Non-member AOV surges in 2020, then declines through 2021–2022; member AOV is steadier.
- Clear **inversion windows** (mid-2021 to early-2022) where **member AOV ≥ non-member**.

### Refunds
- **Apple items refund more often** than non-Apple; **laptops** lead refund rates.
- **Refunded orders are higher value** than fulfilled orders; **MacBook Air** and the **27" 4K monitor** account for the largest losses.

### Loyalty Program Performance
- Members **match or exceed** non-members on **order count** in multiple 2021 months and maintain strength into Sep-2022.
- **Member revenue** matches/exceeds non-member revenue across several 2021 months despite mixed AOV.
- Members’ product mix tilts to **accessories and monitors**, aligning with their higher volume.

<img width="837" height="475" alt="image" src="https://github.com/user-attachments/assets/f7e6ac4c-9cc3-4985-8cb6-ed1c37916cda" />

*Figure 1 — Monthly Sales:* pronounced Q4 spikes; surge through 2020–2021; normalization in 2022.  



<img width="838" height="485" alt="image" src="https://github.com/user-attachments/assets/f689943c-2fc1-4710-96dd-a7d3e731f1b5" />

*Figure 2 — Average Order Value:* step-up in 2020, then decrease in 2021–2022; loyalty outperforms in several months.  



<img width="835" height="480" alt="image" src="https://github.com/user-attachments/assets/94621264-7b19-4379-b93b-7d889ce41f9c" />

*Figure 3 — Order Count:* loyalty reaches parity/exceeds on order count in multiple 2021 months; select months show higher member revenue despite lower long-run AOV.

<img width="1418" height="844" alt="image" src="https://github.com/user-attachments/assets/f78308a7-4148-47ff-ba63-a9e3453f1376" />

*Figure 4 - Order Count by Country:* sales recorded in most countries showing global reach. Most orders placed in English-speaking countries and Europe. 
*Please note that the United States (with 50,692 orders) has been excluded from this map for increased clarity.*


## Recommendations

Given the insights above, focused on key metrics, I provided stakeholders with the following recommendations:

- **Q4 demand is the biggest seasonal spike and members match/exceed non-members on orders in peak months.**  
  Shift more loyalty activity into **Oct–Dec** (promos, points boosts, reminders) to ride existing peaks; track lift in **member order share** and the **AOV gap** during Q4.

- **Member AOV trails long-run ($240 vs $275) but shows clear inversion months (e.g., Jul/Dec-2021, Jan-2022).**  
  Close the gap with **member-only bundles** that mirror known patterns: anchor with **Monitors/Webcams/AirPods** (and MacBook where appropriate); aim for **AOV parity**.

- **Email is the strongest revenue channel for members (notably 2020 & 2022).**  
  Make **email the primary vehicle** for loyalty offers with a simple cadence (launch → reminder → last-chance); back it up with direct/social targeting. A/B test subject, offer, and timing.

- **Refunds cluster in high-value Apple/laptop orders; refunded orders have higher AOV than fulfilled.**  
  Reduce risk with **pre-purchase compatibility/fit checks**, clearer specs, and **signature/confirmation** on high-value items. Monitor **refund rate & $ lost** refund rates for changes.

- **Apple refunds are higher in direct/email/social than the same channels for non-Apple.**
  **Offer AppleCare with Apple devices.** Present AppleCare as a simple add-on at checkout and in a post-purchase reminder. The goal is to route setup and defect issues to Apple’s repair and guidance services instead of returns. Track refund rate and $/1k orders, AppleCare attach rate, margin impact, and conversion; keep terms clear and optional.

  ## Dashboard

This Power BI dashboard lets users filter by purchase month, product, region, and loyalty status, and highlights trends and performance across total sales, average order value, order count, refund rate, top products, regional contribution, and Member vs Non-Member comparisons.

<img width="1552" height="874" alt="image" src="https://github.com/user-attachments/assets/cbad7130-0676-4af9-8e0e-433dc81e4d26" />

## Recommendation Engine

**What it does**

My Recommendation Engine suggests a short list of Top-K products for brand-new members at sign-up using context I already collect (year/month, platform, channel, country/region, loyalty). After scoring, I can drop those picks into a “Top picks for your first order” email. These emails will be rolled out as an A/B test to new users seeking to increase first-order conversion rate. 

#### How to Run

**1. Prerequsites**
- Python 3.9–3.12

Install:

```
pip install -U scikit-learn pandas numpy joblib
```

**2. Data Location**

Replace the current path (below) with the new data path:

```
path = r"c:\Users\danac\OneDrive - OneWorkplace\Documents\Elist\Elist ML Data.csv"
```

**3. Train & save the model (in the notebook)**
-Run the training cells (GridSearchCV). You’ll see Top-3 accuracy printed.
-Persist the fitted pipeline (best_model) with:

```
from pathlib import Path
import joblib

ARTIFACTS_PATH = Path("models/recommendation_engine.joblib")
ARTIFACTS_PATH.parent.mkdir(parents=True, exist_ok=True)

joblib.dump({
    "model": best_model,
    "label_encoder": le,
    "feature_cols": list(X.columns),  # must match the columns used to train
}, ARTIFACTS_PATH)

print(f"Saved → {ARTIFACTS_PATH}")

```

**4. Use the saved model**

```

import joblib, pandas as pd, numpy as np
from datetime import datetime
from pathlib import Path

ARTIFACTS_PATH = Path("models/recommendation_engine.joblib")

def recommend_topk(
    context: dict,
    when: str | datetime | None = None,
    topk: int = 3,
    artifacts_path: Path = ARTIFACTS_PATH,
):
    art = joblib.load(artifacts_path)
    model = art["model"]; le = art["label_encoder"]; feature_cols = art["feature_cols"]

    # Derive time features (year, month) — matches training
    ts = pd.to_datetime(when) if when is not None else pd.Timestamp.utcnow()
    base = {"ts_year": int(ts.year), "ts_month": int(ts.month)}

    # Build one-row input
    row = {c: base.get(c, None) for c in feature_cols}
    for k, v in (context or {}).items():
        if k in row:
            row[k] = v
    X_one = pd.DataFrame([row], columns=feature_cols)

    proba = model.predict_proba(X_one)[0]
    k = min(int(topk), len(proba))
    top_idx = np.argsort(proba)[-k:][::-1]
    labels = le.inverse_transform(top_idx)
    scores = proba[top_idx]
    return [(str(lbl), float(s)) for lbl, s in zip(labels, scores)]
```

**Example**

```
recommend_topk({
    "purchase_platform": "Web",
    "marketing_channel": "Email",
    "account_creation_method": "Email",
    "country_code": "US",
    "region": "North America",
    "loyalty_program": "Yes",
}, when="2024-11-15T14:30:00Z", topk=3)
```

## Appendix

See `Data and Queries/Elist SQL Queries.sql` for AOV by year, product name normalization, refund rates, loyalty splits, and various other metrics.  
