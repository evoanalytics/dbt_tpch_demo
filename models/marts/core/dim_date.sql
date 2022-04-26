{{ dbt_utils.date_spine(
    datepart="day",
    start_date="cast('1992-01-01' as date)",
    end_date="cast('1998-12-31' as date)"
   )
}}