select
    b.o_orderkey as order_id,
    b.o_custkey as customer_id,
    b.o_orderdate as order_date,
    date_add(b.o_orderdate,20) as transaction_date,
    cast(rpad(concat(b.o_orderkey, b.o_custkey, date_format(b.o_orderdate, 'yyyymmdd')),  24, '0') as string) as transaction_number,
    b.o_totalprice as amount,
    cast(
    case
        when coalesce(round(rand()),0) + 1 = 1 then 'dr'
        when coalesce(round(rand()),0) + 1 = 2 then 'cr'
    end as string) as type
from {{ var('orders') }}  as b
left join {{ var('customers') }} as c
    on b.o_custkey = c.c_custkey
where b.o_orderdate = cast('{{ var('load_date') }}' as date)

