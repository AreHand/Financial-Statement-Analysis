# 📊 Financial Statement Analysis — Income Statement
**From Financial Data to Business Insight — A Data Analytics Portfolio Project**

---

# 📌 Project Overview
This project is an in-depth analysis of Income Statements from 4 companies
with different business characteristics and industries.
Core objective:

"To compare profitability performance, expense efficiency, and financial health
across companies using a data analytics approach."

---

# 🎯 Problem Statement
Each company has a unique revenue and expense structure.
The key questions this project aims to answer:

1. Which company is the most profitable?
2. How efficiently are operating expenses managed?
3. What does the financing structure (debt vs equity) look like?
4. Which company carries the highest financial risk?

---

# 🏢 Companies Analyzed
| # | Company | Business Type | Period |
|---|---|
| 1 | Kantor Konsultan Wirausaha | Consulting Services | December 2015 |
| 2 | Trading Company (Exercise I) | Trading / Merchandise | 2015 |
| 3 | PT SEKAR | Manufacturing / Trading | December 2019 |
| 4 | PT ABC | Services | 2020 |

---

# 📊 Dataset
| Info | Details |
|---|---|
| Source | Income Statement Exercise (Excel) |
| Sheets | 6 sheets (Journal, Worksheet, Financial Report, Exercise I, Exercise II, Balance Sheet) |
| Components | General Journal, Ledger, Trial Balance, Worksheet, Income Statement, Balance Sheet |

---

# Key Analysis Columns:
| Column | Description |
|---|---|
| total_revenue | Total revenue / net sales |
| cogs | Cost of Goods Sold |
| gross_profit | Revenue minus COGS |
| total_operating_expenses | Total all expenses |
| net_income | Net profit/loss after tax |
| total_assets  | Total company assets |
| total_liabilities | Total debt/obligations |
| total_equity | Total capital/equity |

---

# 🛠️ Tools & Technologies
- BigQuery
- Python
- Colab
- SQL
- GitHub badges

---

# 🔍 Analysis Results
**Profitability Summary**
| Company | Net Margin | Gross Margin | Status |
|---|---|---|---|
| Kantor Konsultan Wirausaha | 75.8% | 100% | 🏆 Best |
| PT SEKAR | 5.9% | 44.3% | ✅ Good |
| Trading Company (Ex. I) | 5.1% | 34.4% | ✅ Fair |
| PT ABC | -5.1% | — | ❌ Loss |

**Financial Health Summary**
| Company | Debt Ratio | quity Ratio | Current Ratio | Status |
|---|---|---|---|---|
| Kantor Konsultan Wirausaha | 15.2% | 84.8% | — | ✅ Very Healthy |
| PT ABC | 43.9% | 56.1% | 0.72x | ⚠️ Needs Attention |

---

# Key BigQuery Query
-- Profitability Comparison — All Companies
SELECT
  company_name,
  COALESCE(net_sales, service_revenue) AS total_revenue,
  net_income,
  ROUND(net_margin_pct, 2) AS net_margin_pct,
  CASE
    WHEN net_margin_pct >= 30 THEN 'EXCELLENT ✅'
    WHEN net_margin_pct >= 10 THEN 'GOOD 👍'
    WHEN net_margin_pct >= 0  THEN 'FAIR ⚠️'
    ELSE 'LOSS ❌'
  END AS profitability_status
FROM `income_statement_db.financial_report`
ORDER BY net_margin_pct DESC;

---

# 💡 Key Insights
**1. 🏆 Service Business Significantly More Profitable than Trading**

Kantor Konsultan Wirausaha recorded a net margin of 75.8% — far exceeding trading companies at only 5–6%. The main reason:
service businesses have no COGS eroding the margin.

**2. ⚡ Salary Expense = Biggest Profitability Threat**

Across all companies, salary/wages expense is the single largest cost component. Workforce efficiency is the primary
driver of sustainable profitability.

**3. 🔄 High Gross Margin ≠ High Net Margin**

PT SEKAR has an impressive gross margin of 44.3%, yet net margin is only 5.9% because general & administrative expenses
are disproportionately large (IDR 76.1M = 23.6% of revenue), significantly eroding operating income.

**4. ⚠️ PT ABC is in Financial Warning Zone**

A current ratio of 0.72x (below the safe threshold of 1.0x) signals that current assets are insufficient to cover short
-term liabilities. Immediate attention to liquidity management is required.

**5. 💰 KKW Has the Healthiest Financial Structure**

With a debt ratio of only 15.2% and equity ratio of 84.8%, the business is almost entirely self-funded — financial risk is
minimal.

**6. 📉 Interest Expense Significantly Drains Trading Company Profit**

In Exercise I, interest expense of 176,000 reduced operating income from 510,000 to just 334,000 before tax — a 34.5%
erosion solely from debt servicing costs.

---

# 📈 Recommendations
| Company | Recommendation |
|---|---|
| KKW | Maintain current cost structure — extremely efficient. Scale revenue through client acquisition |
| PT SEKAR | Optimize G&A expenses which are disproportionately high at 23.6% of revenue |
| Trading Co. I | Reduce interest burden through gradual debt repayment strategy |
| PT ABC | Prioritize increasing current assets and reducing short-term liabilities immediately |

---

👤 Author
Name : Dwi Farhan
Email : mighty.coord@gmail.com
LinkedIn : linkedin.com/in/dwi-farhan

---

"Numbers in a financial report are not just accounting data —
behind them lies the story of a business's health, risk, and future potential."
