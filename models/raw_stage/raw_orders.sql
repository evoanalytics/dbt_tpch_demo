select
    a.l_orderkey as orderkey,
    a.l_partkey as partkey ,
    a.l_suppkey as supplierkey,
    a.l_linenumber as linenumber,
    a.l_quantity as quantity,
    a.l_extendedprice as extendedprice,
    a.l_discount as discount,
    a.l_tax as tax,
    a.l_returnflag as returnflag,
    a.l_linestatus as linestatus,
    a.l_shipdate as shipdate,
    a.l_commitdate as commitdate,
    a.l_receiptdate as receiptdate,
    a.l_shipinstruct as shipinstruct,
    a.l_shipmode as shipmode,
    a.l_comment as line_comment,
    b.o_custkey as customerkey,
    b.o_orderstatus as orderstatus,
    b.o_totalprice as totalprice,
    b.o_orderdate as orderdate,
    b.o_orderpriority as orderpriority,
    b.o_clerk as clerk,
    b.o_shippriority as shippriority,
    b.o_comment as order_comment,
    c.c_name as customer_name,
    c.c_address as customer_address,
    c.c_nationkey as customer_nation_key,
    c.c_phone as customer_phone,
    c.c_acctbal as customer_accbal,
    c.c_mktsegment as customer_mktsegment,
    c.c_comment as customer_comment,
    d.n_name as customer_nation_name,
    d.n_regionkey as customer_region_key,
    d.n_comment as customer_nation_comment,
    e.r_name as customer_region_name,
    e.r_comment as customer_region_comment
from {{ var('orders') }} as b
left join {{ var('lineitems') }} as a
    on a.l_orderkey = b.o_orderkey
left join {{ var('customers') }} as c
    on b.o_custkey  = c.c_custkey
left join {{ var('nations') }} as d
    on c.c_nationkey  = d.n_nationkey
left join {{ var('regions') }} as e
    on d.n_regionkey  = e.r_regionkey
left join {{ var('parts') }} as g
    on a.l_partkey = g.p_partkey
left join {{ var('suppliers') }} as h
    on a.l_suppkey = h.s_suppkey
left join {{ var('nations') }} as j
    on h.s_nationkey = j.n_nationkey
left join {{ var('regions') }} as k
    on j.n_regionkey = k.r_regionkey
where b.o_orderdate = to_date('{{ var('load_date') }}')
