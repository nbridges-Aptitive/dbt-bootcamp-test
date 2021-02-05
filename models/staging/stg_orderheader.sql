select
    ordernumber,
    orderdate,
    requireddate,
    shippeddate,
    status,
    customernumber

    from {{ source('public','orderheader')}}