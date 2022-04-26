{%- set yaml_metadata -%}
source_model: 'raw_transactions'
derived_columns:
  record_source: '!raw_transactions'
  load_date: date_add(transaction_date,1)
  effective_from: 'transaction_date'
hashed_columns:
  transaction_pk:
    - 'customer_id'
    - 'transaction_number'
  customer_pk: 'customer_id'
  order_pk: 'order_id'
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_model = metadata_dict['source_model'] %}

{% set derived_columns = metadata_dict['derived_columns'] %}

{% set hashed_columns = metadata_dict['hashed_columns'] %}

{{ dbtvault.stage(include_source_columns=true,
                  source_model=source_model,
                  derived_columns=derived_columns,
                  hashed_columns=hashed_columns,
                  ranked_columns=none) }}