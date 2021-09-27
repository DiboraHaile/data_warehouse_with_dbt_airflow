 {{ config(materialized='table') }}

with source_sensor_data as (
     select t.date as date_occupancy_high, t.time as time_occupancy_high
     from {{ source('sensor_data','traffic_info_table') }} as t
     inner join {{ source('sensor_data','Lane_4_table') }} as l4
     on t.traffic_station_ID = l4.L4_station_ID
     where occupation_1 > .8 and occupation_2 > .8 and occupation_3 > .8 and occupation_4 >.8
 ),


 final as (
     select * from source_sensor_data
 )

 select * from final