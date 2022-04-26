{%- set source_model = "v_stg_inventory" -%}
{%- set src_pk = "inventory_pk" -%}
{%- set src_hashdiff = "inventory_hashdiff" -%}
{%- set src_payload = ["availqty", "supplycost", "part_supply_comment"] -%}
{%- set src_eff = "effective_from" -%}
{%- set src_ldts = "load_date" -%}
{%- set src_source = "record_source" -%}

{{ dbtvault.sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                src_payload=src_payload, src_eff=src_eff,
                src_ldts=src_ldts, src_source=src_source,
                source_model=source_model) }}