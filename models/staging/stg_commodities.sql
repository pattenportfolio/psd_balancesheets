with
    raw as (
        select
            commodity_description as product_name,
            country_name as country,
            Country_Code,
            market_year as market_year,
            calendar_year as calendar_year,
            month as calendar_month,
            attribute_description as attribute,
            unit_description as unit,
            value as value
        from {{ source("psd", "raw_commodities") }}
    ),
    geo as (
        select 
            countrycode, 
            regionname as region 
        from {{ ref("ref_geo") }}
    ),
    final as (
        select
            product_name,
            country,
            geo.region as region,
            market_year,
            calendar_month,
            calendar_year,
            attribute,
            unit,
            value
        from raw
        join geo on geo.countryCode = raw.Country_Code
    )
select *
from final
