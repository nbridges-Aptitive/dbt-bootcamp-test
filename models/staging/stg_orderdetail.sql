select
    ordernumber,
    productcode,
    quantityordered,
    priceeach,
    orderlinenumber

    from {{ source('public','orderdetail')}}