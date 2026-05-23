-- ================================================
-- Financial Statement Analysis
-- Dataset: income_statement_db.laporan_keuangan
-- ================================================

-- Q1: View All Data
SELECT * FROM `income_statement_db.laporan_keuangan`;

-- Q2: Comparison of The Profitability of All Companies
SELECT
  perusahaan,
  periode,
  COALESCE(penjualan_bersih, pendapatan_jasa) AS total_pendapatan,
  laba_bersih,
  ROUND(net_margin_pct, 2)   AS net_margin_pct,
  ROUND(gross_margin_pct, 2) AS gross_margin_pct
FROM `income_statement_db.laporan_keuangan`
ORDER BY net_margin_pct DESC;

-- Q3: Companies with the Best Net Margin
SELECT
  perusahaan,
  ROUND(net_margin_pct, 2) AS net_margin_pct,
  CASE
    WHEN net_margin_pct >= 30 THEN 'SANGAT BAIK ✅'
    WHEN net_margin_pct >= 10 THEN 'BAIK 👍'
    WHEN net_margin_pct >= 0  THEN 'CUKUP ⚠️'
    ELSE 'MERUGI ❌'
  END AS status_profitabilitas
FROM `income_statement_db.laporan_keuangan`
ORDER BY net_margin_pct DESC;

-- Q4: Debt Structure Analysis (Leverage)
SELECT
  perusahaan,
  total_aset,
  total_liabilitas,
  total_ekuitas,
  ROUND(debt_ratio_pct, 2)   AS debt_ratio_pct,
  ROUND(equity_ratio_pct, 2) AS equity_ratio_pct,
  CASE
    WHEN debt_ratio_pct > 60 THEN 'HIGH RISK ❌'
    WHEN debt_ratio_pct > 40 THEN 'MODERATE ⚠️'
    ELSE 'AMAN ✅'
  END AS status_leverage
FROM `income_statement_db.laporan_keuangan`
WHERE total_aset > 0
ORDER BY debt_ratio_pct DESC;

-- Q5: Load Efficiency (Expense Ratio)
SELECT
  perusahaan,
  total_beban_operasional,
  COALESCE(penjualan_bersih, pendapatan_jasa) AS pendapatan,
  ROUND(total_beban_operasional /
    COALESCE(NULLIF(penjualan_bersih,0), NULLIF(pendapatan_jasa,0)) * 100, 2)
    AS expense_ratio_pct
FROM `income_statement_db.laporan_keuangan`
WHERE total_beban_operasional > 0
ORDER BY expense_ratio_pct ASC;

-- Q6: COGS vs Sales Analysis (Trading Companies)
SELECT
  perusahaan,
  penjualan_bersih,
  hpp,
  laba_kotor,
  ROUND(gross_margin_pct, 2) AS gross_margin_pct,
  ROUND(hpp / NULLIF(penjualan_bersih,0) * 100, 2) AS hpp_ratio_pct
FROM `income_statement_db.laporan_keuangan`
WHERE penjualan_bersih > 0
ORDER BY gross_margin_pct DESC;

-- Q7: Dashboard Summary of All Companies
SELECT
  perusahaan,
  periode,
  COALESCE(NULLIF(penjualan_bersih,0), pendapatan_jasa) AS pendapatan,
  laba_bersih,
  ROUND(net_margin_pct,1)   AS net_margin,
  ROUND(debt_ratio_pct,1)   AS debt_ratio,
  ROUND(equity_ratio_pct,1) AS equity_ratio,
  CASE WHEN laba_bersih > 0 THEN 'PROFIT' ELSE 'LOSS' END AS status
FROM `income_statement_db.laporan_keuangan`
ORDER BY net_margin_pct DESC;
