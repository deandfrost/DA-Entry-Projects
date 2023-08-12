select * from florida_browardcounty_airbnb_listings fbal 

select * from hawaii_airbnb_listings hal 

--What are the top 5 AirBnB earners in Hawaii? (Nightly Price x Nights Booked Annually)
select id, "name", host_name, price, availability_365, price * (365 - availability_365) as annual_revenue 
from hawaii_airbnb_listings hal 
order by annual_revenue desc

--In the past 12 months, what is the most popular area in Hawaii in which people use AirBnB the most?
select sum(number_of_reviews) as total_reviews, sum(number_of_reviews_ltm) as reviews_past_12_months, neighbourhood_group
from hawaii_airbnb_listings hal 
group by neighbourhood_group 
order by sum(number_of_reviews_ltm) desc

--What is the cheapest minimum price required to stay at a 5 star AirBnB with 3 bedrooms in Maui?
select id, "name",neighbourhood_group, price * minimum_nights as minimum_price
from hawaii_airbnb_listings hal 
where "name" like '%3 bedrooms%'
and "name" like '%5.0%'
and neighbourhood_group = 'Maui'
order by minimum_price

/*List the availalble AirBnbs in Pompano Beach, Florida and North Kona, Hawaii where two people can
 stay for 3 nights at a price between $100 and $125 per night.
  */
select fbnb.id as fl_id, fbnb."name" as fl_name, fbnb.neighbourhood as fl_neighbourhood, 
fbnb.minimum_nights as fl_minimumnights, fbnb.availability_365 as fl_availability_365,
fbnb.price as fl_price, hbnb.id as ha_id, hbnb."name" as ha_name, hbnb.neighbourhood as ha_neighbourhood, 
hbnb.minimum_nights as ha_minimumnights, hbnb.availability_365 as ha_availability_365, hbnb.price as ha_price
from florida_browardcounty_airbnb_listings fbnb, hawaii_airbnb_listings hbnb
where fbnb.price between 100 and 125 and hbnb.price between 100 and 125
and fbnb.neighbourhood = 'Pompano Beach'
and hbnb.neighbourhood = 'North Kona'
and fbnb.name like '%2 bedrooms%' 
and hbnb.name like '%2 bedrooms%' 
and fbnb.minimum_nights <= 3
and hbnb.minimum_nights <= 3
and fbnb.availability_365 >= 3
and hbnb.availability_365 >= 3

--How many listings are there in the neighbourhood Miramar in Broward County, Florida?
select sum(calculated_host_listings_count)
from florida_browardcounty_airbnb_listings fbal 
where neighbourhood = 'Miramar'






