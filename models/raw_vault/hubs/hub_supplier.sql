{%- set source_model = ["v_stg_orders", "v_stg_inventory"] -%}
{%- set src_pk = "supplier_pk" -%}
{%- set src_nk = "supplierkey" -%}
{%- set src_ldts = "load_date" -%}
{%- set src_source = "record_source" -%}

{{ dbtvault.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                src_source=src_source, source_model=source_model) }}