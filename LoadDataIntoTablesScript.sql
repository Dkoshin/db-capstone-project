#Booking table load
INSERT INTO `LittleLemondb`.`Bookings` (`BookingTime`, `Date`, `Table_number`)
VALUES
    ('12:30:00', '2023-05-11', 'Table 1'),
    ('14:00:00', '2023-05-11', 'Table 3'),
    ('18:30:00', '2023-05-12', 'Table 2'),
    ('20:00:00', '2023-05-12', 'Table 4');

#staff table load
INSERT INTO `LittleLemondb`.`Staff` (`Role`, `Name`, `Salary`)
VALUES
    ('Manager', 'John Smith', '50000'),
    ('Chef', 'Emily Johnson', '40000'),
    ('Waiter', 'Michael Lee', '25000'),
    ('Bartender', 'Sarah Davis', '30000');

#sides table load
INSERT INTO `LittleLemondb`.`Sides` (`SideID`, `Name`)
VALUES
    (1, 'Fries'),
    (2, 'Onion Rings'),
    (3, 'Mashed Potatoes'),
    (4, 'Sweet Potato Fries');
#beverage table load
INSERT INTO Littlelemondb.Beverage (BeverageID, Name)
VALUES
    (1, 'Coca-Cola'),
    (2, 'Sprite'),
    (3, 'Fanta'),
    (4, 'Water'),
    (5, 'Orange Juice');
    
INSERT INTO `littlelemondb`.`CustomerDetails` (`CustomerFirstName`, `CustomerLastName`, `Email`)
VALUES ('Jamal', 'Smith', 'jamalsmith@example.com'),
('Jane', 'Michael', 'janemichael@example.com'),
('Bob', 'Smith', 'bobsmith@example.com'),
('Omar', 'Khalil', 'omarkhalil@example.com'),
('Li', 'Wei', 'liwei@example.com');

#menus table load
INSERT INTO `littlelemondb`.`Menus` (`MenuID`,`SideID`, `BeverageID`, `Cuisine`, `MenuType`, `Cost`)
VALUES
    (1,1, 1, 'American', 'Lunch', '12.99'),
    (2,2, 2, 'Mexican', 'Dinner', '15.99'),
    (3,2, 3, 'Italian', 'Dinner', '18.99'),
    (4,1, 4, 'Japanese', 'Lunch', '14.99');

#OrderDeliverStatus table load
INSERT INTO `LittleLemondb`.`OrderDeliveryStatus` (`DeliveryDate`, `Status`)
VALUES
    ('2023-05-01', 'Delivered'),
    ('2023-05-02', 'In Transit'),
    ('2023-05-03', 'Out for Delivery'),
    ('2023-05-04', 'Cancelled');

#Orders  table load
INSERT INTO `LittleLemondb`.`Orders` (`OrderDate`, `Quantity`, `Cost`, `BookingID`, `StaffID`, `MenuID`, `CustomerID`, `OrderStatusID`)
VALUES
('2023-05-10', 2, 20.99, 1, 1, 1, 1, 1),
('2023-05-09', 1, 7.99, 1, 1, 1, 1, 1),
('2023-05-08', 4, 49.99, 1, 1, 1, 1, 1),
('2023-05-07', 3, 29.99, 1, 1, 1, 1, 1),
('2023-05-06', 2, 19.99, 1, 1, 1, 1, 1);
