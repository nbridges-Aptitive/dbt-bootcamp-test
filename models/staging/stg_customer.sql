select

    customernumber,
    customername,
    concat(contactfirstname, ' ', contactlastname) as contactname,
    city,
    state,
    country,
    salesrepemployeenumber,
    creditlimit

    from {{ source('public','customer')}}
