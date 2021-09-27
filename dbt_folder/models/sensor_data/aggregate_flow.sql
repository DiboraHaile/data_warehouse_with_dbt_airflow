 {{ config(materialized='table') }}

with source_sensor_data as (
     select t.date,avg(flow_1),avg(flow_2),avg(flow_3),avg(flow_4)
     from {{ source('sensor_data','traffic_info_table') }} as t
     inner join {{ source('sensor_data','Lane_4_table') }} as l4
     on t.traffic_station_ID = l4.L4_station_ID
     group by 1
 ),


 final as (
     select * from source_sensor_data
 )

 select * from final