{{
        config(
          materialized='incremental',
          tags = ['scd2'],
          alias = 'CUSTOMER_SCD2',
          unique_key ='C_CUSTKEY',
          pre_hook = "update  EDW.SCD2.CUSTOMER_SCD2 set  ROW_UPD_DT = current_date()-1 where C_CUSTKEY in (select C_CUSTKEY from EDW.SCD2.CUSTOMER2) and  DWHASH_ALL not in (select DWHASH_ALL from EDW.SCD2.CUSTOMER2)",
        )
    }}

    select * from {{(source('scd2','CUSTOMER2'))}}