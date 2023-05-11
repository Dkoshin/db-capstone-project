USE littlelemondb;
DELIMITER //
CREATE PROCEDURE AddValidBooking(DateInput date,TableInput int)
BEGIN
	START TRANSACTION;
	set @statement := concat('Table',TableInput, ' is already booked') ;
	set @confirmation = concat('Table',TableInput,' is booked on ',dateinput);
	set @result := EXISTS(SELECT * FROM littlelemondb.bookings WHERE  `Date` = DateInput =`Table_number` = TableInput );
	IF @result = 1 then 
		ROLLBACK;
		SELECT @statement AS message;
	else 
		insert into booking (Date,Table_number)
		values (DateInput,TableInput); 
        commit;
        SELECT @confirmation as Message;
	end if;
end//
DELIMITER ;



