with
    stg as (
        select
            product_name,
            region,
            country,
            market_year,
            calendar_month,
            calendar_year,
            sum(if(attribute = 'Beginning Stocks', value, 0)) as beginning_stocks,
            sum(if(attribute = 'Production', value, 0)) as production,
            sum(if(attribute = 'Arabica Production', value, 0)) as arabica_production,
            sum(if(attribute = 'Robusta Production', value, 0)) as robusta_production,
            sum(if(attribute = 'Other Production', value, 0)) as other_production,
            sum(if(attribute = 'Total Supply', value, 0)) as total_supply,
            sum(if(attribute = 'Imports', value, 0)) as imports,
            sum(if(attribute = 'Roast & Ground Imports', value, 0)) as roast_and_ground_imports,
            sum(if(attribute = 'Bean Imports', value, 0)) as bean_imports,
            sum(if(attribute = 'Soluble Imports', value, 0)) as soluble_imports,
            sum(if(attribute = 'Exports', value, 0)) as exports,
            sum(if(attribute = 'Roast & Ground Exports', value, 0)) as roast_and_ground_exports,
            sum(if(attribute = 'Bean Exports', value, 0)) as bean_exports,
            sum(if(attribute = 'Soluble Exports', value, 0)) as soluble_exports,
            sum(if(attribute = 'Domestic Consumption', value, 0)) as domestic_consumption,
            sum(if(attribute = 'Rst,Ground Dom. Consum', value, 0)) as roasted_ground_domestic_consumption,
            sum(if(attribute = 'Soluble Dom. Cons.', value, 0)) as soluble_domestic_consumption.,
            sum(if(attribute = 'Total Distribution', value, 0)) as total_distribution,
            sum(if(attribute = 'Ending Stocks', value, 0)) as ending_stocks,

        from {{ ref("stg_commodities") }}
        where product_name = "Coffee, Green"
        group by product_name, region, country, calendar_year, calendar_month, market_year
    ),
    final as (select * from stg)
select *
from final
order by calendar_year desc, calendar_month desc, total_supply desc
