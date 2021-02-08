{% macro region_generator() %}

{% set europe_north = ('Norway', 'Finland', 'UK', 'Ireland', 'Sweden', 'Denmark') %}
{% set europe_south = ('Portugal', 'Italy', 'Spain') %}
{% set europe_east = ('Poland', 'Austria', 'Russia') %}
{% set europe_west = ('Belgium', 'Netherlands', 'Switzerland', 'Germany', 'France') %}
{% set asia = ('Hong Kong', 'Japan', 'Singapore', 'Phillippines') %}
{% set pacific = ('Australia', 'New Zeland') %}
{% set africa = ('South Africa', 'Israel') %}
{% set america_north = ('USA', 'Canada') %}

case
when country in {{ europe_north }} then 'Northern Europe'
when country in {{ europe_south }} then 'Southern Europe'
when country in {{ europe_east }} then 'Eastern Europe'
when country in {{ europe_west }} then 'Western Europe'
when country in {{ asia }} then 'Asia'
when country in {{ pacific }} then 'South Pacific'
when country in {{ africa }} then 'Africa'
when country in {{ america_north }} then 'North America'
else 'N/A'
end as region

{%- endmacro %}