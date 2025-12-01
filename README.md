# dbt Project

# principal cmd

pip install dbt-duckdb dbt
dbt init transfprj
cd transfprj
touch profiles.yml
mkdir output
dbt debug


duckdb
- creer une .sql dans analyse 
duckdb
.read /analayse/fichier.sql



dbt clean && dbt deps && dbt parse

