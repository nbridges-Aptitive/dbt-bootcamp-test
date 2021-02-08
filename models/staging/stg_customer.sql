select

    customernumber as customer_number,
    customername as customer_name,
    concat(contactfirstname, ' ', contactlastname) as contact_name,
    city,
    state,
    country,
    {{ region_generator() }},
    salesrepemployeenumber as sales_rep_employee_number,
    creditlimit as credit_limit

    from {{ source('public','customer')}}
