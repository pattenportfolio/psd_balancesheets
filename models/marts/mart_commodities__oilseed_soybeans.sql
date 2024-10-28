with
    stg as (
        select
            product_name,
            region,
            country,
            calendar_month,
            calendar_year,
            sum(if(attribute = 'Beginning Stocks', value, 0)) as beginning_stocks,
            sum(if(attribute = 'Imports', value, 0)) as imports,
            sum(if(attribute = 'Production', value, 0)) as production,
            sum(if(attribute = 'Exports', value, 0)) as exports,
            sum(if(attribute = 'Crush', value, 0)) as crush,
            sum(
                if(attribute = 'Food Use Dom. Cons.', value, 0)
            ) as food_use_domestic_consumption,
            sum(
                if(attribute = 'Feed Waste Dom. Cons.', value, 0)
            ) as feed_waste_domestic_consumption,
            sum(if(attribute = 'Ending Stocks', value, 0)) as ending_stocks,

            sum(if(attribute = 'Total Supply', value, 0)) as total_supply,
            sum(if(attribute = 'Total Distribution', value, 0)) as total_distribution,

            sum(if(attribute = 'Area Harvested', value, 0)) as area_harvested,
            sum(if(attribute = 'Yield', value, 0)) as yield,
            safe_divide(
                sum(if(attribute = 'Yield', value, 0)),
                sum(if(attribute = 'Area Harvested', value, 0))
            ) as yield_per_area_harvested,

            safe_divide(
                sum(if(attribute = 'Beginning Stocks', value, 0)),
                sum(if(attribute = 'Ending Stocks', value, 0))
            ) as stocks_to_use,
            
            safe_divide(
                sum(if(attribute = 'Imports', value, 0)),
                sum(if(attribute = 'Exports', value, 0))
            ) as imports_to_exports

        from {{ ref("stg_commodities") }}
        where product_name = "Oilseed, Soybean"
        group by product_name, region, country, calendar_year, calendar_month
    ),
    final as (select * from stg)
select *
from final
order by calendar_year desc, calendar_month desc, total_supply desc
