with student_data as (
    select * from {{ source ("sensor_db", "student_data") }}
),

finals as (
    select * from student_data
)

select * from final