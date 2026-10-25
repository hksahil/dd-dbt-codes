import sys; sys.path.pop(0)
import duckdb

con = duckdb.connect("duckdb-custom/dev.duckdb")

# # 1. Existing table list
# con.sql(
#     "SELECT table_name, table_type FROM information_schema.tables WHERE table_schema = 'main'"
# ).show()

# # 2. Existing users_snapshot query
# con.sql(
#     "SELECT * FROM users_snapshot"
# ).show(max_width=1000)

# # 3. Update user to test SCD Type 2 tracking
# con.sql("UPDATE users SET name = 'Alicia' WHERE id = 1")

# print("=== Raw Source (users) ===")
# con.sql("SELECT * FROM users").show()

# print("=== Snapshot (users_snapshot) ===")
# con.sql("SELECT id, name, dbt_valid_from, dbt_valid_to FROM users_snapshot ORDER BY id, dbt_valid_from").show(max_width=1000)

# con.sql("INSERT INTO orders VALUES (103, -50);").show()


con.sql("UPDATE users SET name = 'Sahil' WHERE id = 1")


con.sql("SELECT * from users").show()
con.sql("SELECT * from dim_users_scd3").show()


