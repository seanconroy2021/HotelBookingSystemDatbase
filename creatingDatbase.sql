/*this create the database that im going to be using in my project*/
CREATE DATABASE IF NOT EXISTS HotelBookingSystem;


use HotelBookingSystem;

CREATE TABLE IF NOT EXISTS Guest
(
	guestId int auto_increment,
    fName varchar(15)NOT NULL,
    lName varchar(20)NOT NULL,
    DOB date NOT NULL,
    phoneNumber char(10)NOT NULL, /* phone number in ireland are size of 10*/
    email varchar(255) NOT NULL,
    street varchar(20)NOT NULL,
    county varchar(20)NOT NULL,
    postCode varchar(20)NOT NULL,
    primary key(guestId)
);


CREATE TABLE IF NOT EXISTS AddOn
(
	addOnId int auto_increment,
    description longtext NOT NULL,
    price decimal(5,2) NOT NULL, /* this allow a price up to 5 digits eg. 90,000 and two decimals after it 90,000.50 */
    primary key (addOnId)
);

CREATE TABLE IF NOT EXISTS RoomType
(
  roomGroup varchar(20) NOT NULL,
  price decimal(5,2) NOT NULL,
  roomDesc longtext NOT NULL,
  primary key (roomGroup)
);

CREATE TABLE IF NOT EXISTS Hotel
(
	hotelNo int auto_increment,
    hotelName varchar(25)NOT NULL,
    city varchar(20)NOT NULL,
    phoneNumber char(10)NOT NULL,
    primary key(hotelNo)
);


CREATE TABLE IF NOT EXISTS Payment 
(
	paymentInvoiceId int auto_increment,
    creditCard char(16),
    invoice longtext NOT NULL,
    dates date NOT NULL,
    guestId int,
    primary key (paymentInvoiceId),
    foreign key (guestId) references Guest(guestId)
	ON UPDATE cascade on delete cascade
);

CREATE TABLE IF NOT EXISTS Staff
(
	employeeId int auto_increment,
    fName varchar(20)NOT NULL,
    lName varchar(20)NOT NULL,
    DOB date NOT NULL,
    phoneNumber char(10)NOT NULL,
    emergencyPhone char(10)NOT NULL,
    gender ENUM('male', 'female') NOT NULL ,
    roleId varchar(5)NOT NULL ,
    paymentInvoiceId int,
    supervisor int,
    primary key (employeeId),
    foreign key(paymentInvoiceId) references Payment(paymentInvoiceId)
    ON UPDATE cascade on delete cascade,
    foreign key(supervisor) references Staff(employeeId)
    ON UPDATE cascade on delete cascade
    );
    
    CREATE TABLE IF NOT EXISTS Booking
    (
		bookingId int auto_increment,
        bookingDate date NOT NULL,
        depatureDate date NOT NULL,
        adults int NOT NULL ,
        kids int NOT NULL,
        employeeId int,
        guestId int,
        primary key (bookingId),
        foreign key (guestId) references Guest(guestId)
        ON UPDATE cascade on delete cascade,
        foreign key (employeeId) references Staff(employeeId)
        ON UPDATE cascade on delete cascade
	);
    
    
    CREATE TABLE IF NOT EXISTS Room
    (
		roomNumber int NOT NULL,
        floor varChar (1) NOT NULL,
		roomGroup varchar(20),
        hotelNo int,
		primary key(roomNumber,hotelNo),
		foreign key (hotelNo) references Hotel(hotelNo)
        ON UPDATE cascade on delete cascade,
        foreign key (roomGroup) references roomType(roomGroup)
        ON UPDATE cascade on delete cascade
	);
    
     CREATE TABLE IF NOT EXISTS Request
     (
		guestId int,
        addOnId int,
        primary key(guestId,addOnId),
        foreign key (guestId) references Guest(guestId)
        ON UPDATE cascade on delete cascade,
        foreign key (addOnId) references AddOn(addOnId)
        ON UPDATE cascade on delete cascade
	);
    
    CREATE TABLE IF NOT EXISTS Reserve 
    (
		roomNumber int,
        bookingId int,
        primary key (roomNumber,bookingId),
		foreign key (roomNumber) references Room(roomNumber)
        ON UPDATE cascade on delete cascade,
        foreign key (bookingId) references Booking(bookingId)
        ON UPDATE cascade on delete cascade
        
	);
        
    
        
        
     
    
        

         
        
        
        

    
        
        
        
        
        
    
    
    
    
    
    
    
    
    
    
    



  
