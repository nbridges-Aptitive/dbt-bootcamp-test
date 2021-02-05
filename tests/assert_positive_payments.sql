select
  priceeach
from {{ ref('stg_orderdetail')}}
where priceeach >= 0