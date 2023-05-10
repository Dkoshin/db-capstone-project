USE LittleLemondb;
DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN
	SELECT Max(quantity) as Max_Quanity_in_Order
	FROM Orders;
END//
DELIMITER ;

call GetMaxQuantity();

