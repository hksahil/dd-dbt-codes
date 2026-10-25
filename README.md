# Complete dbt + DuckDB Mastery Guide & Codebase

A hands-on, end-to-end curriculum for mastering **dbt (data build tool)** paired with **DuckDB**. Each folder is an isolated, runnable laboratory demonstrating a specific enterprise data engineering pattern.

---

## Repository Architecture

```
dbt-duckdb/
├── duckdb-custom/          # Source database generator (create_db.py, dev.duckdb)
├── dbt-first-pipeline/     # Hello World / Basic dbt workflow & connection
├── dbt-second-pipeline/    # Medallion Architecture (Staging, Intermediate, Marts)
├── dbt-materialisations/   # Materializations & Incremental Strategies (Merge, Append, Delete+Insert)
├── dbt-snapshots/          # SCD (Slowly Changing Dimensions Type 1 & Type 2 Snapshots)
├── dbt-fifth-pipeline/     # Jinja, Variables, Control Flow, Hooks & Grants
├── dbt-testing/            # Testing Framework (Generic, Singular, Custom Macros)
├── dbt-seeds/              # dbt Seeds (Static CSVs as Database Tables)
├── dbt-documentation/      # dbt Docs (Doc Blocks, Descriptions, Lineage & UI)
├── dbt-dag/                # Directed Acyclic Graph (DAG) & Graph Node Selection (+, +model+)
├── dbt-metrices/           # dbt Semantic Layer (Semantic Models, Measures, Metrics)
├── dbt-macros/             # dbt Macros (Jinja Functions, DRY SQL, Dynamic Code Gen)
├── dbt-packages/           # dbt Packages (dbt-utils, Great Expectations, Elementary)
├── dbt-reusability/        # dbt Reusability (sources.yml, schema.yml, docs.md, YAML Anchors)
└── inspect.py              # Database inspector utility
```

---

## Folder-by-Folder Guide

### 1. `duckdb-custom/` — Raw Source Database
- **Concept:** Preparing raw OLTP/source tables in an embedded analytical warehouse.
- **Key Script:** [`create_db.py`](./duckdb-custom/create_db.py)
- **Input:** Hardcoded tuple values in Python.
- **Output:** `duckdb-custom/dev.duckdb` containing base tables:
  - `users`: `(id INTEGER, name VARCHAR)`
  - `orders`: `(order_id INTEGER, user_id INTEGER, amount INTEGER, status VARCHAR, order_date DATE)`

---

### 2. `dbt-first-pipeline/` — The Hello World Pipeline
- **Concept:** Foundational dbt architecture and configuration.
  - Setting up `dbt_project.yml` and `profiles.yml`
  - Connecting dbt to DuckDB
  - Building your first SQL transformation model
- **Input:** Raw `users` and `orders` tables from `dev.duckdb`.
- **Key Model:** [`user_orders.sql`](./dbt-first-pipeline/models/user_orders.sql) (joins users and orders).
- **Output:** A view or table named `user_orders` in the database.
- **Key Commands:**
  ```bash
  cd dbt-first-pipeline
  dbt debug
  dbt run
  ```

---

### 3. `dbt-second-pipeline/` — Medallion Architecture & Data Modeling
- **Concept:** Industry-standard layered data engineering architecture (Staging ➔ Intermediate ➔ Marts / Facts & Dimensions).
- **Structure:**
  - `models/staging/`: Raw data cleansing and renaming.
    - [`stg_users.sql`](./dbt-second-pipeline/models/staging/stg_users.sql)
    - [`stg_orders.sql`](./dbt-second-pipeline/models/staging/stg_orders.sql)
  - `models/marts/`: Business-ready analytics layer.
    - [`int_user_order_metrics.sql`](./dbt-second-pipeline/models/marts/int_user_order_metrics.sql) (Aggregations per customer).
    - [`fct_user_orders_analytics.sql`](./dbt-second-pipeline/models/marts/fct_user_orders_analytics.sql) (Enriched final fact table).
- **Input:** Raw source tables.
- **Output:** Clean staging views + analytical fact/intermediate models.
- **Key Commands:**
  ```bash
  cd dbt-second-pipeline
  dbt run
  ```

---

### 4. `dbt-materialisations/` — Materializations & Incremental Strategies
- **Concept:** How dbt builds models in the database and manages big-data incremental processing.
- **Core Topics:**
  1. **Sources & Refs:** [`sources.yml`](./dbt-materialisations/models/sources.yml) (`{{ source(...) }}` vs `{{ ref(...) }}`).
  2. **The 4 Core Materializations:**
     - `view`: [`demo_view.sql`](./dbt-materialisations/models/demo_view.sql) (re-computed on every query).
     - `table`: [`demo_table.sql`](./dbt-materialisations/models/demo_table.sql) (fast read, dropped & recreated each run).
     - `ephemeral`: [`demo_ephemeral.sql`](./dbt-materialisations/models/demo_ephemeral.sql) (CTE interpolated into downstream models).
     - `incremental`: [`demo_incremental.sql`](./dbt-materialisations/models/demo_incremental.sql) (appends/updates only new rows via `is_incremental()`).
  3. **Incremental Strategies & Dual Keys (Unique Key vs Watermark):**
     - [`inc_strategy_append.sql`](./dbt-materialisations/models/inc_strategy_append.sql) (`append` only for immutable logs).
     - [`inc_strategy_delete_insert.sql`](./dbt-materialisations/models/inc_strategy_delete_insert.sql) (deletes existing keys, inserts fresh data).
     - [`inc_strategy_merge.sql`](./dbt-materialisations/models/inc_strategy_merge.sql) (standard UPSERT using `unique_key='order_id'` and date watermark).
     - [`inc_timestamp_watermark.sql`](./dbt-materialisations/models/inc_timestamp_watermark.sql) (Production dual-key pattern: `unique_key='order_id'` + `order_date` watermark).
- **Key Commands:**
  ```bash
  cd dbt-materialisations
  dbt run
  dbt run --full-refresh
  ```

---

### 5. `dbt-snapshots/` — SCD (Slowly Changing Dimensions) & Snapshots
- **Concept:** Tracking historical mutations of dimensions over time without losing past state.
- **Core Topics:**
  - **SCD Type 1:** [`dim_users_scd1.sql`](./dbt-snapshots/models/dim_users_scd1.sql) (Overwrites old data with current state).
  - **SCD Type 2 Snapshots:** [`users_snapshot.sql`](./dbt-snapshots/snapshots/users_snapshot.sql)
    - Uses `strategy='check'` with `check_cols=['name']` and `unique_key='id'`.
    - Automatically generates 4 dbt audit columns:
      - `dbt_scd_id`: Unique hash identifying the record version.
      - `dbt_updated_at`: Timestamp when the snapshot processed the row.
      - `dbt_valid_from`: Timestamp when this version became active.
      - `dbt_valid_to`: `NULL` while current, or superseded timestamp when changed.
  - **Downstream Consumer:** [`dim_users_scd2.sql`](./dbt-snapshots/models/dim_users_scd2.sql) (exposing point-in-time vs current state).
- **Key Commands:**
  ```bash
  cd dbt-snapshots
  dbt snapshot
  dbt run
  ```

---

### 6. `dbt-fifth-pipeline/` — Jinja, Variables, Control Flow, Hooks & Grants
- **Concept:** Advanced dbt SQL programmability, Jinja macros, model lifecycle hooks, and access governance.
- **Core Topics:**
  1. **Variables (`var`):** [`01_demo_variables.sql`](./dbt-fifth-pipeline/models/01_demo_variables.sql)
     - Global config in `dbt_project.yml` + default fallbacks + CLI overrides (`--vars`).
  2. **Jinja Control Flow:** [`02_demo_jinja_control_flow.sql`](./dbt-fifth-pipeline/models/02_demo_jinja_control_flow.sql)
     - `if/else` environment switching (`{% if target.name == 'dev' %}`).
     - `for` loops (dynamic pivoting / column generation using `loop.last`).
  3. **Lifecycle Hooks:** [`03_demo_hooks.sql`](./dbt-fifth-pipeline/models/03_demo_hooks.sql)
     - `pre-hook`: SQL run before model execution (e.g. creating audit table, starting timer).
     - `post-hook`: SQL run after model completion (logging completion in `dbt_audit_logs`).
  4. **Grants (Access Control / RBAC):** [`04_demo_grants.sql`](./dbt-fifth-pipeline/models/04_demo_grants.sql)
     - Automated `GRANT SELECT ON ... TO <role>` in enterprise warehouses (Snowflake, BigQuery, Postgres).
- **Key Commands:**
  ```bash
  cd dbt-fifth-pipeline
  dbt run
  dbt run --vars '{"discount_rate": 0.25}'
  ```

---

### 7. `dbt-testing/` — Testing Framework & Data Quality
- **Concept:** End-to-end data validation and schema integrity enforcement.
- **Golden Rule:** dbt test queries return **bad rows** (0 rows = PASS, >0 rows = FAIL).
- **All Test Types Covered:**
  1. **Built-in Generic Tests:** [`models/schema.yml`](./dbt-testing/models/schema.yml)
     - `unique`: No duplicates on primary keys.
     - `not_null`: Ensuring required columns aren't NULL.
     - `accepted_values`: Ensuring values match allowed enums.
     - `relationships`: Referential integrity (foreign key validation).
  2. **Singular Tests (Custom SQL Queries):**
     - [`assert_total_order_amount_positive.sql`](./dbt-testing/tests/assert_total_order_amount_positive.sql): Asserts orders have `amount > 0`.
     - [`assert_no_future_orders.sql`](./dbt-testing/tests/assert_no_future_orders.sql): Asserts dates are never in the future.
  3. **Custom Generic Tests (Macros):**
     - [`macros/test_is_positive.sql`](./dbt-testing/macros/test_is_positive.sql): Reusable test macro applied to columns in YAML.
  4. **Test Configurations:**
     - `severity: warn` vs `severity: error`.
     - `where:` clause conditional testing.
     - `--store-failures`: Storing failing rows into database tables for auditing.
- **Key Commands:**
  ```bash
  cd dbt-testing
  dbt run
  dbt test
  dbt build
  dbt test --select "test_type:singular"
  dbt test --select "test_type:generic"
  ```

---

### 8. `dbt-seeds/` — dbt Seeds (Static Reference Data)
- **Concept:** Loading static CSV files into the data warehouse as physical tables managed under version control.
- **When to use:** Small (<1000 rows) lookup tables, country codes, status mappings, business tax rates, or mock unit-test data.
- **Core Topics:**
  1. **Seed CSVs:** `seeds/country_codes.csv`, `seeds/order_status_lookup.csv`.
  2. **Configuration in `dbt_project.yml`:** Custom column types (e.g., enforcing `varchar` so leading zeroes aren't lost).
  3. **Documentation & Testing:** `seeds/schema.yml` (attaching `unique` and `not_null` tests directly to seeds).
  4. **Referencing in Models:** Querying seed tables via `{{ ref('seed_name') }}` in downstream models like `models/dim_orders_with_status.sql`.
- **Key Commands:**
  ```bash
  cd dbt-seeds
  dbt seed
  dbt run
  dbt test
  ```

---

### 9. `dbt-documentation/` — Documentation Features & Lineage UI
- **Concept:** Automated data cataloging, reusable doc blocks, database comments, and interactive Lineage DAG visualization.
- **Core Topics:**
  1. **Doc Blocks (`docs.md`):** Defining reusable markdown blocks using `{% docs <name> %}` and referencing them via `{{ doc('<name>') }}`.
  2. **Model & Column Descriptions (`schema.yml`):** Attaching structured metadata, data types, and business definitions directly to tables and columns.
  3. **`persist_docs` (`dbt_project.yml`):** Automatically pushing descriptions down into DuckDB as SQL database comments (`COMMENT ON TABLE / COLUMN`).
  4. **dbt Docs Site Generation:** `dbt docs generate` (creates `manifest.json` and `catalog.json`) and `dbt docs serve` (launches local documentation portal with searchable catalog and DAG graph).
- **Key Commands:**
  ```bash
  cd dbt-documentation
  dbt run
  dbt docs generate
  dbt docs serve
  ```

---

### 10. `dbt-dag/` — Directed Acyclic Graph (DAG) & Graph Node Selection
- **Concept:** How dbt infers model execution order, prevents circular loops, runs models concurrently in parallel, and enables powerful graph node selection.
- **Core Topics:**
  1. **Topological Ordering:** Multi-tier dependency chain:
     ```
     sources (users, orders)
          ↓
     staging (stg_users, stg_orders) [Runs in Parallel]
          ↓
     intermediate (int_customer_orders) [Confluence Join]
          ↓
     marts (fct_orders_summary, fct_customer_lifetime_value) [Runs in Parallel]
     ```
  2. **Error Cascades / Smart Skipping:** If an upstream parent fails, dbt automatically skips all downstream children to save warehouse compute.
  3. **DAG CLI Selectors:**
     - `dbt run --select int_customer_orders+` (runs node + all downstream children)
     - `dbt run --select +int_customer_orders` (runs node + all upstream parents)
     - `dbt run --select +int_customer_orders+` (runs entire upstream & downstream family)
- **Key Commands:**
  ```bash
  cd dbt-dag
  dbt run
  dbt run --select int_customer_orders+
  dbt run --select +int_customer_orders
  ```

---

### 11. `dbt-metrices/` — dbt Semantic Layer (Measures & Metrics)
- **Concept:** Centralizing business KPI definitions in YAML so all downstream BI tools (Tableau, Looker, Hex, spreadsheets) report identical numbers.
- **Core Topics:**
  1. **Semantic Models (`semantic_models`):** Bridging a physical table to business entities (`order_id`, `user_id`), dimensions (`order_date`, `status`), and measures (`order_total`, `order_count`).
  2. **Measures:** Raw building blocks aggregated directly on table columns (`sum`, `count`, `avg`).
  3. **Metrics (`metrics`):**
     - **Simple Metrics:** Direct wrapper around a measure (e.g. `total_revenue`, `total_orders`).
     - **Derived Metrics:** Mathematical formulas combining metrics (e.g. `average_order_value = total_revenue / total_orders`).
- **Key Commands:**
  ```bash
  cd dbt-metrices
  dbt compile
  dbt run
  ```

---

### 12. `dbt-macros/` — dbt Macros (Jinja SQL Functions)
- **Concept:** Reusable Jinja functions for SQL. Adhering to the **DRY (Don't Repeat Yourself)** principle by eliminating duplicate SQL logic.
- **Core Topics:**
  1. **Value Transformation Macro:** `macros/money_conversions.sql` (`cents_to_dollars(column, scale=2)`).
  2. **String Standardization Macro:** `macros/clean_string.sql` (`trim_and_upper(column)`).
  3. **Dynamic Code Generation Macro:** `macros/dynamic_pivot.sql` (`pivot_sum(column, values)`).
  4. **Standalone Operations:** `macros/operations.sql` (`dbt run-operation say_hello --args '{name: "Sahil"}'`).
- **Key Commands:**
  ```bash
  cd dbt-macros
  dbt run
  dbt run-operation say_hello --args '{name: "Student"}'
  ```

---

### 13. `dbt-packages/` — Package Management & Data Observability
- **Concept:** Extending dbt capabilities with open-source packages via `packages.yml` and `dbt deps`.
- **Core Packages Explained in 3 Models:**
  1. **[`01_dbt_utils.sql`](./dbt-packages/models/01_dbt_utils.sql) — `dbt-utils`:** The standard library for dbt (surrogate keys, dynamic column generation, cross-db macros, composite unique tests).
  2. **[`02_great_expectations.sql`](./dbt-packages/models/02_great_expectations.sql) — `dbt-expectations`:** Great Expectations port for dbt (statistical distributions, regex validation, range checks).
  3. **[`03_elementary.sql`](./dbt-packages/models/03_elementary.sql) — `elementary`:** Native data observability & ML-based volume and column anomaly detection with HTML reports.
- **Key Commands:**
  ```bash
  cd dbt-packages
  dbt deps
  dbt run
  dbt test
  ```

---

### 14. `dbt-reusability/` — Reusable Project Architecture
- **Concept:** Eliminating code duplication using `sources.yml`, `schema.yml`, doc blocks, and YAML anchors.
- **Core Topics:**
  1. **Source Abstraction:** [`models/sources.yml`](./dbt-reusability/models/sources.yml) (Centralized database mapping, zero SQL changes when DB changes).
  2. **Doc Blocks:** [`models/docs.md`](./dbt-reusability/models/docs.md) (Define descriptions once, reuse across models via `{{ doc(...) }}`).
  3. **YAML Anchors & Aliases:** [`models/schema.yml`](./dbt-reusability/models/schema.yml) (`&pk_tests` and `*pk_tests` to inject tests into multiple models).
- **Key Commands:**
  ```bash
  cd dbt-reusability
  dbt build
  ```

---

## Quick Reference Summary Table

| Pipeline Folder | Primary Educational Focus | Core Artifacts |
|---|---|---|
| **`duckdb-custom`** | Database Initialization | `create_db.py`, `dev.duckdb` |
| **`dbt-first-pipeline`** | Hello World, Profiles & Configs | `profiles.yml`, `user_orders.sql` |
| **`dbt-second-pipeline`** | Medallion Architecture (Staging & Marts) | `stg_users`, `stg_orders`, `fct_user_orders_analytics` |
| **`dbt-materialisations`** | Materializations & Incremental Strategies | `view`, `table`, `ephemeral`, `incremental` (`merge`, `append`, `delete+insert`, `watermark`) |
| **`dbt-snapshots`** | Slowly Changing Dimensions (SCD 1 & SCD 2) | `dim_users_scd1`, `users_snapshot.sql`, `dim_users_scd2` |
| **`dbt-fifth-pipeline`** | dbt Special SQL: Jinja, Loops, Hooks, Grants | `var()`, `if/else`, `for loop`, `pre_hook`, `post_hook`, `grants` |
| **`dbt-testing`** | Testing: Generic, Singular, Custom Macros | `unique`, `not_null`, `accepted_values`, `relationships`, `test_is_positive` |
| **`dbt-seeds`** | Seeds: Static CSV Lookups & Downstream Refs | `country_codes.csv`, `order_status_lookup.csv`, `dim_orders_with_status.sql` |
| **`dbt-documentation`** | Data Catalog, Doc Blocks, persist_docs & DAG | `docs.md`, `schema.yml`, `persist_docs`, `dbt docs generate / serve` |
| **`dbt-dag`** | Directed Acyclic Graph & Node Selection (`+`, `+model+`) | `stg_*`, `int_customer_orders`, `fct_*`, `sources.yml` |
| **`dbt-metrices`** | Semantic Layer: Entities, Dimensions, Measures, Metrics | `semantic_layer.yml`, `orders.sql`, MetricFlow |
| **`dbt-macros`** | Macros: Value Transformations, Dynamic Pivots, Operations | `money_conversions`, `dynamic_pivot`, `clean_string`, `say_hello` |
| **`dbt-packages`** | Package Ecosystem & Observability | `01_dbt_utils`, `02_great_expectations`, `03_elementary`, `packages.yml` |
| **`dbt-reusability`** | Reusable Architecture: Sources, Doc Blocks, YAML Anchors | `sources.yml`, `schema.yml`, `docs.md`, `*pk_tests` |
