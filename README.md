# 💾 SQL Practice Queries: Constraints, Clauses & Subqueries

![Language](https://img.shields.io/badge/Language-SQL-blue.svg)
![RDBMS](https://img.shields.io/badge/RDBMS-MySQL%20%2F%20PostgreSQL-orange.svg)
![Focus](https://img.shields.io/badge/Focus-Syntax%20%26%20Problem%20Solving-green.svg)

## 📌 Overview
This repository contains a curated collection of foundational and intermediate SQL scripts designed to demonstrate core relational database operations, schema integrity constraints, and query filtering clauses.

---

## 🗂️ Scripts Overview

| File | Core Concept | Description |
| :--- | :--- | :--- |
| `SQL_Constarints.sql` | Table Constraints | Implementation of `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `NOT NULL`, `CHECK`, and `DEFAULT` constraints. |
| `sql_clause_1.sql` | Basic Query Clauses | Data selection, filtering with `WHERE`, sorting with `ORDER BY`, pattern matching with `LIKE`, and `LIMIT` / `TOP`. |
| `sql_clauses_2.sql` | Aggregation Clauses | Grouping records using `GROUP BY`, conditional group filtering with `HAVING`, and aggregate functions (`COUNT`, `SUM`, `AVG`). |
| `SQL_Practice-3.sql` | Intermediate Practice | Practical multi-table queries, subqueries, `UNION` / `UNION ALL`, and conditional logic (`CASE WHEN`). |

---

## 💡 Key SQL Techniques
```sql
-- Example: Conditional Aggregation & Filtering
SELECT 
    department_id,
    COUNT(employee_id) AS total_employees,
    AVG(salary) AS avg_salary
FROM employees
WHERE is_active = 1
GROUP BY department_id
HAVING AVG(salary) > 50000
ORDER BY avg_salary DESC;
```

---

## 👤 Author
- **Vandana Illipilla** - [GitHub Profile](https://github.com/Vandana251)
