Use ola;
 #		1. Retrieve all successful bookings:
 create view successful_bookings as
 select * from bookings 
 where Booking_Status ='success';
 
 select * from successful_bookings;
 
 #		2. Find the average ride distance for each vehicle type:
 create view average_ride_distance as
 select Vehicle_Type, avg(Ride_Distance) from bookings
 group by Vehicle_Type;
 
 select * from average_ride_distance;
 
 #		3. Get the total number of cancelled rides by customers:
 create view cancelled_by_customers as
 select count(*) from bookings
 where Booking_Status="Canceled by Customer";
 
 select * from cancelled_by_customers;
 
 #		4. List the top 5 customers who booked the highest number of rides:
 create view top_5_customers as
 select Customer_ID, count(Booking_ID) as total_rides from bookings
 group by Customer_ID
 order by total_rides desc limit 5;	
 
 select * from top_5_customers;
 
 #		5. Get the number of rides cancelled by drivers due to personal and car-related issues:
 create view cancelled_by_drivers as
 select count(*) from bookings
 where Canceled_Rides_by_Driver="Personal & Car related issue";
 
 select * from cancelled_by_drivers;
 
 #		6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
  create view max_and_mini_rating as
  select max(Driver_Ratings) as MAX_RATING, min(Driver_Ratings) as MIN_RATING
  from bookings
  where Vehicle_Type="Prime Sedan";
  
  select * from max_and_mini_rating;
  
 #		7. Retrieve all rides where payment was made using UPI:
create view UPI_payment as
 select * from bookings
 where Payment_Method="UPI";
 
 select * from UPI_payment;
 
 #		8. Find the average customer rating per vehicle type:
 create view avg_rating_per_vehicle as
 select Vehicle_Type, avg(Customer_Rating) as Average_customer_rating
 from bookings
 group by Vehicle_Type;
 
 select * from avg_rating_per_vehicle;
 
 #		9. Calculate the total booking value of rides completed successfully:
 create view Total_value as
 select sum(Booking_Value) as Total
 from bookings
 where Booking_Status ="Success";
 
 select * from Total_value;
 
 #		10. List all incomplete rides along with the reason:
 create view incomplete_rides as
 select Booking_ID,Incomplete_Rides_Reason from bookings
 where Incomplete_Rides="yes";
 
 select * from incomplete_rides;
 