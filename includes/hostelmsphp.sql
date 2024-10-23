SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";





-- table admin


CREATE TABLE admin (
  id int(11) NOT NULL AUTO_INCREMENT,
  username varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  password varchar(300) NOT NULL,
  reg_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updation_date date NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- data for table admin
--

INSERT INTO admin (id, username, email, password, reg_date, updation_date) VALUES
(1, 'admin', 'admin@mail.com', 'D00F5D5217896FB7FD601412CB890830', '2020-09-08 20:31:45', '2021-03-07');

-- --------------------------------------------------------

--
-- table adminlog
--

CREATE TABLE adminlog (
  id int(11) NOT NULL AUTO_INCREMENT,
  adminid int(11) NOT NULL,
  ip varbinary(16) NOT NULL,
  logintime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (adminid) REFERENCES admin(id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- table courses
--

CREATE TABLE courses (
  id int(11) NOT NULL,
  course_code varchar(255) NOT NULL,
  course_sn varchar(255) NOT NULL,
  course_fn varchar(255) NOT NULL,
  posting_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE courses
  ADD PRIMARY KEY (id);

--
--  data for table courses
--

INSERT INTO courses (id, course_code, course_sn, course_fn, posting_date) VALUES
(1, 'BTH123', 'B.Tech', 'Bachelor Of Technology', '2023-09-23 00:45:13'),
(2, 'BCOM18', 'B.Com', 'Bachelor Of Commerce', '2023-09-23 00:45:13'),
(3, 'BSC296', 'BSC', 'Bachelor of Science', '2023-09-23 00:45:13'),
(4, 'BCOA55', 'BCA', 'Bachelor Of Computer Application', '2023-09-23 00:45:13'),
(5, 'MCA001', 'MCA', 'Master of Computer Application', '2023-09-23 00:47:13'),
(6, 'MBA777', 'MBA', 'Master In Business Administration', '2023-09-23 00:54:13'),
(7, 'BE069', 'BE', 'Bachelor of Engineering', '2023-09-23 00:59:13'),
(8, 'BIT353', 'BIT', 'Bachelors In Information Technology', '2024-03-07 06:59:05'),
(9, 'MIT005', 'MIT', 'Master of Information Technology', '2024-04-03 13:03:19');

--
-- table rooms
--

CREATE TABLE rooms (
  id int(11) NOT NULL AUTO_INCREMENT,
  seater int(11) NOT NULL,
  room_no int(11) NOT NULL UNIQUE,  -- Make sure room_no is unique
  fees int(11) NOT NULL,
  posting_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
--  table rooms
--

INSERT INTO rooms (id, seater, room_no, fees, posting_date) VALUES
(1, 5, 100, 30000, '2023-09-10 04:24:06'),
(2, 4, 201, 35000, '2023-09-10 04:24:06'),
(3, 2, 200, 60000, '2023-09-10 04:33:06'),
(4, 3, 112, 45000, '2023-09-10 04:33:30'),
(5, 5, 132, 30000, '2023-09-10 04:28:52'),
(6, 4, 11, 35000, '2023-09-10 05:01:02'),
(7, 2, 269, 60000, '2023-09-10 14:39:22'),
(8, 1, 310, 70000, '2023-09-10 14:41:36'),
(9, 1, 330, 70000, '2023-09-10 14:41:53'),
(10, 3, 401, 45000, '2023-09-10 14:45:00');


-- --------------------------------------------------------

--
-- table registration
--

CREATE TABLE registration (
  id int(11) NOT NULL AUTO_INCREMENT,
  roomno int(11) NOT NULL,
  seater int(11) NOT NULL,
  feespm int(11) NOT NULL,
  foodstatus int(11) NOT NULL,
  stayfrom date NOT NULL,
  duration int(11) NOT NULL,
  course varchar(500) NOT NULL,
  regno varchar(255) NOT NULL,
  firstName varchar(500) NOT NULL,
  middleName varchar(500) NOT NULL,
  lastName varchar(500) NOT NULL,
  gender varchar(250) NOT NULL,
  contactno bigint(11) NOT NULL,
  emailid varchar(500) NOT NULL,
  egycontactno bigint(11) NOT NULL,
  guardianName varchar(500) NOT NULL,
  guardianRelation varchar(500) NOT NULL,
  guardianContactno bigint(11) NOT NULL,
  corresAddress varchar(500) NOT NULL,
  corresCIty varchar(500) NOT NULL,
  corresState varchar(500) NOT NULL,
  corresPincode int(11) NOT NULL,
  pmntAddress varchar(500) NOT NULL,
  pmntCity varchar(500) NOT NULL,
  pmnatetState varchar(500) NOT NULL,
  pmntPincode int(11) NOT NULL,
  postingDate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updationDate varchar(500) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (roomno) REFERENCES rooms(room_no)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- data for table registration
--

INSERT INTO registration (id, roomno, seater, feespm, foodstatus, stayfrom, duration, course, regno, firstName, middleName, lastName, gender, contactno, emailid, egycontactno, guardianName, guardianRelation, guardianContactno, corresAddress, corresCIty, corresState, corresPincode, pmntAddress, pmntCity, pmnatetState, pmntPincode, postingDate, updationDate) VALUES
(15, 200, 2, 910, 1, '2023-03-07', 12, 'Bachelors In Information Technology', '11101', 'Meera', 'A.', 'Iyer', 'FEMALE', 7455558855, 'meera@mail.com', 7412589650, 'Raj Iyer', 'Father', 7896666600, '20 MG Road', 'Mumbai', 'Maharashtra', 400001, '20 MG Road', 'Mumbai', 'Maharashtra', 400001, '2023-04-02 17:06:43', ''),
(16, 112, 3, 1300, 1, '2023-04-04', 12, 'Master of Computer Application', 'CA003', 'Rohan', 'J.', 'Sharma', 'MALE', 1325658800, 'rohan@mail.com', 4785555500, 'Vijay Sharma', 'Father', 4125478555, '48 MG Road', 'Delhi', 'Delhi', 110001, '48 MG Road', 'Delhi', 'Delhi', 110001, '2023-04-03 13:16:45', ''),
(17, 132, 5, 1990, 0, '2023-04-04', 6, 'Master In Business Administration', 'CA006', 'Priya', 'J.', 'Patel', 'FEMALE', 7895555544, 'priya@mail.com', 2224445585, 'Neeta Patel', 'Mother', 1478569888, '18 Hanuman Road', 'Ahmedabad', 'Gujarat', 380001, '18 Hanuman Road', 'Ahmedabad', 'Gujarat', 380001, '2023-04-03 14:37:56', ''),
(18, 269, 2, 910, 1, '2023-05-03', 12, 'Bachelor of Engineering', 'CA002', 'Arjun', 'E.', 'Singh', 'MALE', 1346565650, 'arjun@mail.com', 7850001450, 'Rita Singh', 'Mother', 7850001010, '25 Gandhi Lane', 'Bengaluru', 'Karnataka', 560001, '25 Gandhi Lane', 'Bengaluru', 'Karnataka', 560001, '2023-04-03 14:47:31', ''),
(19, 100, 5, 1990, 0, '2023-04-17', 8, 'Bachelor Of Commerce', 'CA009', 'Nisha', 'W.', 'Kumar', 'FEMALE', 3547777770, 'nisha@mail.com', 4445554470, 'Ravi Kumar', 'Father', 4785698555, '109 Nehru Street', 'Pune', 'Maharashtra', 411001, '109 Nehru Street', 'Pune', 'Maharashtra', 411001, '2023-04-03 15:02:15', ''),
(20, 310, 1, 750, 0, '2023-04-10', 12, 'Master of Information Technology', 'CA014', 'Vikram', 'K.', 'Mishra', 'MALE', 7854441014, 'vikram@mail.com', 7412585500, 'Anita Mishra', 'Mother', 7458888888, '77 Ashok Nagar', 'Bhopal', 'Madhya Pradesh', 462001, '77 Ashok Nagar', 'Bhopal', 'Madhya Pradesh', 462001, '2023-04-03 15:53:07', '');

-- --------------------------------------------------------


-- --------------------------------------------------------

--
-- table states
--

CREATE TABLE states (
  id int(11) NOT NULL,
  State varchar(150) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
ALTER TABLE states
  ADD PRIMARY KEY (id);
--
-- data for table states
--

INSERT INTO states (id, State) VALUES
(1, 'Andhra Pradesh'),
(2, 'Arunachal Pradesh'),
(3, 'Assam'),
(4, 'Bihar'),
(5, 'Chhattisgarh'),
(6, 'Goa'),
(7, 'Gujarat'),
(8, 'Haryana'),
(9, 'Himachal Pradesh'),
(10, 'Jharkhand'),
(11, 'Karnataka'),
(12, 'Kerala'),
(13, 'Madhya Pradesh'),
(14, 'Maharashtra'),
(15, 'Manipur'),
(16, 'Meghalaya'),
(17, 'Mizoram'),
(18, 'Nagaland'),
(19, 'Odisha'),
(20, 'Punjab'),
(21, 'Rajasthan'),
(22, 'Sikkim'),
(23, 'Tamil Nadu'),
(24, 'Telangana'),
(25, 'Tripura'),
(26, 'Uttar Pradesh'),
(27, 'Uttarakhand'),
(28, 'West Bengal'),
(29, 'Andaman and Nicobar Islands'),
(30, 'Chandigarh'),
(31, 'Dadra and Nagar Haveli and Daman and Diu'),
(32, 'Lakshadweep'),
(33, 'Delhi'),
(34, 'Puducherry'),
(35, 'Ladakh'),
(36, 'Jammu and Kashmir');



CREATE TABLE hostel (
    id int(11) NOT NULL,
    hostel_name varchar(25) NOT NULL,
    hostel_address varchar(25) NOT NULL,
    no_of_rooms int(11) NOT NULL,
    hostel_type varchar(25) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO hostel(id,hostel_name,hostel_address,no_of_rooms,hostel_type) VALUES
(101,'Artemis','Pala, Kottayam',10,'FEMALE'),
(102,'Orion','Valavoor,Kottayam',10,'MALE'),
(103,'Valkyrie','Pala,Kottayam',10,'FEMALE'),
(104,'Zeus','Valavoor,Kottayam',10,'MALE'),

(105,'Messmer','Valavoor,Kottayam',10,'MALE');
-- --------------------------------------------------------
CREATE TABLE userregistration (
  id int(11) NOT NULL,
  regNo varchar(255) NOT NULL,
  firstName varchar(255) NOT NULL,
  middleName varchar(255) NOT NULL,
  lastName varchar(255) NOT NULL,
  gender varchar(255) NOT NULL,
  contactNo bigint(20) NOT NULL,
  email varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  regDate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updationDate varchar(45) NOT NULL,
  passUdateDate varchar(45) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- data for table userregistration
--

INSERT INTO userregistration (id, regNo, firstName, middleName, lastName, gender, contactNo, email, password, regDate, updationDate, passUdateDate) VALUES
(10, 'CA001', 'Rahul', 'K.', 'Sharma', 'MALE', 9123456789, 'rahul@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '2023-09-10 04:21:33', '', '2023-09-12 10:35:38'),
(19, 'CA002', 'Ravi', 'E.', 'Kumar', 'MALE', 9345678901, 'ravi@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '2023-09-10 04:46:33', '', ''),
(20, 'CA003', 'Amit', 'J.', 'Singh', 'MALE', 9456789012, 'amit@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '2023-09-10 04:54:33', '', ''),
(21, 'CA004', 'Suresh', 'S.', 'Patel', 'MALE', 9567890123, 'suresh@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '2023-09-11 04:19:44', '2023-09-12 10:15:29', '2023-09-12 10:35:38'),
(22, 'CA005', 'Rajesh', 'B.', 'Gupta', 'MALE', 9678901234, 'rajesh@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '2023-09-11 16:29:57', '', ''),
(24, 'CA006', 'Priya', 'J.', 'Verma', 'FEMALE', 9789012345, 'priya@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '2023-09-12 14:31:50', '', '2023-09-12 08:21:07'),
(25, 'CA007', 'Sneha', 'J.', 'Mehta', 'FEMALE', 9890123456, 'sneha@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '2023-09-12 14:51:00', '', ''),
(26, 'CA008', 'Arjun', 'A.', 'Nair', 'MALE', 9901234567, 'arjun@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '2023-09-12 14:52:28', '', ''),
(27, 'CA009', 'Neha', 'W.', 'Kapoor', 'FEMALE', 9912345678, 'neha@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '2023-09-12 14:53:19', '', ''),
(28, 'CA010', 'Vikram', 'A.', 'Reddy', 'MALE', 9923456789, 'vikram@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '2023-09-12 14:53:58', '', ''),
(29, 'CA011', 'Nitin', 'K.', 'Joshi', 'MALE', 9934567890, 'nitin@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '2023-09-12 14:54:44', '', ''),
(30, 'CA012', 'Pooja', 'D.', 'Iyer', 'FEMALE', 9945678901, 'pooja@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '2023-09-12 14:57:04', '', ''),
(31, 'CA013', 'Kunal', 'H.', 'Desai', 'MALE', 9956789012, 'kunal@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '2023-09-12 14:57:51', '', ''),
(32, 'CA014', 'Ayesha', 'K.', 'Malik', 'FEMALE', 9967890123, 'ayesha@mail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '2023-09-12 15:00:04', '', '');
--
-- table userlog
--

CREATE TABLE userlog (
  id int(11) NOT NULL AUTO_INCREMENT,
  userId int(11) NOT NULL,
  userEmail varchar(255) NOT NULL,
  userIp varbinary(16) NOT NULL,
  city varchar(255) NOT NULL,
  country varchar(255) NOT NULL,
  loginTime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (userId) REFERENCES userregistration(id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- data for table userlog
--

INSERT INTO userlog (id, userId, userEmail, userIp, city, country, loginTime) VALUES
(9, 10, 'rahul@mail.com', 0x3a3a31, 'Mumbai', 'India', '2023-09-05 04:12:00'),
(10, 10, 'rahul@mail.com', 0x3a3a31, 'Mumbai', 'India', '2023-09-05 04:14:44'),
(11, 21, 'amit@mail.com', 0x3a3a31, 'Delhi', 'India', '2023-09-05 04:19:52'),
(12, 21, 'amit@mail.com', 0x3a3a31, 'Delhi', 'India', '2023-09-05 08:53:33'),
(13, 21, 'amit@mail.com', 0x3a3a31, 'Delhi', 'India', '2023-09-05 17:35:34'),
(14, 21, 'amit@mail.com', 0x3a3a31, 'Delhi', 'India', '2023-09-06 02:43:01'),
(15, 21, 'amit@mail.com', 0x3a3a31, 'Delhi', 'India', '2023-09-06 15:18:49'),
(16, 21, 'amit@mail.com', 0x3a3a31, 'Delhi', 'India', '2023-09-07 09:35:23'),
(17, 21, 'amit@mail.com', 0x3a3a31, 'Delhi', 'India', '2023-09-07 09:59:55'),
(18, 22, 'neha@mail.com', 0x3a3a31, 'Bangalore', 'India', '2023-09-16 14:51:24'),
(19, 22, 'neha@mail.com', 0x3a3a31, 'Bangalore', 'India', '2023-12-12 15:31:50'),
(20, 22, 'neha@mail.com', 0x3a3a31, 'Bangalore', 'India', '2024-04-02 16:01:31'),
(21, 21, 'amit@mail.com', 0x3a3a31, 'Delhi', 'India', '2024-04-02 16:52:47'),
(22, 20, 'ravi@mail.com', 0x3a3a31, 'Chennai', 'India', '2024-04-03 13:15:00'),
(23, 24, 'priya@mail.com', 0x3a3a31, 'Hyderabad', 'India', '2024-04-03 14:32:09'),
(24, 24, 'priya@mail.com', 0x3a3a31, 'Hyderabad', 'India', '2024-04-03 14:34:17'),
(25, 19, 'arjun@mail.com', 0x3a3a31, 'Kolkata', 'India', '2024-04-03 14:44:31'),
(26, 27, 'sneha@mail.com', 0x3a3a31, 'Pune', 'India', '2024-04-03 15:00:46'),
(27, 32, 'kunal@mail.com', 0x3a3a31, 'Ahmedabad', 'India', '2024-04-03 15:48:35'),
(28, 32, 'kunal@mail.com', 0x3a3a31, 'Ahmedabad', 'India', '2024-04-03 15:51:34');

-- --------------------------------------------------------

--
-- table userregistration
--












    














ALTER TABLE admin
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE courses
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE registration
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

ALTER TABLE hostel
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

ALTER TABLE rooms
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE states
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

ALTER TABLE userlog
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

ALTER TABLE userregistration
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;