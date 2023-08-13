select * from adidas_usa_sales aus 

--What is the total cost for each retailer in Louisville, Kentucky?
select retailer, state, city, "Total Sales", "Operating Profit", "Total Sales" - "Operating Profit" as "Total Cost" 
from adidas_usa_sales 
where city = 'Louisville'
and state = 'Kentucky'

--What are the top 3 cities that sold the most units?
select state, city, sum("Units Sold") as total_units_sold
from adidas_usa_sales aus 
group by city, state
order by sum("Units Sold") desc

--What are the top 3 cities that generated the most profits?
select state, city, sum("Operating Profit") as total_profits
from adidas_usa_sales aus 
group by city, state
order by sum("Operating Profit") desc

--What is the most popular product and its price in Seattle, Richmond, and New York?
select "Retailer ID", product, state, city, sum("Units Sold") as total_units_sold, "Price per Unit"
from adidas_usa_sales aus 
where city in ('Seattle', 'Richmond', 'New York') 
group by "Retailer ID", state, city, product, "Price per Unit"
order by city, sum("Units Sold") desc 

--Which retailer sold the most units and what sales method does it use?
select retailer, sum("Units Sold") as total_units_sold, "Sales Method"
from adidas_usa_sales aus 
group by retailer, "Sales Method"
order by sum("Units Sold") desc

--What are the top 3 retailers that have the lowest operating margins and where are they located?
select "Retailer ID", retailer, state, city, min("Operating Margin")
from adidas_usa_sales aus 
group by "Retailer ID", retailer, state, city  
order by min("Operating Margin")

--Find the sales method that is most profitable in the states of Texas, Florida, and Alabama.
select "Sales Method", state, sum("Operating Profit") as total_profits
from adidas_usa_sales aus 
where state in ('Alabama', 'Texas', 'Florida')
group by "Sales Method", state
order by state desc, sum("Operating Profit") desc





