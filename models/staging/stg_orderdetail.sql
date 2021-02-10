select
    ordernumber as order_number,
    productcode as product_code,
    quantityordered as quantity_ordered,
    priceeach as price_each,
    orderlinenumber as order_line_number,
    (quantityordered * priceeach) as revenue

    from {{ source('public','orderdetail')}}