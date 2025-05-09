create database Airbnb ;

use Airbnb;


select * from  airbnb ; 
 ;




select * from airbnb.Booking_Table ;

select * from airbnb.listing_table ;
#2 


select name from Listing_table ;


#3 

 select count(id) from Listing_table ; 
 
 
#4 
 
 
 select sum(listing_id)
 from Booking_Table 
; 
 

#5 

 select host_id from Listing_table ;  
 

#6 

select  distinct(host_name), id , name  ,  host_id  ,  host_name ,  neighbourhood_group   ,neighbourhood ,   room_type  
from Listing_table ; 


#7 

select   *  from Listing_table 
where neighbourhood_group   in (select distinct(neighbourhood_group) from Listing_table)  ;


#8 

select  distinct(neighbourhood) from Listing_table ;

#9 

select distinct(room_type) from Listing_table ; 

#10 


select distinct(neighbourhood_group) from Listing_table ; 





#11 


select max(price) from Booking_Table ;


#12 


select min(price) from Booking_Table ;

#13  



select avg(price) from Booking_Table ;

#14  

select min(minimum_nights) from Booking_Table ; 


#15 

select max(minimum_nights) from Booking_Table ;

#16  

select avg(availability_365) 
from Booking_Table ; 


#17 


select  id , availability_365 from Listing_Table as L1 
inner join Booking_Table as L2 
where availability_365 > 300 ;


#18 

select  count(l2.id)  from  Booking_Table as l1
inner join   Listing_Table as l2 on l1.listing_id = l2.id
where  minimum_nights <5 
group by minimum_nights;


#19 
   



#22
select price , host_name from  Booking_Table as l1
inner join   Listing_Table as l2 on l1.listing_id = l2.id ; 


#23

select price , room_type from Booking_Table
inner join Listing_Table ;  


#24 

select minimum_nights , neighbourhood_group from Booking_Table as l1
inner join   Listing_Table as l2 on l1.listing_id = l2.id ; 


#25 

select availability_365 , neighbourhood from Booking_Table as l1
inner join   Listing_Table as l2 on l1.listing_id = l2.id ; 

#26 

select sum(price)  from Booking_Table as l1
inner join   Listing_Table as l2 on l1.listing_id = l2.id
group by  neighbourhood_group; 




#27 
select max(price)  from Booking_Table as l1
inner join   Listing_Table as l2 on l1.listing_id = l2.id
group by  neighbourhood_group; 



#28 

select max(minimum_nights)  from Booking_Table as l1
inner join   Listing_Table as l2 on l1.listing_id = l2.id
group by  neighbourhood_group;


#29 


select max(reviews_per_month)  from Booking_Table as l1
inner join   Listing_Table as l2 on l1.listing_id = l2.id
group by  neighbourhood_group;


#30 


select max(price) from Booking_Table as l1
inner join   Listing_Table as l2 on l1.listing_id = l2.id
group by room_type ; 


#31   

select avg(number_of_reviews) from Booking_Table as l1
inner join   Listing_Table as l2 on l1.listing_id = l2.id
group by room_type ; 


#32  

select avg (price) from Booking_Table as l1
inner join   Listing_Table as l2 on l1.listing_id = l2.id
group by room_type ; 


#33 


select avg(minimum_nights) from Booking_Table as l1
inner join   Listing_Table as l2 on l1.listing_id = l2.id
group by room_type ;  



#34  


select avg(price) as Average_price from Booking_Table as l1
inner join   Listing_Table as l2 on l1.listing_id = l2.id
where price < 100 
group by room_type ; 


#35 


select avg(minimum_nights) as Average_nights from Booking_Table as l1
inner join   Listing_Table as l2 on l1.listing_id = l2.id 
where minimum_nights > 5 
group by neighbourhood ; 


#36  

select * from booking_table  
where listing_id in (select listing_id from booking_table where price > 200) ;


#37 

select * from booking_table bt where listing_id in (select id from listing_table lt where host_id = 314941);



#38 



#39 


 select * from listing_table 
 where name like "%cozy%" ;


#40

select price , L2.host_id , L2.neighbourhood_group  from Booking_Table as l1
inner join   Listing_Table as l2 on l1.listing_id = l2.id
 where neighbourhood_group = "manhattan" ; 


#41 

select id, host_name , neighbourhood from listing_table as L2 
inner join booking_table as L1 on l1.listing_id = l2.id
where neighbourhood in ("Upper west side","Williamsburg") and price > 100 ; 


#42 


select l2.id, l2.host_name, l2.neighbourhood , l1.price from booking_table l1 inner join listing_table l2 on l1.listing_id = l2.id 
where host_name = "Elise"  and neighbourhood = "Bedford-Stuyvesant" ; 



#43 


select L2.host_name , L1.availability_365 , L1.minimum_nights from booking_table l1 inner join listing_table l2 on l1.listing_id = l2.id 
where availability_365 > 100 and minimum_nights > 100 ;



#44 


select L2.id , L2.host_name , L1.number_of_reviews ,L1.reviews_per_month  from booking_table l1 inner join listing_table l2 on l1.listing_id = l2.id 
where number_of_reviews > 500 and reviews_per_month > 5  ;


#45


select L2.neighbourhood_group , sum(L1.number_of_reviews) as Total_review from booking_table l1 inner join listing_table l2 on l1.listing_id = l2.id 
group by neighbourhood_group
order by Total_review desc limit 1  ; 


#46 


select L2.host_name , sum(L1.price) as total_price from booking_table l1 inner join listing_table l2 on l1.listing_id = l2.id 
group by host_name 
order by total_price  limit 1 ; 


#47

select L2.host_name , sum(L1.price) as total_price from booking_table l1 inner join listing_table l2 on l1.listing_id = l2.id 
group by host_name 
order by total_price desc limit 1 ; 

#48 

select L2.host_name , L1.price from booking_table l1 inner join listing_table l2 on l1.listing_id = l2.id 
where price in (select max(price) from booking_table) ;


#49 


select L2.neighbourhood_group , L1.price from booking_table l1 inner join listing_table l2 on l1.listing_id = l2.id 
where price < 100 ; 



#50 


select max(L1.price) as Maximum_price, avg(L1.availability_365) as Average_Avaibility  from booking_table l1 inner join listing_table l2 on l1.listing_id = l2.id 
group by room_type 
order by Maximum_price ; 






























 