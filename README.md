# psd_balancesheets 
## Agricultural Commodity Analysis Data Warehouse
This project curates data for modeling fundamental analysis of agricultural commodities through their balance sheets to understand supply and demand dynamics. It leverages dbt and Python for data warehousing, transformation, and analysis.

### Objective
This project aims to:

* Build a data warehouse specifically for analyzing agricultural commodities using their balance sheet data as a proxy for supply and demand.
* Enable timeseries and geographic analysis of the curated data.
* Support future enrichment with historical prices, geopolitical events, and weather/climate data.

### Architecture
The project utilizes the following technologies:

* **Data Source:** USDA FAS PS&D Open Data API
* **Data Transformation:** dbt (Data Build Tool)
* **Data Warehousing:** BigQuery
* **Analytics:** Python (NumPy, Pandas, scikit-learn, etc.)

The data warehouse follows a three-tiered structure:

1. **Source:** dbt extracts raw data from the USDA FAS PS&D API.
2. **Staging:** Data is transformed and historical source data is joined back for denormalization. This intermediate table provides a mostly complete view of commodity balance sheets.
3. **Mart:** A curated data mart focused on analyzing soybean oilseed balance sheets is created.

Future plans include adding Soybean Meal and Soybean Oil to the mart, along with historical prices to study correlations and the crush spread.

### Analytics
The analytics arm of the project will encompass:

* **Traditional Time Series Forecasting:** Techniques like ARIMA and SARIMA will be employed to predict future supply and demand trends.
* **Machine Learning Time Series Forecasting:** Advanced techniques like LSTMs and Prophet will be explored to capture complex patterns in the data.

These analyses will be conducted using Python libraries like NumPy, Pandas, and scikit-learn.
