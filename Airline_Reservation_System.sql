-- CREATING DATABASE
create database if not exists AirlineReservationSystem;
use AirlineReservationSystem;

-- CREATING TABLES
# AIRPORTS #
create table Airports(
Airportid int auto_increment primary key,
Airportname varchar(80) not null,
City varchar(40) not null,
Country varchar(40) not null
);

# FLIGHTS #
create table Flights(
Flightid int auto_increment primary key,
Flightnumber varchar(15) not null,
Sourceairportid int not null,
Destinationairportid int not null,
Departuretime datetime not null,
Arrivaltime datetime not null,
Duration int not null,       -- Duration in hours
foreign key(Sourceairportid) references Airports(Airportid),
foreign key(Destinationairportid) references Airports(Airportid)
);

 # PASSENGERS #
 create table Passengers(
 Passengerid int auto_increment primary key,
 Firstname varchar(50) not null,
 Lastname varchar(50) not null,
 Gender char(1) check (Gender in('M','F')),
 Dateofbirth date not null,
 Passportnumber varchar(20) unique not null
 );
 
  # Bookings #
  create table Bookings(
  Bookingid int auto_increment primary key,
  Passengerid int not null,
  Flightid int not null,
  Bookingdate datetime not null default current_timestamp,
  Seatnumber varchar(10) not null,
  Fare decimal(10,2) not null,
  foreign key(Passengerid) references Passengers(Passengerid),
  foreign key(Flightid) references Flights(Flightid)
  );
  
   # STAFF #
   create table Staff(
   Staffid int auto_increment primary key,
   Firstname varchar(60) not null,
   Lastname varchar(60) not null,
   Roles varchar(50) not null,
   Assignedflightid int,
   foreign key(Assignedflightid) references flights(flightid)
   );
   
   -- INSERTING VALUES
   # AIRPORTS TABLE #
   insert into Airports(Airportname,City,Country)
   values
   ('Indira Gandhi International Airport','Delhi','India'),
   ('Chhatrapati Shivaji Maharai International Airport','Mumbai','India'),
   ('Kempegowda International Airport','Bengaluru','India'),
   ('Netaji Subhas Chandra Bose International Airport','Kolkata','India'),
   ('Rajiv Gandhi International Airport','Hyderabad','India'),
   ('Chennai International Airport','Chennai','India'),
   ('Sardar Vallabhbhai Patel Internnational Airport','Ahmedabad','India'),
   ('Kochin International Airport','Kochi','India'),
   ('Pune International Airport','Pune','India'),
   ('Goa International Airport','Goa','India'),
   ('Jay Prakash Narayan International Airport','Patna','India'),
   ('Veer Savarkar International Airport','Port Blair','India'),
   ('Sri Guru Ram Dass Jee International Airport','Amristar','India'),
   ('Jaipur International Airport','Jaipur','India'),
   ('Lal BAhadur Shastri Airport','Varanasi','India');
   select  * from Airports;
   
   # FLIGHTS TABLE #
   insert into Flights(Flightnumber,Sourceairportid,Destinationairportid,Departuretime,Arrivaltime,Duration)
   values
   ('AI101', 1, 2, '2025-02-01 06:00:00', '2025-02-01 08:00:00', 2),
   ('6E302', 2, 3, '2025-02-01 09:00:00', '2025-02-01 11:30:00', 2.5),
   ('SG503', 3, 4, '2025-02-01 12:00:00', '2025-02-01 14:15:00', 2.25),
   ('AI204', 4, 5, '2025-02-01 15:00:00', '2025-02-01 17:30:00', 2.5),
   ('6E405', 5, 6, '2025-02-02 07:00:00', '2025-02-02 09:15:00', 2.25),
   ('UK507', 6, 7, '2025-02-02 10:00:00', '2025-02-02 12:00:00', 2),
   ('SG608', 7, 8, '2025-02-02 13:00:00', '2025-02-02 15:30:00', 2.5),
   ('AI309', 8, 9, '2025-02-03 08:00:00', '2025-02-03 09:45:00', 1.75),
   ('6E710', 9, 10, '2025-02-03 10:30:00', '2025-02-03 12:00:00', 1.5),
   ('AI811', 10, 11, '2025-02-03 13:00:00', '2025-02-03 15:00:00', 2);
   select * from flights;
   
   # PASSENGERS TABLE #
   insert into passengers(Firstname,Lastname,Gender,Dateofbirth,Passportnumber)
   values
   ('Rajesh', 'Sharma', 'M', '1985-03-15', 'P1234567'),
   ('Anita', 'Mehra', 'F', '1990-07-20', 'P2345678'),
   ('Sunil', 'Kumar', 'M', '1982-12-05', 'P3456789'),
   ('Priya', 'Gupta', 'F', '1995-05-18', 'P4567890'),
   ('Vikram', 'Singh', 'M', '1988-09-25', 'P5678901'),
   ('Kavita', 'Reddy', 'F', '1992-11-11', 'P6789012'),
   ('Amit', 'Desai', 'M', '1986-06-02', 'P7890123'),
   ('Neha', 'Verma', 'F', '1994-04-22', 'P8901234'),
   ('Siddharth', 'Bose', 'M', '1993-01-15', 'P9012345'),
   ('Pooja', 'Nair', 'F', '1987-08-30', 'P0123456');
   select * from Passengers;
   
   # BOOKINGS TABLE #
   insert into Bookings(Passengerid,Flightid,Seatnumber,Fare)
   values
   (1, 1, '12A', 4500.00),
   (2, 2, '15B', 5200.00),
   (3, 3, '10C', 4800.00),
   (4, 4, '8D', 5400.00),
   (5, 5, '20E', 5100.00),
   (6, 6, '18F', 4700.00),
   (7, 7, '14A', 5000.00),
   (8, 8, '16B', 4900.00),
   (9, 9, '9C', 4600.00),
   (10, 10, '13D', 5500.00);
   select * from Bookings;
   
   # STAFF TABLE #
   insert into Staff(Firstname,Lastname,Roles,Assignedflightid)
   values
   ('Arun', 'Kumar', 'Pilot', 1),
   ('Meena', 'Roy', 'Cabin Crew', 1),
   ('Suresh', 'Iyer', 'Pilot', 2),
   ('Rita', 'Das', 'Cabin Crew', 2),
   ('Karan', 'Sethi', 'Pilot', 3),
   ('Pallavi', 'Joshi', 'Cabin Crew', 3),
   ('Harish', 'Bhatt', 'Pilot', 4),
   ('Swati', 'Kapoor', 'Cabin Crew', 4),
   ('Raghav', 'Shah', 'Pilot', 5),
   ('Simran', 'Malhotra', 'Cabin Crew', 5);
   select * from Staff;
   
   -- QUERIES
   # FIND THE DETAILS OF A PASSENGER BY THEIR PASSPORT NUMBER
   select firstname,lastname,dateofbirth,passportnumber
   from passengers
   where Passportnumber='P5678901';
   
   # SHOW ALL BOOKINGS FOR A SPECIFIC FLIGHT
   select b.bookingid,p.firstname,p.lastname,b.seatnumber,b.fare
   from bookings b
   join passengers p on b.Passengerid=p.Passengerid
   where b.Flightid=6;
   
   # COUNT TOTAL NUMBER OF PASSENGERS FOR EACH FLIGHT
   select f.flightnumber,count(b.bookingid) as totalbookings
   from flights f
   left join bookings b on f.flightid = b.flightid
   group by f.Flightnumber;
   
   # CALCULATE THE TOTAL REVENUE GENERATED FOR EACH FLIGHT
   select f.flightnumber,sum(b.fare) as totalrevenue
   from flights f
   join bookings b on f.flightid=b.Flightid
   group by f.Flightnumber;
   
   # FIND THE PASSENGER WHO HAS SPENT THE MOST ON BOOKING
   select p.firstname,p.lastname,sum(b.fare) as totalspent
   from passengers p
   join bookings b on p.Passengerid=b.Passengerid
   group by p.Passengerid
   order by totalspent desc
   limit 1;
   
   # LIST ALL FLIGHTS BETWEEN TWO SPECIFIC CITIES
   select f.flightnumber,a1.city as sourcecity,a2.city as destinationcity,f.departuretime,f.arrivaltime
   from flights f
   join airports a1 on f.Sourceairportid = a1.Airportid
   join airports a2 on f.Destinationairportid = a2.Airportid
   where a1.city = 'Delhi' and a2.city = 'Mumbai';
   
   # FIND FLIGHTS DEPARTING WITHIN THE NEXT 24 HOURS
   select flightnumber,departuretime,arrivaltime
   from flights
   where Departuretime between now() and date_add(now(),interval 1 day);
   
   # UPDATE PASSENGER INFO
   update passengers
   set lastname = 'Reddy'
   where passengerid = 1;
   
   # ADD A NEW COLUMN TO AN EXISTING TABLE
   alter table flights
   add column flightstatus varchar(30) default 'Scheduled';
   select * from flights;
   
   # DROP A COLUMN
   alter table flights
   drop column flightstatus;
   
   # ADD A FOREIGN KEY CONSTRAINT
   alter table bookings
   add constraint fk_passengerid foreign key (passengerid) references passengers(passengerid);
   
   
   
   
   
   
   
   
   
   
   
   
  



