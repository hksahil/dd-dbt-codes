import duckdb

con = duckdb.connect("dev.duckdb", config={"storage_compatibility_version": "v1.1.0"})
#con.sql("CREATE OR REPLACE TABLE users AS SELECT * FROM (VALUES (1, 'Alice'), (2, 'Bob')) t(id, name)")
con.sql("CREATE OR REPLACE TABLE orders AS SELECT * FROM (VALUES (101, 50), (102, 100)) t(id, amount)")

#con.sql("SELECT * FROM users").show()
con.sql("SELECT * FROM orders").show()

# The database dev.duckdb has already been created with the following data:
# users
# orders