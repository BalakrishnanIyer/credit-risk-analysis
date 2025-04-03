{{ config(materialized="table") }}

with transformed_data as (
    select
        id,

        -- Replace NULL values in credit limit with 0
        coalesce(limit_bal, 0) as credit_limit,

        -- Convert Gender Encoding to Readable Labels
        case
            when sex = 1 then 'Male'
            when sex = 2 then 'Female'
            else 'Unknown'
        end as gender,

        -- Convert Education Level Encoding to Readable Labels
        case
            when education = 1 then 'Graduate School'
            when education = 2 then 'University'
            when education = 3 then 'High School'
            else 'Other'
        end as education_level

    from {{ ref('default_of_credit_card_clients') }}
)

select * from transformed_data
