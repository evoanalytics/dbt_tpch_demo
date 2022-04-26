{%- set yaml_metadata -%}
source_model: hub_supplier
src_pk: supplier_pk
as_of_dates_table: dim_date
satellites:
  sat_inv_supplier_details:
    pk:
      pk: supplier_pk
    ldts:
      ldts: load_date
  sat_inv_supp_nation_details:
    pk:
      pk: supplier_pk
    ldts:
      ldts: load_date
  sat_inv_supp_region_details:
    pk:
      pk: supplier_pk
    ldts:
      ldts: load_date
stage_tables:
  v_stg_inventory: load_date
src_ldts: load_date
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ dbtvault.pit(source_model=metadata_dict['source_model'], 
                src_pk=metadata_dict['src_pk'],
                as_of_dates_table=metadata_dict['as_of_dates_table'],
                satellites=metadata_dict['satellites'],
                stage_tables=metadata_dict['stage_tables'],
                src_ldts=metadata_dict['src_ldts']) }}

                