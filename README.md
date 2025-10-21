# freehold_films
Tracking all financial and personnel data for vertical-format films. 
# 🎬 Vertical Film Budget Tracker

A normalized MySQL database and Tableau dashboard for tracking the budgets, personnel, and expenses of vertical-format films.

## 📁 Structure

- `schema/` – SQL file to create normalized tables
- `data/` – All CSV files to populate the tables
- `scripts/` – Python (or shell) scripts for data loading
- `tableau/` – Tableau workbooks and dashboards
- `docs/` – ER diagrams or planning docs

## 📊 Features

- Tracks clients, films, and full production crew
- Supports union/non-union cost analysis
- Tied to specific production phases (Pre, Prod, Post, Overhead)
- Tableau-ready schema for reporting

## 🧰 Tech Stack

- MySQL 8.x
- Python (for data loading)
- Tableau (for reporting)

## 🛠️ Setup Instructions

1. Clone the repo
2. Run the schema in MySQL:

    ```bash
    mysql -u root -p < schema/mysql_schema.sql
    ```

3. Load the CSV data manually or via Python script
4. Connect Tableau to MySQL and build reports

## 📈 Example Dashboards

- Budget vs. Spend
- Phase-wise Cost Breakdown
- Payroll by Role / Person
- Client Summary

---

## 📄 License

MIT or similar.
completed database set up
Building reports in tabluea
