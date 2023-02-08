


-- 1 querying the database agains the users search (2 rooms, 4 passengers, booking start)


-- number of passengers per room
SET @number_of_passengers_per_room = 2;

-- area of dubrovnik selected
SET @area_selected= (SELECT AreaID FROM Area
WHERE AreaName='Dubrovnik');

SET @holiday_start_date = '2023-06-03';
SET @holiday_end_date = '2023-06-18';

-- resort room
SELECT * FROM resort_room 
INNER JOIN resort
ON resort_room.ResortID=resort.ResortID
INNER JOIN room_type
ON resort_room.RoomTypeID=room_type.RoomTypeID
WHERE resort_room.ResortRoomID NOT IN(
	SELECT booking_resort_room.ResortRoomID
	FROM booking_resort_room 
	WHERE booking_resort_room.CheckInDate <= @holiday_start_date AND CheckOutDate> @holiday_end_date) AND (AreaID IN (
		SELECT AreaID FROM resort
		WHERE  AreaID =@area_selected)) 
	AND (room_type.RoomTypeID IN ( SELECT RoomTypeID FROM room_type
		WHERE MaxSleep>=@number_of_passengers_per_room))
	ORDER by resort_room.ResortRoomID ASC;


-- flights 
SELECT * FROM flight_price AS flight_price_on_date
WHERE (FlightDepartDate) IN (SELECT FlightDepartDate FROM flight WHERE FlightDepartDate=@holiday_start_date) AND (AreaID IN (SELECT AreaID FROM area WHERE AreaID=9)); 

SELECT * FROM flight_price AS flight_price_on_date
WHERE (FlightDepartDate) IN (SELECT FlightDepartDate FROM flight WHERE FlightDepartDate=@holiday_end_date AND FlightID=3); 




-- 2 find room prices for selceted room 

SET @booking_start_date = '2023-06-03';
SET @booking_end_date = '2023-06-17';
SET @custom_current_date = '2023-05-29';
SET @resort_room_id = 4;

SET @live_day_difference = (SELECT DATEDIFF (@booking_start_date, @custom_current_date));
SET @booking_day_difference = (SELECT DATEDIFF (@booking_end_date, @booking_start_date));

SELECT @booking_day_difference;

SET @percentage_increase_value_room = (SELECT MIN(PercentageIncrease) FROM price_adjustments WHERE DayThreshold<@live_day_difference);

SELECT @percentage_increase_value_room;

SET @static_room_price_value = (SELECT PricePerNight FROM room_price WHERE ValidFrom<= @booking_start_date AND ValidUntil> @booking_start_date AND ResortRoomID=@resort_room_id);

SELECT @static_room_price_value;

SET @live_customer_price_room = TRUNCATE(@static_room_price_value + ((@static_room_price_value / 100) * @percentage_increase_value_room),2);

SELECT @live_customer_price_room;


-- 3 return alternative flight listings 

-- FlightID that the user has selected (Belfast International - Dubrovnik Aiport)
SET @user_selected_flight_departure = 2;
-- PriceID that the user has selected (includes time and date of flight)
SET @user_current_flight = 14;
-- the date the user has entered that they intend to fly on 
SET @user_flight_depart_date = '2023-06-05';
-- the price of the original flight and time suggested by Jet2
SET @user_original_price = 179.98;

SELECT * 
FROM flight_price 
INNER JOIN flight
ON flight_price.FlightID=flight.FlightID
WHERE (flight_price.FlightDepartDate IN (
	SELECT FlightDepartDate FROM flight_price
	WHERE FlightDepartDate =@user_flight_depart_date)) AND (flight_price.FlightID IN (
	SELECT FlightID FROM flight_price
	WHERE FlightID = @user_selected_flight_departure)) AND (flight_price.FlightPriceID IN (
	SELECT FlightPriceID FROM flight_price
	WHERE FlightPriceID != @user_current_flight));




-- 3 get FlightPrice IDs from all flights returned

SET @flight_price_id = 13;
SET @live_day_difference = (SELECT DATEDIFF (@user_flight_depart_date, CURRENT_DATE));
SET @percentage_increase_value_flight = (SELECT MIN(PercentageIncrease) FROM price_adjustments WHERE DayThreshold<@live_day_difference);
SELECT @percentage_increase_value_flight;
SET @static_flight_price_value = (SELECT FlightPrice FROM flight_price WHERE FlightDepartDate = @user_flight_depart_date AND FlightPriceID = @flight_price_id);
SELECT @static_flight_price_value;
SET @live_customer_price_flight = TRUNCATE(@static_flight_price_value + ((@static_flight_price_value / 100) * @percentage_increase_value_flight),2);
SET @customer_flight_booking_total = @live_customer_price_flight;
SELECT TRUNCATE(@user_original_price-@customer_flight_booking_total,2) AS price_ammendment;

SET @flight_price_id = 15;
SET @live_day_difference = (SELECT DATEDIFF (@user_flight_depart_date, CURRENT_DATE));
SET @percentage_increase_value_flight = (SELECT MIN(PercentageIncrease) FROM price_adjustments WHERE DayThreshold<@live_day_difference);
SELECT @percentage_increase_value_flight;
SET @static_flight_price_value = (SELECT FlightPrice FROM flight_price WHERE FlightDepartDate = @user_flight_depart_date AND FlightPriceID = @flight_price_id);
SELECT @static_flight_price_value;
SET @live_customer_price_flight = TRUNCATE(@static_flight_price_value + ((@static_flight_price_value / 100) * @percentage_increase_value_flight),2);
SET @customer_flight_booking_total = @live_customer_price_flight;
SELECT TRUNCATE(@user_original_price-@customer_flight_booking_total,2) AS price_ammendment;

SET @flight_price_id = 16;
SET @live_day_difference = (SELECT DATEDIFF (@user_flight_depart_date, CURRENT_DATE));
SET @percentage_increase_value_flight = (SELECT MIN(PercentageIncrease) FROM price_adjustments WHERE DayThreshold<@live_day_difference);
SELECT @percentage_increase_value_flight;
SET @static_flight_price_value = (SELECT FlightPrice FROM flight_price WHERE FlightDepartDate = @user_flight_depart_date AND FlightPriceID = @flight_price_id);
SELECT @static_flight_price_value;
SET @live_customer_price_flight = TRUNCATE(@static_flight_price_value + ((@static_flight_price_value / 100) * @percentage_increase_value_flight),2);
SET @customer_flight_booking_total = @live_customer_price_flight;
SELECT TRUNCATE(@user_original_price-@customer_flight_booking_total,2) AS price_ammendment;





