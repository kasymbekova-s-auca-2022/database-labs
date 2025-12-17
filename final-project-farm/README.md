# Farm Management System — Database Final Project

## Project Description
This project is a relational database system designed for managing agricultural
production processes. It stores structured data about farms, fields, crops,
plantings, agricultural operations, harvests, inventory lots, and sales.

The system supports data analysis for production efficiency, cost tracking,
inventory control, and profitability evaluation using SQL queries and transactions.

## Project Goals
- Design a normalized relational database schema for farm management
- Store and manage data related to crops, fields, plantings, and harvests
- Track agricultural operations and production costs
- Manage inventory and product sales
- Demonstrate basic and advanced SQL queries

## Database Structure
The database schema reflects real-world farm workflows and is organized around
the production lifecycle.

A farm consists of multiple fields. Each field can have multiple plantings,
and each planting is associated with a specific crop. Agricultural operations
and expenses are linked to plantings.

Each planting produces one or more harvest records. Harvested products are stored
as inventory lots, which can later be sold to buyers. All entities are connected
using primary and foreign keys to ensure referential integrity.

## Technologies Used
- PostgreSQL
- SQL (DDL, DML, CTEs, window functions, transactions)
- pgAdmin
- Terminal (psql)

## Tables Overview
- `farms` — stores general information about farms
- `fields` — agricultural fields with area, soil type, and location
- `crops` — crop types, varieties, and seasonality
- `plantings` — planting events linking fields and crops
- `operations` — agricultural operations and their costs
- `harvests` — harvested quantities for each planting
- `inventory_lots` — stored harvest batches and available quantities
- `sales` — sales transactions linked to inventory lots
- `expenses` — additional expenses related to plantings

## Project Structure
```
schema/
├── 01_tables.sql
├── 02_constraints_indexes.sql
└── 03_sample_data.sql
queries/
├── basic.sql
└── advanced.sql
transactions/
└── sell_lot_demo.sql
```
## SQL Scripts Description
- `01_tables.sql` — creates all database tables
- `02_constraints_indexes.sql` — adds constraints and performance indexes
- `03_sample_data.sql` — inserts sample data for testing

- `basic.sql` — basic SELECT queries for data viewing
- `advanced.sql` — analytical queries using aggregates, CTEs, and window functions

- `sell_lot_demo.sql` — transaction script that demonstrates safe inventory selling

## How to Run
1. Create a PostgreSQL database (e.g. `farmdb`)
2. Connect to the database using psql or pgAdmin
3. Execute SQL scripts from the `schema/` folder in the following order:
   - `01_tables.sql`
   - `02_constraints_indexes.sql`
   - `03_sample_data.sql`
4. Run queries from `queries/basic.sql` and `queries/advanced.sql`
5. (Optional) Execute the transaction demo script to simulate inventory selling

## Sample Analytical Queries
The project includes analytical SQL queries such as:
- Yield calculation per field (tons per hectare)
- Total harvest volume by crop
- Operational cost analysis by operation type
- Sales and remaining inventory analysis
- Profitability calculation (revenue minus expenses)
- Percentage contribution of each field to total harvest using window functions

## Author
Symbat Kasymbekova  
Applied Mathematics & Informatics  
American University of Central Asia

