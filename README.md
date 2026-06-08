
# Data Engineering Pipeline using Bruin Tool & DuckDB

##  Project Overview
An end-to-end data engineering pipeline built to demonstrate modern data product orchestration. This project focuses on automated data ingestion, transformation, and serving using the open-source **Bruin tool** combined with an embedded **DuckDB** relational database.

##  Tech Stack & Key Technologies
- **Orchestration & Governance:** Bruin Tool (Open-Source Analytic Platform)
- **Database Engine:** DuckDB (In-process SQL OLAP Database)
- **Languages:** SQL, Jinja-like Yaml configurations
- **Environment:** CLI / GitBash (Windows-based)

---

##  Pipeline Architecture & Workflow

### 1. Database Connection Configuration (`.bruin.yml`)
Established a robust, direct pipeline connection to an embedded DuckDB instance (`isey.db`) by configuring environment assets to map local storage pathing seamlessly.

### 2. Data Ingestion (`assets/actor.asset.yml`)
- **Source:** Raw structured CSV data (extracted from real-world Kaggle datasets).
- **Ingestion Execution:** Defined a YAML asset schema configuration to enforce data types (`varchar`, `integer`) during automated data loading.
- **Validation:** Automated ingestion workflows utilizing `bruin run` pipelines to process raw data dumps seamlessly into relational tables.

### 3. Data Transformation (`assets/actor.sql`)
Implemented pipeline transformations within the database layer using advanced SQL analytics:
- **Type Casting:** Normalized corrupted datatypes from string formats (`varchar`) into explicit analytical formats (`integer` and `decimal`).
- **Data Aggregation:** Aggregated large-scale entity logging (reducing data volume from **191,682 rows down to 9,623 rows**) using complex analytical operations (`AVG`, `GROUP BY`, and `ORDER BY`) to analyze the average ratings across unique entities.

### 4. Data Serving
Developed automated serving tasks within the SQL workflow using `COPY` protocols to output clean analytics back to stakeholders:
- Generated actionable downstream assets: `change_format.csv` and `average_rating.csv` to empower data analysts and reverse ETL integration blocks.

---

## 📊 Experimental Results & Validation

### Pipeline Validation Screen
- Successfully validated and executed the pipeline across assets without errors:
```text
Analyzed the pipeline 'bruin-duckdb' with 3 assets.
Pipeline: bruin-duckdb
No issues found
Successfully validated 3 assets across 1 pipeline, all good.
Starting the pipeline execution...
Finished: raw.actor (Successfully loaded items)
