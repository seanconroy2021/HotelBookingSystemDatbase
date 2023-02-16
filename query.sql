
/* This is where we going to get all the name and email of people who live in Abruzzi. So we can email them promotions.*/
select concat(fName,Lname) as 'name',email ,county
from Guest
where county = 'Abruzzi'
order by fName;


/*This list all the employee who work in the hotel*/
select concat(fName,Lname) as 'name' ,DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(),DOB)), '%Y') 
 + 0 AS age,phoneNumber,gender,roleId,supervisor
from Staff
order by roleId;

/* This is look up to see what room types have price between 600 & 800*/
SELECT Room.roomNumber as 'room number' ,Room.floor,Roomtype.roomGroup as 'room type' ,RoomType.roomDesc as 'room description', RoomType.price FROM Room
CROSS JOIN RoomType
WHERE Price BETWEEN 600 AND 800
order by RoomType.price;


/* This looks for room that are higer than the 2 floor as guest has asked not to be close to the ground floor*/
SELECT Room.roomNumber as 'room number' ,Room.floor,Roomtype.roomGroup as 'room type' ,RoomType.roomDesc as 'room description', RoomType.price FROM Room
CROSS JOIN RoomType
WHERE floor >2
order by RoomType.price;


/* This is finding customer who name begin with 'an'*/
SELECT fname,phoneNumber
FROM guest
WHERE fname LIKE 'an%';

/* This is is seeing what guest we have staying on 2021-10-1 we have only one*/
SELECT * FROM Booking WHERE bookingDate='2021-10-1';

/* This is get all the customer credit cards by using a left jion*/
select  concat(fName,Lname) as 'name',creditCard as 'credit Card'
from guest left join payment
 on guest.guestId = payment.guestId;

/* This list all the room in the hotel group across ireland*/
 select roomNumber as 'room Number', roomGroup  as 'room group' , hotel.hotelName as 'hotel name'
  from room join hotel
  on room.hotelNo = room.hotelNo
  order by hotelName desc ,roomNumber asc;


/* This shows the amount of rooms in each hotel*/
 select hotelname as 'hotel name' ,count(hotelname) as 'number of rooms'
 from hotel join room
 on hotel.hotelNo = room.hotelNo
 group by hotelname
 order by hotelname;
 
/* This shows all people staying in hotels across ireland and how many days they will be staying*/
SELECT Guest.fName as'first name', Guest.Lname as'last name',booking.bookingDate as 'arrival date', DATEDIFF(booking.depatureDate, booking.bookingDate) AS 'days staying' FROM booking
INNER JOIN Guest
ON Guest.guestId = booking.guestId
order by Guest.fname;


/* This get the person addons and link them to the guest*/
SELECT Guest.Fname as 'first name', Guest.Lname as 'last Name' ,AddOn.description ,AddOn.price  FROM Request
RIGHT JOIN Guest
ON Guest.guestId = Request.guestId
Right JOIN AddOn
On AddOn.addOnId = Request.addOnId
WHERE Guest.Fname Like 'Anastasia';

/* This find the room number and floor number for the guest and search for their name in the system*/
SELECT Guest.fname as 'first name', Room.roomNumber ,Room.floor FROM Reserve
INNER JOIN Booking
ON Booking.bookingId = Reserve.bookingId
INNER JOIN Room
ON Room.roomNumber = Reserve.roomNumber
INNER JOIN Guest
ON Guest.guestId = Booking.guestId
WHERE Guest.Fname Like 'Anastasia';



/* This is the total price for addons for each guest*/
select Guest.guestId , Guest.Fname as 'first name ' , Guest.Lname as 'last name'  ,sum(AddOn.price) as 'total price of addons' FROM Request
INNER JOIN Guest
ON Request.guestId = Guest.guestId
INNER JOIN Addon
ON Request.addOnId = Addon.addOnId
 group by guestId
 order by guestId;
 
 /* This is the overall report of the stay in the hotel how much they paid or owe*/
SELECT Booking.bookingId,CONCAT(Guest.fname, Guest.lName) as 'name' ,Guest.phoneNumber,Room.roomNumber,RoomType.price as 'room daily price',DATEDIFF(booking.depatureDate, booking.bookingDate)as 'stay length',(RoomType.price*DATEDIFF(booking.depatureDate, booking.bookingDate))as'total room cost',AddOn.price as 'total addon cost', ((RoomType.price*DATEDIFF(booking.depatureDate, booking.bookingDate))+AddOn.price) AS 'TOTAL', payment.creditCard as 'credit card number',payment.employeeId from Guest
 JOIN Booking
ON Booking.guestId = Guest.guestId
  JOIN Reserve
ON Reserve.bookingId = Booking.bookingId
  JOIN Room
ON Room.roomNumber = Reserve.roomNumber
JOIN RoomType
ON RoomType.roomGroup = Room.roomGroup
JOIN Request
ON Request.guestId = Guest.guestId
JOIN AddOn
ON AddOn.addOnId = Request.addOnId
JOIN Payment
ON Payment.guestId = Guest.guestId;





 
 
 













