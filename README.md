# 📊 Credit Risk Analysis with dbt + Snowflake + Power BI

This project analyzes credit risk based on customer demographics and financial data using the **default of credit card clients** dataset. The pipeline is built using **dbt** (Data Build Tool) for transformation, **Snowflake** as the data warehouse, and **Power BI** for interactive visualization.

---

## 🧰 Tech Stack

- **dbt (Data Build Tool)** for transformation logic
- **Snowflake** as the cloud data warehouse
- **Power BI** for building insightful dashboards
- **SQL** for feature engineering
- **Excel** dataset as the raw data source

---

## 🗂️ Project Structure

```
.
├── models/
│   ├── credit_risk_analysis.sql         # Main transformation logic
│   └── schema.yml                       # Column tests and documentation
├── seeds/
│   └── default of credit card clients.xlsx  # Raw dataset (uploaded manually to Snowflake)
├── dbt_project.yml                      # dbt project config
├── README.md                            # Project documentation
├── Credit Risk2.pbix                    # Power BI dashboard file
```

---

## 🔍 Model Overview

### `credit_risk_analysis.sql`

This model performs the following key transformations:

- **Null Handling**: Replaces `NULL` values in `limit_bal` with 0.
- **Gender Encoding**: Converts `sex` values to `'Male'`, `'Female'`, or `'Unknown'`.
- **Education Encoding**: Maps education codes to human-readable labels such as `'Graduate School'`, `'University'`, etc.

```sql
coalesce(limit_bal, 0) as credit_limit,

case
  when sex = 1 then 'Male'
  when sex = 2 then 'Female'
  else 'Unknown'
end as gender,

case
  when education = 1 then 'Graduate School'
  when education = 2 then 'University'
  when education = 3 then 'High School'
  else 'Other'
end as education_level
```

---

## 🔗 Snowflake Integration

The raw Excel file is uploaded to Snowflake as a table. dbt reads this data, applies the transformations, and materializes it as a **table** in Snowflake.

Ensure your `~/.dbt/profiles.yml` is configured correctly to connect to your Snowflake account.

---

## 📈 Power BI Dashboard

The transformed dataset was imported into Power BI for analysis. Key insights include:

- Default probability by gender and education level
- Distribution of credit limits
- Monthly payment behaviors

The `.pbix` file (`Credit Risk2.pbix`) is included in this repo for interactive exploration.

---

## 🧪 Testing and Quality

- Data quality tests defined in `schema.yml`
- Auto formatting and linting handled by `sqlfmt`

---

## 🚀 How to Run

1. Clone the repository (or download ZIP if you're not using Git)
2. Set up Snowflake credentials in your `~/.dbt/profiles.yml`
3. (Optional) Upload the Excel dataset to your Snowflake database
4. Run the dbt pipeline:
   ```bash
   dbt deps
   dbt seed        # if using seeds
   dbt run
   dbt test
   ```

---

## 📂 Data Source

- [UCI Repository: Default of Credit Card Clients Dataset](https://archive.ics.uci.edu/ml/datasets/default+of+credit+card+clients)

---

## 👤 Author

**Balakrishnan Iyer**  
_Data Science Research Services_

[LinkedIn](https://www.linkedin.com/in/balakrishnan-iyer-811436143)
