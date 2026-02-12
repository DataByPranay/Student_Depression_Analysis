# 🎓 Student Depression Analysis (SQL + Tableau)

## 📌 Project Overview

This project analyzes factors influencing student depression using **Microsoft SQL Server (T-SQL)** for data preparation and **Tableau** for data visualization.

The primary goal was to transform a raw student mental health dataset into a structured analytical model and build an interactive dashboard to uncover insights related to:

- Sleep patterns  
- Study hours  
- Academic pressure  
- Financial stress  
- Study satisfaction  
- Depression classification  

This project demonstrates the complete **data pipeline workflow** from raw data preparation to business-level visualization.

---

## 🛠 Tech Stack

- **Database:** Microsoft SQL Server  
- **Language:** T-SQL  
- **Visualization Tool:** Tableau Desktop  
- **Data Processing:** ETL (Extract, Transform, Load)  
- **Version Control:** GitHub  

---

## 🗂 Repository Structure

```
Student_Depression_Analysis/
│
├── Dataset/
│
├── Student_Depression_ETL_Process.sql
│
├── Student Depression Analysis.twbx
│
├── Student_Depression_Analysis_Dashboard.png
│
├── README.md
│
└── LICENSE
```

---

## 🔄 Data Preparation (SQL Layer)

All cleaning, transformation, and feature engineering tasks were performed in SQL Server before connecting to Tableau.

### 1️⃣ Database Setup
- Created dedicated database: `Tableau Project 1`
- Loaded raw dataset into SQL Server

---

### 2️⃣ Data Cleaning

✔ Standardized **Gender column**  
- Female → F  
- Male → M  

✔ Checked for NULL and blank values  

✔ Standardized **Depression column**  
- 0 → No  
- 1 → Yes  

---

### 3️⃣ Feature Engineering

✔ Created **Age_Group column**
- A1 → 18–24  
- A2 → 25–30  
- A3 → Above 30  

✔ Added **Index_Column (Identity Column)**  
Used as a surrogate key for structured analysis.

---

### 4️⃣ Column Distribution Analysis

Performed categorical distribution checks for:

- Academic Pressure  
- Study Satisfaction  
- Sleep Duration  
- Dietary Habits  
- Suicidal Thoughts  
- Study Hours  
- Financial Stress  
- Family History of Mental Illness  
- Depression  

This ensured data consistency before dashboard creation.

---

## 📊 Tableau Dashboard Overview

The interactive dashboard visualizes relationships between lifestyle factors and student mental health indicators.

### 🔹 Sleep Duration vs Student Count
Shows distribution of students across sleep categories:
- Less than 5 hours  
- 5–6 hours  
- 7–8 hours  
- More than 8 hours  

---

### 🔹 Study Hours vs Student Count
Displays trend of student count across study hours (0–12 hours).

---

### 🔹 Study Satisfaction Analysis
Visual comparison of student count across satisfaction levels.

---

### 🔹 Academic Pressure Analysis
Highlights pressure levels and corresponding student distribution.

---

### 🔹 Financial Stress Analysis
Analyzes stress categories and their impact on students.

---

## 📈 Key Insights

- Moderate sleep duration (7–8 hours) shows strong representation.
- Academic pressure level 3 has the highest student count.
- Study satisfaction level 4 has significant distribution.
- Financial stress distribution appears balanced across levels.
- Depression categorization enables clearer segmentation for analysis.

---

## 🎯 Business Objective

The objective of this project is to identify behavioral and academic patterns associated with student mental health conditions and provide analytical insights that can support:

- Academic counseling strategies  
- Student wellness programs  
- Institutional policy planning  

---

## 🚀 How to Run This Project

1. Open SQL Server Management Studio.
2. Execute `Student_Depression_ETL_Process.sql`.
3. Connect Tableau to the cleaned dataset.
4. Open `Student Depression Analysis.twbx`.
5. Explore the interactive dashboard.

---

## 💡 Skills Demonstrated

- Data Cleaning & Transformation (T-SQL)
- Feature Engineering
- Data Modeling Concepts
- Categorical Segmentation
- Dashboard Design & Storytelling
- Analytical Thinking
- End-to-End Data Workflow

---

## 📜 License

This project is licensed under the MIT License.
