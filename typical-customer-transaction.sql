-- SQL TRANSACTIONS 

-- enter dummy booking data [TEST]

START TRANSACTION;

SET @holiday_start_date= '2023-06-01';

INSERT INTO booking (BookingReference, BookingMadeDate, BookingStartDate, HolidayDurationDays, AmountPaid, Total, RemainderToPay) 
VALUES ('XLG44343', CURRENT_DATE, @holiday_start_date, 1, 0,0,0);
SET @last_id_in_booking=LAST_INSERT_ID();

SET @booking_made_date = (SELECT BookingMadeDate FROM booking WHERE BookingID=@last_id_in_booking);


-- enter passenger details and select if lead passenger (CHECK IF LEAD PASSENGER IS OVER 18?) [WORKING!]

INSERT INTO person_details (PersonTitleID, FirstName, LastName, DateOfBirth) VALUES (1, 'SAMUEL', 'HAYMAN', '1982-04-21');
SET @last_id_in_person_details = LAST_INSERT_ID();
INSERT INTO passenger (PersonDetailsID, IsLeadPassenger) VALUES (@last_id_in_person_details, 0);
SET @last_id_in_passenger_details_1 = LAST_INSERT_ID();
INSERT INTO booking_passenger(PassengerID, BookingID) VALUES (@last_id_in_passenger_details_1, @last_id_in_booking);

INSERT INTO person_details (PersonTitleID, FirstName, LastName, DateOfBirth) VALUES (1, 'SUSAN', 'HAYMAN', '1988-05-01');
SET @last_id_in_person_details = LAST_INSERT_ID();
INSERT INTO passenger (PersonDetailsID, IsLeadPassenger) VALUES (@last_id_in_person_details, 1);
SET @last_id_in_passenger_details_2 = LAST_INSERT_ID();
INSERT INTO booking_passenger(PassengerID, BookingID) VALUES (@last_id_in_passenger_details_2, @last_id_in_booking);

INSERT INTO person_details (PersonTitleID, FirstName, LastName, DateOfBirth) VALUES (1, 'ELAINE', 'HAYMAN', '1999-01-22');
SET @last_id_in_person_details = LAST_INSERT_ID();
INSERT INTO passenger (PersonDetailsID, IsLeadPassenger) VALUES (@last_id_in_person_details, 0);
SET @last_id_in_passenger_details_3 = LAST_INSERT_ID();
INSERT INTO booking_passenger(PassengerID, BookingID) VALUES (@last_id_in_passenger_details_3, @last_id_in_booking);

INSERT INTO person_details (PersonTitleID, FirstName, LastName, DateOfBirth) VALUES (1, 'MARY', 'HAYMAN', '2000-01-02');
SET @last_id_in_person_details = LAST_INSERT_ID();
INSERT INTO passenger (PersonDetailsID, IsLeadPassenger) VALUES (@last_id_in_person_details, 0);
SET @last_id_in_passenger_details_4 = LAST_INSERT_ID();
INSERT INTO booking_passenger(PassengerID, BookingID) VALUES (@last_id_in_passenger_details_4, @last_id_in_booking);


-- booking customer details - holiday is booked on behalf of relative as a present [WORKING!]

INSERT INTO person_details (PersonTitleID, FirstName, LastName, DateOfBirth) VALUES (2, 'EILEEN', 'HAYMAN', '1962-01-09');
SET @last_id_in_person_details = LAST_INSERT_ID();

INSERT INTO address (BuildingNumber, BuildingName, AddressLine1, AddressLine2, City, Postcode, CountryID) 
VALUES (84, '', 'HADLEY AVENUE', '', 'Belfast', 'BT93 3FD', 5);
SET @last_id_in_address= LAST_INSERT_ID();

-- update customer table [WORKING!]

INSERT INTO customer (CustomerReference, PersonDetailsID, AddressID, CustomerEmailAddress, CustomerMobileNumber, CustomerHomeNumber, ResortEmergencyNumber, ResortEmergencyEmail)
VALUES ('UF93GHJX', @last_id_in_person_details, @last_id_in_address, 'HAYMANEILEEN@OUTLOOK.COM', '07897877324', '', '07834722633', 'HAYMANEILEEN@OUTLOOK.COM');
SET @last_id_in_customer_table = LAST_INSERT_ID();


-- insert customer_booking reference [TEST]

INSERT INTO customer_booking (CustomerID, BookingID) 
VALUES (@last_id_in_customer_table, @last_id_in_booking);


-- inserting room 1 (ID4 Double room)

SET @resort_room_1_id = 4;
SET @booking_test_date = '2023-06-01';
SET @booking_end_date = '2022-12-15';
SET @live_day_difference = (SELECT DATEDIFF (@booking_test_date, CURRENT_DATE));
SET @booking_day_difference = (SELECT DATEDIFF (@booking_end_date, @holiday_start_date));
SET @room_1_name = (SELECT HotelRoomName FROM resort_room WHERE ResortRoomID=@resort_room_1_id);

SELECT @booking_day_difference;

INSERT INTO booking_resort_room(BookingID, ResortRoomID, DateStayed) VALUES (@last_id_in_booking, @resort_room_1_id,@booking_test_date);
INSERT INTO resort_room_avaliability(PassengerID, ResortRoomID, DateStayed) VALUES (@last_id_in_passenger_details_1, @resort_room_1_id, @booking_test_date);
INSERT INTO resort_room_avaliability(PassengerID, ResortRoomID, DateStayed) VALUES (@last_id_in_passenger_details_2, @resort_room_1_id, @booking_test_date);
SET @percentage_increase_value_room = (SELECT MIN(PercentageIncrease) FROM price_adjustments WHERE DayThreshold<@live_day_difference);
SET @static_room_price_value = (SELECT PricePerNight FROM room_price WHERE ValidFrom<= @booking_test_date AND ValidUntil> @booking_test_date AND ResortRoomID=@resort_room_1_id);
SELECT @static_room_price_value;
SET @live_customer_price_room = TRUNCATE(@static_room_price_value + ((@static_room_price_value / 100) * @percentage_increase_value_room),2);
INSERT INTO booking_line_item(ItemName, ItemDescription, Price, BookingID) VALUES (@room_1_name,'',@live_customer_price_room, @last_id_in_booking);

-- day2

SET @booking_start_date = '2023-06-02';

INSERT INTO booking_resort_room(BookingID, ResortRoomID, DateStayed) VALUES (@last_id_in_booking, @resort_room_1_id,@booking_start_date);
INSERT INTO resort_room_avaliability(PassengerID, ResortRoomID, DateStayed) VALUES (@last_id_in_passenger_details_1, @resort_room_1_id, @booking_start_date);
INSERT INTO resort_room_avaliability(PassengerID, ResortRoomID, DateStayed) VALUES (@last_id_in_passenger_details_2, @resort_room_1_id, @booking_start_date);
SET @percentage_increase_value_room = (SELECT MIN(PercentageIncrease) FROM price_adjustments WHERE DayThreshold<@live_day_difference);
SET @static_room_price_value = (SELECT PricePerNight FROM room_price WHERE ValidFrom<= @booking_start_date AND ValidUntil> @booking_start_date AND ResortRoomID=@resort_room_1_id);
SELECT @static_room_price_value;
SET @live_customer_price_room = TRUNCATE(@static_room_price_value + ((@static_room_price_value / 100) * @percentage_increase_value_room),2);
INSERT INTO booking_line_item(ItemName, ItemDescription, Price, BookingID) VALUES (@room_1_name,'',@live_customer_price_room, @last_id_in_booking);

-- day3

SET @booking_start_date = '2023-06-03';

INSERT INTO booking_resort_room(BookingID, ResortRoomID, DateStayed) VALUES (@last_id_in_booking, @resort_room_1_id,@booking_start_date);
INSERT INTO resort_room_avaliability(PassengerID, ResortRoomID, DateStayed) VALUES (@last_id_in_passenger_details_1, @resort_room_1_id, @booking_start_date);
INSERT INTO resort_room_avaliability(PassengerID, ResortRoomID, DateStayed) VALUES (@last_id_in_passenger_details_2, @resort_room_1_id, @booking_start_date);
SET @percentage_increase_value_room = (SELECT MIN(PercentageIncrease) FROM price_adjustments WHERE DayThreshold<@live_day_difference);
SET @static_room_price_value = (SELECT PricePerNight FROM room_price WHERE ValidFrom<= @booking_start_date AND ValidUntil> @booking_start_date AND ResortRoomID=@resort_room_1_id);
SELECT @static_room_price_value;
SET @live_customer_price_room = TRUNCATE(@static_room_price_value + ((@static_room_price_value / 100) * @percentage_increase_value_room),2);
INSERT INTO booking_line_item(ItemName, ItemDescription, Price, BookingID) VALUES (@room_1_name,'',@live_customer_price_room, @last_id_in_booking);


-- room 2
SET @resort_room_2_id = 1;

SET @booking_start_date = '2023-06-01';
SET @room_2_name = (SELECT HotelRoomName FROM resort_room WHERE ResortRoomID=@resort_room_2_id);


INSERT INTO booking_resort_room(BookingID, ResortRoomID, DateStayed) VALUES (@last_id_in_booking, @resort_room_2_id,@booking_test_date);
INSERT INTO resort_room_avaliability(PassengerID, ResortRoomID, DateStayed) VALUES (@last_id_in_passenger_details_3, @resort_room_2_id, @booking_test_date);
INSERT INTO resort_room_avaliability(PassengerID, ResortRoomID, DateStayed) VALUES (@last_id_in_passenger_details_4, @resort_room_2_id, @booking_test_date);
SET @percentage_increase_value_room = (SELECT MIN(PercentageIncrease) FROM price_adjustments WHERE DayThreshold<@live_day_difference);
SET @static_room_price_value = (SELECT PricePerNight FROM room_price WHERE ValidFrom<= @booking_start_date AND ValidUntil> @booking_start_date AND ResortRoomID=@resort_room_2_id);
SELECT @static_room_price_value;
SET @live_customer_price_room = TRUNCATE(@static_room_price_value + ((@static_room_price_value / 100) * @percentage_increase_value_room),2);
INSERT INTO booking_line_item(ItemName, ItemDescription, Price, BookingID) VALUES (@room_2_name,'',@live_customer_price_room, @last_id_in_booking);

-- day2

SET @booking_start_date = '2023-06-02';

INSERT INTO booking_resort_room(BookingID, ResortRoomID, DateStayed) VALUES (@last_id_in_booking, @resort_room_2_id,@booking_start_date);
INSERT INTO resort_room_avaliability(PassengerID, ResortRoomID, DateStayed) VALUES (@last_id_in_passenger_details_3, @resort_room_2_id, @booking_start_date);
INSERT INTO resort_room_avaliability(PassengerID, ResortRoomID, DateStayed) VALUES (@last_id_in_passenger_details_4, @resort_room_2_id, @booking_start_date);
SET @percentage_increase_value_room = (SELECT MIN(PercentageIncrease) FROM price_adjustments WHERE DayThreshold<@live_day_difference);
SET @static_room_price_value = (SELECT PricePerNight FROM room_price WHERE ValidFrom<= @booking_start_date AND ValidUntil> @booking_start_date AND ResortRoomID=@resort_room_2_id);
SELECT @static_room_price_value;
SET @live_customer_price_room = TRUNCATE(@static_room_price_value + ((@static_room_price_value / 100) * @percentage_increase_value_room),2);
INSERT INTO booking_line_item(ItemName, ItemDescription, Price, BookingID) VALUES (@room_2_name,'',@live_customer_price_room, @last_id_in_booking);

-- day3

SET @booking_start_date = '2023-06-03';

INSERT INTO booking_resort_room(BookingID, ResortRoomID, DateStayed) VALUES (@last_id_in_booking, @resort_room_2_id,@booking_start_date);
INSERT INTO resort_room_avaliability(PassengerID, ResortRoomID, DateStayed) VALUES (@last_id_in_passenger_details_3, @resort_room_2_id, @booking_start_date);
INSERT INTO resort_room_avaliability(PassengerID, ResortRoomID, DateStayed) VALUES (@last_id_in_passenger_details_4, @resort_room_2_id, @booking_start_date);
SET @percentage_increase_value_room = (SELECT MIN(PercentageIncrease) FROM price_adjustments WHERE DayThreshold<@live_day_difference);
SET @static_room_price_value = (SELECT PricePerNight FROM room_price WHERE ValidFrom<= @booking_start_date AND ValidUntil> @booking_start_date AND ResortRoomID=@resort_room_2_id);
SELECT @static_room_price_value;
SET @live_customer_price_room = TRUNCATE(@static_room_price_value + ((@static_room_price_value / 100) * @percentage_increase_value_room),2);
INSERT INTO booking_line_item(ItemName, ItemDescription, Price, BookingID) VALUES (@room_2_name,'',@live_customer_price_room, @last_id_in_booking);

-- WORKING UP TO HERE 

-- inserting which flights have been selected (+inserting this info into booking line item)

-- outbound flight 

-- passenger 1
SET @booking_end_date = '2023-06-01';
SET @flight_price_id = 8;
SET @flight_id = 2;
SET @flight_outbound_name = (SELECT FlightName FROM flight WHERE FlightID=@flight_id);

INSERT INTO booking_flight(BookingID, FlightID) VALUES (@last_id_in_booking, @flight_id);
SET @live_day_difference = (SELECT DATEDIFF (@holiday_start_date, CURRENT_DATE));
SET @percentage_increase_value_flight = (SELECT MIN(PercentageIncrease) FROM price_adjustments WHERE DayThreshold<@live_day_difference);
SELECT @percentage_increase_value_flight;
SET @static_flight_price_value = (SELECT FlightPrice FROM flight_price WHERE FlightDepartDate = @holiday_start_date AND FlightPriceID = @flight_price_id);
SELECT @static_flight_price_value;
SET @live_customer_price_flight = TRUNCATE(@static_flight_price_value + ((@static_flight_price_value / 100) * @percentage_increase_value_flight),2);
INSERT INTO booking_line_item(ItemName, ItemDescription, Price, BookingID) VALUES (@flight_outbound_name,'',@live_customer_price_flight,@last_id_in_booking);

-- passenger 2
INSERT INTO booking_flight(BookingID, FlightID) VALUES (@last_id_in_booking, @flight_id);
SET @live_day_difference = (SELECT DATEDIFF (@holiday_start_date, CURRENT_DATE));
SET @percentage_increase_value_flight = (SELECT MIN(PercentageIncrease) FROM price_adjustments WHERE DayThreshold<@live_day_difference);
SELECT @percentage_increase_value_flight;
SET @static_flight_price_value = (SELECT FlightPrice FROM flight_price WHERE FlightDepartDate = @holiday_start_date AND FlightPriceID = @flight_price_id);
SELECT @static_flight_price_value;
SET @live_customer_price_flight = TRUNCATE(@static_flight_price_value + ((@static_flight_price_value / 100) * @percentage_increase_value_flight),2);
INSERT INTO booking_line_item(ItemName, ItemDescription, Price, BookingID) VALUES (@flight_outbound_name,'',@live_customer_price_flight,@last_id_in_booking);

-- passenger 3
INSERT INTO booking_flight(BookingID, FlightID) VALUES (@last_id_in_booking, @flight_id);
SET @live_day_difference = (SELECT DATEDIFF (@holiday_start_date, CURRENT_DATE));
SET @percentage_increase_value_flight = (SELECT MIN(PercentageIncrease) FROM price_adjustments WHERE DayThreshold<@live_day_difference);
SELECT @percentage_increase_value_flight;
SET @static_flight_price_value = (SELECT FlightPrice FROM flight_price WHERE FlightDepartDate = @holiday_start_date AND FlightPriceID = @flight_price_id);
SELECT @static_flight_price_value;
SET @live_customer_price_flight = TRUNCATE(@static_flight_price_value + ((@static_flight_price_value / 100) * @percentage_increase_value_flight),2);
INSERT INTO booking_line_item(ItemName, ItemDescription, Price, BookingID) VALUES (@flight_outbound_name,'',@live_customer_price_flight,@last_id_in_booking);

-- passenger 4
INSERT INTO booking_flight(BookingID, FlightID) VALUES (@last_id_in_booking, @flight_id);
SET @live_day_difference = (SELECT DATEDIFF (@holiday_start_date, CURRENT_DATE));
SET @percentage_increase_value_flight = (SELECT MIN(PercentageIncrease) FROM price_adjustments WHERE DayThreshold<@live_day_difference);
SELECT @percentage_increase_value_flight;
SET @static_flight_price_value = (SELECT FlightPrice FROM flight_price WHERE FlightDepartDate = @holiday_start_date AND FlightPriceID = @flight_price_id);
SELECT @static_flight_price_value;
SET @live_customer_price_flight = TRUNCATE(@static_flight_price_value + ((@static_flight_price_value / 100) * @percentage_increase_value_flight),2);
INSERT INTO booking_line_item(ItemName, ItemDescription, Price, BookingID) VALUES (@flight_outbound_name,'',@live_customer_price_flight,@last_id_in_booking);



-- inbound flight

-- passenger 1
SET @booking_start_date = '2023-06-15';
SET @flight_price_id = 9;
SET @flight_2_id=3;
SET @flight_outbound_name = (SELECT FlightName FROM flight WHERE FlightID=@flight_2_id);

INSERT INTO booking_flight(BookingID, FlightID) VALUES (@last_id_in_booking, @flight_2_id);
SET @live_day_difference = (SELECT DATEDIFF (@booking_start_date, CURRENT_DATE));
SET @percentage_increase_value_flight = (SELECT MIN(PercentageIncrease) FROM price_adjustments WHERE DayThreshold<@live_day_difference);
SELECT @percentage_increase_value_flight;
SET @static_flight_price_value = (SELECT FlightPrice FROM flight_price WHERE FlightDepartDate = @booking_start_date AND FlightPriceID = @flight_price_id);
SELECT @static_flight_price_value;
SET @live_customer_price_flight = TRUNCATE(@static_flight_price_value + ((@static_flight_price_value / 100) * @percentage_increase_value_flight),2);
SET @customer_flight_booking_total = @live_customer_price_flight;
INSERT INTO booking_line_item(ItemName, ItemDescription, Price, BookingID) VALUES (@flight_outbound_name,'',@live_customer_price_flight,@last_id_in_booking);

-- passenger 2
INSERT INTO booking_flight(BookingID, FlightID) VALUES (@last_id_in_booking, @flight_2_id);
SET @live_day_difference = (SELECT DATEDIFF (@booking_start_date, CURRENT_DATE));
SET @percentage_increase_value_flight = (SELECT MIN(PercentageIncrease) FROM price_adjustments WHERE DayThreshold<@live_day_difference);
SELECT @percentage_increase_value_flight;
SET @static_flight_price_value = (SELECT FlightPrice FROM flight_price WHERE FlightDepartDate = @booking_start_date AND FlightPriceID = @flight_price_id);
SELECT @static_flight_price_value;
SET @live_customer_price_flight = TRUNCATE(@static_flight_price_value + ((@static_flight_price_value / 100) * @percentage_increase_value_flight),2);
SET @customer_flight_booking_total = @live_customer_price_flight;
INSERT INTO booking_line_item(ItemName, ItemDescription, Price, BookingID) VALUES (@flight_outbound_name,'',@live_customer_price_flight,@last_id_in_booking);

-- passenger 3
INSERT INTO booking_flight(BookingID, FlightID) VALUES (@last_id_in_booking, @flight_2_id);
SET @live_day_difference = (SELECT DATEDIFF (@booking_start_date, CURRENT_DATE));
SET @percentage_increase_value_flight = (SELECT MIN(PercentageIncrease) FROM price_adjustments WHERE DayThreshold<@live_day_difference);
SELECT @percentage_increase_value_flight;
SET @static_flight_price_value = (SELECT FlightPrice FROM flight_price WHERE FlightDepartDate = @booking_start_date AND FlightPriceID = @flight_price_id);
SELECT @static_flight_price_value;
SET @live_customer_price_flight = TRUNCATE(@static_flight_price_value + ((@static_flight_price_value / 100) * @percentage_increase_value_flight),2);
SET @customer_flight_booking_total = @live_customer_price_flight;
INSERT INTO booking_line_item(ItemName, ItemDescription, Price, BookingID) VALUES (@flight_outbound_name,'',@live_customer_price_flight,@last_id_in_booking);

-- passenger 4
INSERT INTO booking_flight(BookingID, FlightID) VALUES (@last_id_in_booking, @flight_2_id);
SET @live_day_difference = (SELECT DATEDIFF (@booking_start_date, CURRENT_DATE));
SET @percentage_increase_value_flight = (SELECT MIN(PercentageIncrease) FROM price_adjustments WHERE DayThreshold<@live_day_difference);
SELECT @percentage_increase_value_flight;
SET @static_flight_price_value = (SELECT FlightPrice FROM flight_price WHERE FlightDepartDate = @booking_start_date AND FlightPriceID = @flight_price_id);
SELECT @static_flight_price_value;
SET @live_customer_price_flight = TRUNCATE(@static_flight_price_value + ((@static_flight_price_value / 100) * @percentage_increase_value_flight),2);
SET @customer_flight_booking_total = @live_customer_price_flight;
INSERT INTO booking_line_item(ItemName, ItemDescription, Price, BookingID) VALUES (@flight_outbound_name,'',@live_customer_price_flight,@last_id_in_booking);

SET @booking_line_item_total= (SELECT SUM(Price) FROM booking_line_item WHERE BookingID=@last_id_in_booking);

UPDATE booking
SET Total = @booking_line_item_total
WHERE BookingID=@last_id_in_booking;



-- payment details 

SET @CardHolderName = 'MRS EILEEN HAYMAN';
SET @CardLongNumber = '1234 5678 1234 5678'; 
SET @CardValidFrom= '2019-10-08';
SET @CardValidUntil= '2028-10-08';
SET @PaymentProviderID = '1';


/* A very simple secret password */
SET @secretPasssword = 'VeryEasyAndNotSecurePassword';


/* Start (very) basic data encryption */
SET @CardLongNumber = AES_ENCRYPT(@CardLongNumber,@secretPasssword);


/* Insert the record with the encrypted data */
INSERT INTO payment_details (PaymentDetailsID, CardHolderName, CardLongNumber, CardValidFrom, CardValidUntil, PaymentProviderID, CustomerID) 
VALUES (NULL, @CardHolderName, @CardLongNumber, @CardValidFrom, @CardValidUntil, @PaymentProviderID, @last_id_in_customer_table);

SET @customer_price_paid= 800;

UPDATE booking
SET AmountPaid = @customer_price_paid
WHERE BookingID=@last_id_in_booking;

UPDATE booking
SET RemainderToPay = @booking_line_item_total-@customer_price_paid
WHERE BookingID=@last_id_in_booking;


COMMIT;

