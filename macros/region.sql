{% macro region_generator(country_column) %}

{% set europe_north = ('Norway', 'Finland', 'UK', 'Ireland', 'Sweden', 'Denmark') %}
{% set europe_south = ('Portugal', 'Italy', 'Spain') %}
{% set europe_east = ('Poland', 'Austria', 'Russia') %}
{% set europe_west = ('Belgium', 'Netherlands', 'Switzerland', 'Germany', 'France') %}
{% set asia = ('Hong Kong', 'Japan', 'Singapore', 'Phillippines') %}
{% set pacific = ('Australia', 'New Zeland') %}
{% set africa = ('South Africa', 'Israel') %}
{% set america_north = ('USA', 'Canada') %}

case
when {{ country_column }} in {{ europe_north }} then 'Northern Europe'
when {{ country_column }} in {{ europe_south }} then 'Southern Europe'
when {{ country_column }} in {{ europe_east }} then 'Eastern Europe'
when {{ country_column }} in {{ europe_west }} then 'Western Europe'
when {{ country_column }} in {{ asia }} then 'Asia'
when {{ country_column }} in {{ pacific }} then 'South Pacific'
when {{ country_column }} in {{ africa }} then 'Africa'
when {{ country_column }} in {{ america_north }} then 'North America'
else 'N/A'
end

{%- endmacro %}