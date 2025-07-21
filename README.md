### 🛒 Maven Toy Store dbt Project
**Welcome to the Maven Toy Store dbt project!**
 -This project transforms messy sales, product, store, and inventory data into clean, reliable tables that make reporting and business analysis easy.

**What Does This Project Do?**
 -We take raw data from Snowflake and use dbt to:

**Clean up**: Fix missing values, standardize formats, and prepare data for analysis.
**Combine**: Join sales, product, and store data so you have all the information you need in one place.
**Summarize**: Build simple, ready-to-use summary tables (called "marts") so you can easily answer questions like:
How much did we sell by store?
How much inventory is left?
How are sales trending over time?
How Does It Work?
### We use a structure called the Medallion Architecture:

**Bronze (Staging)**: Cleans up raw data.
**Silver (Intermediate)**: Joins and enriches data.
**Gold (Marts)**: Final summary tables for reporting and dashboards.
 -This approach keeps the project organized, avoids repeating code, and makes it easy to update or add new features.

### Getting Started
 -Install dbt
 
### If you don’t have dbt, check out the dbt documentation for installation instructions.

 -Run the Project
 -Open your terminal, go to this project’s folder, and run:

 -dbt run

 -This will build all the cleaned and summary tables.

**Explore the Data**
 -The most useful tables are in the marts folder—these are ready for analysis and dashboards.

**Automation**
 -I've set up orchestration in dbt Cloud so everything runs automatically on a schedule. Any time you make changes and push them, the project updates itself—no need to run things manually.

### Project Structure
**staging/**: Cleans the raw data.
**intermediate/**: Joins and enriches data.
**marts/**: Summary tables that answer business questions.
**snapshots/**: Tracks how data changes over time (using dbt's snapshot feature and SCD Type 2 for history).
### Snapshots
 -Snapshots let us track changes in the data over time—like version history for your tables. We use SCD Type 2 to keep both old and new values, so you can always see what changed and when.

**What I Learned**
 -Organizing data transformation using dbt and the medallion architecture.
 -Cleaning tricky data types (like converting prices from strings to numbers).
 -Automating data pipelines with dbt Cloud.
 -Using snapshots to track historical changes.
**Ready to get started?**
Just run dbt run and check out the marts tables for all your reporting needs!
