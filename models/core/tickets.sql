{{ config(materialized='incremental',
    updated_at='updated_at'
) }}

{%- set post_date = get_post_date() -%}

with base as (

    select 
    itinid,year,quarter,origin,originstate,roundtrip,passengers,distance,round(ritinfare, 2)as ritinfare, postdate, 
    current_date as updated_at, 
    case 
        when passengers = 1
            then 'SINGLE'
        else 
            'GROUP'
    end as pgsr_group 

    from  {{ ref('stg_tickets') }}
                     
)

select * from base where postdate = to_date('{{post_date}}')