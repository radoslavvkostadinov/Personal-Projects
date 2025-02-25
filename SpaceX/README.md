# SpaceX Missions

In this project, I set up a data engineering environment and built a custom Singer tap to extract and load data from the SpaceX API into Snowflake. I transformed the data using dbt and performed analysis with SQL. Finally, I created a dashboard featuring the key parameters I identified.

## Running the Pipeline

1. Edit the `config.json` file to include your Snowflake credentials.

2. Run the pipeline using the following command:

   ```bash
   python tap_space.py | target-snowflake --config config.json

3. Run dbt :

   ```bash
   cd dbt
   dbt run

![Image](https://github.com/user-attachments/assets/209a7025-366b-43d2-b65f-5e27d6225c5b)

You can find all the views in sql folder

## Database Schema Overview

![Image](https://github.com/user-attachments/assets/d090d56b-3db2-43fc-9bc2-086758eadc01)

## Power BI Dashboard

* A launch is considered successful if success_status = true.
* The success rate is calculated only for launches where success_status equals either true or false. Some success statuses are missing, and I labeled them as "Unknown," which are excluded from the calculations.

![Image](https://github.com/user-attachments/assets/1a5dbad0-7a36-4fe6-9406-6c0637154b37)

## Tech Stack
- 🐍 Python
- 📊 Pandas
- 🔌 Singer
- 📝 SQL
- ❄️ Snowflake
- 📊 Power BI
- 🔧 DBT
- 🧮 DAX