{% snapshot Cust_Scd2 %}

{{
        config(
          tags = ['snapscd2'],
          alias = 'CUSTOMER_SCDTST',
          strategy = 'check',
          unique_key = 'C_CUSTKEY',
          target_schema = 'SCD2',
          check_cols = ['C_NAME', 'C_ADDRESS', 'C_NATIONKEY', 'C_PHONE', 'C_ACCTBAL', 'C_MKTSEGMENT', 'C_COMMENT'],
          invalidate_hard_deletes=True, 

        )
    }}

    select * from {{(source('scd2','CUSTOMER3'))}}

{% endsnapshot %}    