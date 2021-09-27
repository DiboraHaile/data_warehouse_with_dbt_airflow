 {{ config(materialized='table') }}

with source_sensor_data as (
     select L4_station_ID
     from {{ source('sensor_data','Lane_4_table') }} 
     where flow_1=0 and flow_2=0 and flow_3=0 and flow_4=0
 ),


 final as (
     select * from source_sensor_data
 )

 select * from final
