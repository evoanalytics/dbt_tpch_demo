{%- set source_model = "v_stg_orders" -%}
{%- set src_pk = "customer_pk" -%}
{%- set src_hashdiff = "customer_hashdiff" -%}
{%- set src_payload = ["customer_name", "customer_address", "customer_phone",
                       "customer_accbal", "customer_mktsegment", "customer_comment"] -%}
{%- set src_eff = "effective_from" -%}
{%- set src_ldts = "load_date" -%}
{%- set src_source = "record_source" -%}

{{ dbtvault.sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                src_payload=src_payload, src_eff=src_eff,
                src_ldts=src_ldts, src_source=src_source,
                source_model=source_model) }}