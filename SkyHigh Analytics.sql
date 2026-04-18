-- Create database Airline_Booking;
use Airline_Booking;
 
select * from bookings;
select * from flights;
select * from passengers;

desc bookings;
desc flights;
desc passengers;

ALTER TABLE bookings
MODIFY booking_date DATE; -- changed the datatype of date coloumn (booking table) as it was in text to make the fucture calculations easier


-- Phase 1: Passenger Insights
-- 1. Gender Distribution: What is the total count of Male vs. Female passengers? 
select gender,
count(gender) as Passengers
from passengers
group by gender; -- we found out that there are more female passengers F = 551; M = 489

-- 2. Global Reach: Which 5 countries contribute the highest number of passengers? 
select Country,count(passenger_id) as total_passengers
from passengers
group by country
order by total_passengers desc
limit 5; -- here we found UK was the most visited country with 127 passengers from the data UK > France > UAE > USA > Australia

-- 3. Age Demographics: What is the average age of a passenger in this dataset? 
select avg(age) as AvgAge
from passengers; -- the Average Age is 45

-- 4. Age Segmentation: Create age groups (e.g., Teens, Adults, Seniors) and find which group flies the most.
select 
case 
when age <=19 then "Teens"
when age between 20 and 50 then 'Adult'
else 'Senior' end as AGEGroup,
count(age) as NoOfPeople
from passengers
group by AGEGroup
order by NoOfPeople desc; -- the Adult is the biggest age group here with 561 people then Seniors=414 and then Teens 25;

-- 5. National Trends: Are there specific countries where "Business Class" is more popular than "Economy"
select country,count(*) as BusinessClass from bookings as b
join passengers as p 
on b.passenger_id = p.passenger_id
where seat_class = "Business" 
group by p.country 
order by BusinessClass desc; -- Uk has the most BusinessClass passengers = 304


-- Phase 2: Flight & Route Operations
-- 6. Airline Popularity: Which airline operates the most flights in the dataset? 
select airline,count(*) as TotalFlights
from flights
group by airline
order by TotalFlights desc
limit 3; -- Lufthansa,AirIndia,British Airways have the most flights in the dataset

-- 7. Top Destinations: List the top 3 most frequent destination cities
select destination_city, count(*) as Visits 
from flights
group by destination_city
order by visits desc
limit 3; -- Doha(capital of qatar),Frankfrut,Singapore

-- 8. Distance Analysis: What is the average distance of all flights?
select concat(round(avg(distance_km),2),'kms') as AvgDistance from Flights; -- 4189.26kms is AvgDistance


-- Phase 3: Booking & Revenue Analysis
-- 12. Class Comparison: Compare the average price of a Business class ticket vs. an Economy class ticket.
select seat_class,concat('Rs ',Round(avg(ticket_price),2)) as AVGTicket 
from bookings
group by seat_class; -- business class avg tick is 37k and economy has avg ticket of 9k

-- 13. Peak Booking Time: Which month of 2024 saw the highest number of bookings?
select monthname(booking_date) as MonthBooked, count(*) as NumofBookings
from bookings
group by MonthBooked
order by NumofBookings desc; -- March was the highest with 468 and November was the lowest with 374

-- 14. Daily Trends: On which day of the week do most people book their flights?
select DAYNAME(booking_date) as WeekBooked, count(*) as NumofBookings
from bookings
group by WeekBooked
order by NumofBookings desc; -- most number of booking done on Sunday = 746 and least on Saturday = 693

-- 15. Price Volatility: What are the minimum and maximum ticket prices recorded? 
select Concat('Rs ',min(ticket_price)) as MinPrice, Concat('Rs ',max(ticket_price)) as MaxPrice 
from bookings; -- the max ticket price was 70k and min was 3k


-- Phase 4: Advanced Cross-Data Analysis
-- 16. Airline Revenue: Which airline has generated the most total revenue?
select airline,format(sum(ticket_price),0)  as Total_revenue from bookings as b
join flights as f
on b.flight_id = f.flight_id
group by airline
order by Total_revenue desc; -- lufthansa with 2.1+ crores, Air India with 2+, British Airways 1.7+ crore

-- 18. Passenger Loyalty: List passengers who have booked more than 3 flights. 
select p.passenger_id,p.name,count(*) as TimesBooked from passengers as p
join bookings as b
on p.passenger_id = b.passenger_id
group by p.passenger_id,p.name
having TimesBooked > 3
order by TimesBooked desc;

-- 20. Regional Airlines: Which airline is most popular among passengers from India?
select f.airline as airline , count(*) as total_bookings
from flights as f

join bookings as b
on f.flight_id = b.flight_id
join passengers as p
on b.passenger_id = p.passenger_id

where country = "India"
group by airline
order by total_bookings desc; -- the most popular is Air India = 85,then Lufthansa & British Airways = 64, Qatar Airways

