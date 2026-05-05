--drop tables

drop table if exists allergy cascade;
drop table if exists student cascade;
drop table if exists rating cascade;
drop table if exists payment cascade;
drop table if exists item_allergen cascade;
drop table if exists menu_item cascade;
drop table if exists menu cascade;
drop table if exists cuisine cascade;
drop table if exists nutrition cascade;
drop table if exists order_item cascade;
drop table if exists meal_plan cascade;
drop table if exists orders cascade;
drop table if exists event cascade;
drop table if exists restaurant cascade;
drop table if exists seating cascade;
drop table if exists employee cascade;
drop table if exists student_nutrition cascade;
drop table if exists delivery;
--create tables

--student

create table student(
student_id VARCHAR (100) primary key,
student_name CHAR (150),
student_email VARCHAR (150),
student_phone VARCHAR (100)
);

--rating

create table rating (
rating_id INT,
student_id VARCHAR (100),
number_of_stars INT,
comments VARCHAR (500),
primary key (rating_id, student_id),
foreign key (student_id) references student(student_id)
);

--Allergy

create table allergy (
allergy_id VARCHAR (150),
student_id VARCHAR (150),
allergen VARCHAR (300),
primary key (allergy_id, student_id),
foreign key (student_id) references student(student_id)
);


--payment

create table payment(
payment_id VARCHAR (100),
student_id VARCHAR (100),
payment_time TIME,
amount MONEY,
payment_method_type VARCHAR (150),
primary key (payment_id, student_id),
foreign key (student_id) references student(student_id)
);

--cuisine

create table cuisine (
cuisine_id VARCHAR (250) primary key,
cuisine_name VARCHAR (200),
cuisine_description VARCHAR (500))
;

--menu

create table menu(
menu_id VARCHAR (250),
cuisine_id VARCHAR (100),
menu_name VARCHAR (200),
menu_date DATE,
primary key (menu_id, cuisine_id),
foreign key (cuisine_id) references cuisine(cuisine_id))
;

alter table menu
add constraint unique_menu_id unique (menu_id);

--menu_item
create table menu_item(
item_id VARCHAR (250),
menu_id VARCHAR (250),
item_name VARCHAR (300),
health_score INT,
quantity_instock INT,
primary key (item_id, menu_id),
foreign key (menu_id) references menu(menu_id))
;

--item_allergen

alter table allergy 
add constraint unique_allergy_id unique (allergy_id);

alter table menu_item
add constraint unique_item_id unique (item_id);

create table item_allergen(
allergy_id VARCHAR (100),
item_id VARCHAR (200),
allergy_name VARCHAR (250),
primary key (allergy_id, item_id),
foreign key (allergy_id) references allergy(allergy_id),
foreign key (item_id) references menu_item(item_id)
);

--nutrition

create table nutrition (
nutrition_id VARCHAR (100),
item_id VARCHAR (100),
calories INT,
protein INT,
iron INT,
primary key (nutrition_id, item_id),
foreign key (item_id) references menu_item(item_id))
;

--restaurant

create table restaurant (
restaurant_id VARCHAR (100) primary key,
restaurant_name VARCHAR (300),
restaurant_location VARCHAR (200),
lease_start_date DATE,
hours time);

--orders

create table orders(
restaurant_id VARCHAR (100),
order_id VARCHAR (100),
order_date DATE,
order_type VARCHAR (150),
primary key (restaurant_id, order_id),
foreign key (restaurant_id) references restaurant(restaurant_id));

--order_item

alter table orders
add constraint unique_order_id unique (order_id);


create table order_item (
order_item_id VARCHAR (100),
order_id VARCHAR (100),
item_id VARCHAR (100),
primary key (order_item_id, order_id, item_id),
foreign key (order_id) references orders(order_id),
foreign key (item_id) references menu_item(item_id))
;

--meal_plan

alter table payment
add constraint unique_payment_id unique (payment_id);

create table meal_plan (
meal_plan_id VARCHAR (100),
plan_name VARCHAR (150),
plan_start_date DATE,
plan_expiration_date DATE,
payment_id VARCHAR (100),
primary key (meal_plan_id, payment_id),
foreign key (payment_id) references payment(payment_id));


--event

alter table restaurant 
add constraint unique_restaurant_it unique (restaurant_id);

create table event (
event_id VARCHAR (100),
restaurant_id VARCHAR (100),
event_name VARCHAR (300),
event_date DATE,
primary key (event_id, restaurant_id),
foreign key (restaurant_id) references restaurant(restaurant_id));


--seating

create table seating (
table_number int,
restaurant_id VARCHAR (100),
seating_capacity INT,
primary key (table_number, restaurant_id),
foreign key (restaurant_id) references restaurant(restaurant_id))
;

--employee
create table employee (
employee_id VARCHAR(100),
restaurant_id VARCHAR(100),
employee_name CHAR(200),
employee_role VARCHAR(200),
primary key (employee_id, restaurant_id),
foreign key (restaurant_id) references restaurant(restaurant_id)
);

--delivery 
create table delivery (
delivery_id INT primary key,
order_id VARCHAR,
delivery_building INT,
delivery_date DATE,
foreign key (order_id) references orders(order_id))
;

--student nutrition
alter table nutrition 
add constraint unique_nutrition_id unique (nutrition_id);

create table student_nutrition(
student_nutrition_id INT primary key,
student_id VARCHAR,
nutrition_id VARCHAR,
quantity INT,
foreign key (student_id) references student(student_id),
foreign key (nutrition_id) references nutrition(nutrition_id))
;

--insert values 
INSERT INTO student (student_id, student_name, student_email, student_phone) VALUES
('S0001', 'Alice Johnson', 'alice.johnson@example.com', '555-1234'),
('S0002', 'Bob Smith', 'bob.smith@example.com', '555-2345'),
('S0003', 'Catherine Lee', 'catherine.lee@example.com', '555-3456'),
('S0004', 'David White', 'david.white@example.com', '555-4567'),
('S0005', 'Emma Brown', 'emma.brown@example.com', '555-5678'),
('S0006', 'Frank Wilson', 'frank.wilson@example.com', '555-6789'),
('S0007', 'Grace Davis', 'grace.davis@example.com', '555-7890'),
('S0008', 'Henry Clark', 'henry.clark@example.com', '555-8901'),
('S0009', 'Ivy Martin', 'ivy.martin@example.com', '555-9012'),
('S0010', 'Jackie Thompson', 'jackie.thompson@example.com', '555-0123'),
('S0011', 'Kyle Evans', 'kyle.evans@example.com', '555-1235'),
('S0012', 'Lily Harris', 'lily.harris@example.com', '555-2346'),
('S0013', 'Megan Carter', 'megan.carter@example.com', '555-3457'),
('S0014', 'Nathaniel Scott', 'nathaniel.scott@example.com', '555-4568'),
('S0015', 'Olivia Roberts', 'olivia.roberts@example.com', '555-5679'),
('S0016', 'Paul Green', 'paul.green@example.com', '555-6780'),
('S0017', 'Quincy Adams', 'quincy.adams@example.com', '555-7891'),
('S0018', 'Rita Collins', 'rita.collins@example.com', '555-8902'),
('S0019', 'Steve Walker', 'steve.walker@example.com', '555-9013'),
('S0020', 'Tina Perez', 'tina.perez@example.com', '555-0124'),
('S0021', 'Ursula King', 'ursula.king@example.com', '555-1236'),
('S0022', 'Victor Moore', 'victor.moore@example.com', '555-2347'),
('S0023', 'Wendy Young', 'wendy.young@example.com', '555-3458'),
('S0024', 'Xander Gray', 'xander.gray@example.com', '555-4569'),
('S0025', 'Yvonne Bell', 'yvonne.bell@example.com', '555-5670'),
('S0026', 'Zachary Miller', 'zachary.miller@example.com', '555-6781'),
('S0027', 'Aaron Davis', 'aaron.davis@example.com', '555-7892'),
('S0028', 'Bethany Taylor', 'bethany.taylor@example.com', '555-8903'),
('S0029', 'Caleb Anderson', 'caleb.anderson@example.com', '555-9014'),
('S0030', 'Debbie Mitchell', 'debbie.mitchell@example.com', '555-0125'),
('S0031', 'Ethan Carter', 'ethan.carter@example.com', '555-1237'),
('S0032', 'Fiona Stewart', 'fiona.stewart@example.com', '555-2348'),
('S0033', 'George Harris', 'george.harris@example.com', '555-3459'),
('S0034', 'Holly Williams', 'holly.williams@example.com', '555-4560'),
('S0035', 'Ian Lee', 'ian.lee@example.com', '555-5671'),
('S0036', 'Jack Peters', 'jack.peters@example.com', '555-6782'),
('S0037', 'Karen Robinson', 'karen.robinson@example.com', '555-7893'),
('S0038', 'Laura Thompson', 'laura.thompson@example.com', '555-8904'),
('S0039', 'Michael White', 'michael.white@example.com', '555-9015'),
('S0040', 'Nina Clark', 'nina.clark@example.com', '555-0126'),
('S0041', 'Olga Scott', 'olga.scott@example.com', '555-1238'),
('S0042', 'Paul Foster', 'paul.foster@example.com', '555-2349'),
('S0043', 'Quinn Edwards', 'quinn.edwards@example.com', '555-3450'),
('S0044', 'Rachel Lewis', 'rachel.lewis@example.com', '555-4561'),
('S0045', 'Sam Miller', 'sam.miller@example.com', '555-5672'),
('S0046', 'Timothy Harris', 'timothy.harris@example.com', '555-6783'),
('S0047', 'Ursula Perez', 'ursula.perez@example.com', '555-7894'),
('S0048', 'Vince Gray', 'vince.gray@example.com', '555-8905'),
('S0049', 'Wanda Johnson', 'wanda.johnson@example.com', '555-9016'),
('S0050', 'Xander Roberts', 'xander.roberts@example.com', '555-0127');

INSERT INTO rating (rating_id, student_id, number_of_stars, comments)
VALUES
(1, 'S0001', 5, 'Great meal! Loved the variety and taste.'),
(2, 'S0002', 4, 'Good food, but could be a bit more flavorful.'),
(3, 'S0003', 3, 'Average experience. The food was okay, but nothing special.'),
(4, 'S0004', 2, 'Not great. The food was cold and bland.'),
(5, 'S0005', 1, 'Terrible meal, I couldn’t finish it.'),
(6, 'S0006', 5, 'Fantastic food! Everything was cooked to perfection.'),
(7, 'S0007', 4, 'Good variety and taste, but the portion sizes could be larger.'),
(8, 'S0008', 3, 'Okay, but the food was a bit overcooked.'),
(9, 'S0009', 5, 'Best meal I’ve had at the campus dining service!'),
(10, 'S0010', 2, 'Not enough options for vegetarians.'),
(11, 'S0011', 4, 'Pretty good, but the dessert could be improved.'),
(12, 'S0012', 3, 'Decent. Could be fresher.'),
(13, 'S0013', 1, 'Very disappointing, I expected more.'),
(14, 'S0014', 5, 'The staff was friendly, and the food was excellent.'),
(15, 'S0015', 4, 'Good food but the place could use more seating.'),
(16, 'S0016', 3, 'It’s okay, but not a fan of the seasoning.'),
(17, 'S0017', 2, 'Didn’t enjoy the meal at all. Wouldn’t recommend it.'),
(18, 'S0018', 5, 'Loved everything about the meal! Great quality.'),
(19, 'S0019', 4, 'Good experience, but I wish there were more gluten-free options.'),
(20, 'S0020', 3, 'Food was alright, but nothing extraordinary.'),
(21, 'S0021', 4, 'Delicious, but the lines are always too long.'),
(22, 'S0022', 2, 'Not up to expectations. The food was soggy.'),
(23, 'S0023', 5, 'Amazing food! The chefs are fantastic.'),
(24, 'S0024', 3, 'Okay, but I had better meals at other times.'),
(25, 'S0025', 1, 'Really bad experience. The meal was tasteless.'),
(26, 'S0026', 5, 'Great variety of options and everything was fresh.'),
(27, 'S0027', 4, 'Good, but I feel the service could be faster.'),
(28, 'S0028', 3, 'The food is fine, but not as great as I thought it would be.'),
(29, 'S0029', 5, 'Best meal I’ve had in weeks!'),
(30, 'S0030', 4, 'Everything was good, just a little too salty.'),
(31, 'S0031', 5, 'Absolutely amazing meal. The flavors were perfect.'),
(32, 'S0032', 3, 'The meal was decent but needed more seasoning.'),
(33, 'S0033', 2, 'Not very impressed. The food was dry.'),
(34, 'S0034', 4, 'Very good meal, I just wish the portions were bigger.'),
(35, 'S0035', 5, 'Everything was top-notch. I’ll definitely be back for more.'),
(36, 'S0036', 3, 'It was okay, but the food could have been served hotter.'),
(37, 'S0037', 4, 'Good, but the food could use more variety.'),
(38, 'S0038', 5, 'Fantastic experience. Highly recommend the pasta dish.'),
(39, 'S0039', 1, 'Worst dining experience ever. I couldn’t eat my meal.'),
(40, 'S0040', 2, 'Not good. The salad was wilted and unappealing.'),
(41, 'S0041', 4, 'Decent food. Could improve on dessert options.'),
(42, 'S0042', 5, 'Loved everything! Would recommend to anyone.'),
(43, 'S0043', 3, 'Food was fine, but the atmosphere was a bit off.'),
(44, 'S0044', 1, 'Very bad. The meal was overcooked and flavorless.'),
(45, 'S0045', 4, 'Nice meal, but the soup could use some improvement.'),
(46, 'S0046', 5, 'Excellent food and friendly service!'),
(47, 'S0047', 3, 'Okay meal, but I expected more variety.'),
(48, 'S0048', 2, 'Not very fresh, could be improved.'),
(49, 'S0049', 4, 'Good food, but the seating area could be more comfortable.'),
(50, 'S0050', 1, 'I couldn’t finish my meal. It was awful.')
;

select *
from rating r ;

INSERT INTO allergy (allergy_id, student_id, allergen)
VALUES
('A0001', 'S0001', 'Peanuts'),
('A0002', 'S0002', 'Gluten'),
('A0003', 'S0003', 'Dairy'),
('A0004', 'S0004', 'Eggs'),
('A0005', 'S0005', 'Shellfish'),
('A0006', 'S0006', 'Soy'),
('A0007', 'S0007', 'Wheat'),
('A0008', 'S0008', 'Nuts'),
('A0009', 'S0009', 'Milk'),
('A0010', 'S0010', 'Peanuts'),
('A0011', 'S0011', 'Shellfish'),
('A0012', 'S0012', 'Dairy'),
('A0013', 'S0013', 'Eggs'),
('A0014', 'S0014', 'Gluten'),
('A0015', 'S0015', 'Soy'),
('A0016', 'S0016', 'Wheat'),
('A0017', 'S0017', 'Tree Nuts'),
('A0018', 'S0018', 'Fish'),
('A0019', 'S0019', 'Dairy'),
('A0020', 'S0020', 'Peanuts'),
('A0021', 'S0021', 'Shellfish'),
('A0022', 'S0022', 'Gluten'),
('A0023', 'S0023', 'Eggs'),
('A0024', 'S0024', 'Milk'),
('A0025', 'S0025', 'Nuts'),
('A0026', 'S0026', 'Soy'),
('A0027', 'S0027', 'Gluten'),
('A0028', 'S0028', 'Wheat'),
('A0029', 'S0029', 'Peanuts'),
('A0030', 'S0030', 'Tree Nuts'),
('A0031', 'S0031', 'Dairy'),
('A0032', 'S0032', 'Eggs'),
('A0033', 'S0033', 'Soy'),
('A0034', 'S0034', 'Shellfish'),
('A0035', 'S0035', 'Gluten'),
('A0036', 'S0036', 'Fish'),
('A0037', 'S0037', 'Nuts'),
('A0038', 'S0038', 'Peanuts'),
('A0039', 'S0039', 'Eggs'),
('A0040', 'S0040', 'Dairy'),
('A0041', 'S0041', 'Gluten'),
('A0042', 'S0042', 'Soy'),
('A0043', 'S0043', 'Shellfish'),
('A0044', 'S0044', 'Wheat'),
('A0045', 'S0045', 'Peanuts'),
('A0046', 'S0046', 'Tree Nuts'),
('A0047', 'S0047', 'Milk'),
('A0048', 'S0048', 'Gluten'),
('A0049', 'S0049', 'Eggs'),
('A0050', 'S0050', 'Nuts')
;

select * 
from allergy a ;

INSERT INTO payment (payment_id, student_id, payment_time, amount, payment_method_type)
VALUES
('P0001', 'S0001', '09:30:00', 50.00, 'Credit Card'),
('P0002', 'S0002', '14:45:00', 30.00, 'Cash'),
('P0003', 'S0003', '11:00:00', 75.00, 'Online'),
('P0004', 'S0004', '08:15:00', 40.00, 'Credit Card'),
('P0005', 'S0005', '16:00:00', 60.00, 'Cash'),
('P0006', 'S0006', '13:30:00', 20.00, 'Online'),
('P0007', 'S0007', '10:30:00', 55.00, 'Credit Card'),
('P0008', 'S0008', '17:00:00', 45.00, 'Cash'),
('P0009', 'S0009', '09:00:00', 35.00, 'Online'),
('P0010', 'S0010', '15:45:00', 50.00, 'Credit Card'),
('P0011', 'S0011', '12:15:00', 25.00, 'Cash'),
('P0012', 'S0012', '14:30:00', 65.00, 'Online'),
('P0013', 'S0013', '11:45:00', 40.00, 'Credit Card'),
('P0014', 'S0014', '13:00:00', 60.00, 'Cash'),
('P0015', 'S0015', '16:30:00', 55.00, 'Online'),
('P0016', 'S0016', '09:30:00', 80.00, 'Credit Card'),
('P0017', 'S0017', '08:45:00', 90.00, 'Cash'),
('P0018', 'S0018', '10:15:00', 70.00, 'Online'),
('P0019', 'S0019', '12:00:00', 50.00, 'Credit Card'),
('P0020', 'S0020', '13:45:00', 65.00, 'Cash'),
('P0021', 'S0021', '14:00:00', 40.00, 'Online'),
('P0022', 'S0022', '15:30:00', 75.00, 'Credit Card'),
('P0023', 'S0023', '16:15:00', 35.00, 'Cash'),
('P0024', 'S0024', '10:45:00', 50.00, 'Online'),
('P0025', 'S0025', '09:00:00', 25.00, 'Credit Card'),
('P0026', 'S0026', '13:30:00', 30.00, 'Cash'),
('P0027', 'S0027', '17:30:00', 45.00, 'Online'),
('P0028', 'S0028', '12:30:00', 50.00, 'Credit Card'),
('P0029', 'S0029', '16:00:00', 60.00, 'Cash'),
('P0030', 'S0030', '14:30:00', 80.00, 'Online'),
('P0031', 'S0031', '10:00:00', 65.00, 'Credit Card'),
('P0032', 'S0032', '12:45:00', 40.00, 'Cash'),
('P0033', 'S0033', '13:00:00', 75.00, 'Online'),
('P0034', 'S0034', '15:00:00', 55.00, 'Credit Card'),
('P0035', 'S0035', '08:00:00', 20.00, 'Cash'),
('P0036', 'S0036', '09:30:00', 50.00, 'Online'),
('P0037', 'S0037', '11:15:00', 45.00, 'Credit Card'),
('P0038', 'S0038', '12:00:00', 65.00, 'Cash'),
('P0039', 'S0039', '14:00:00', 70.00, 'Online'),
('P0040', 'S0040', '13:30:00', 35.00, 'Credit Card'),
('P0041', 'S0041', '11:45:00', 60.00, 'Cash'),
('P0042', 'S0042', '15:15:00', 40.00, 'Online'),
('P0043', 'S0043', '09:00:00', 75.00, 'Credit Card'),
('P0044', 'S0044', '16:30:00', 30.00, 'Cash'),
('P0045', 'S0045', '10:30:00', 55.00, 'Online'),
('P0046', 'S0046', '13:00:00', 45.00, 'Credit Card'),
('P0047', 'S0047', '14:30:00', 50.00, 'Cash'),
('P0048', 'S0048', '09:30:00', 65.00, 'Online'),
('P0049', 'S0049', '11:00:00', 40.00, 'Credit Card'),
('P0050', 'S0050', '12:45:00', 80.00, 'Cash')
;

select * 
from payment;

-- Insert cuisines into the cuisine table
INSERT INTO cuisine (cuisine_id, cuisine_name, cuisine_description) 
VALUES 
('C001', 'Italian', 'Traditional Italian dishes, including pasta and pizza'),
('C002', 'Chinese', 'Chinese cuisine including stir-fries and dumplings'),
('C003', 'Mexican', 'Mexican cuisine with tacos, enchiladas, and more'),
('C004', 'Indian', 'Indian dishes such as curries, tandoori, and biryani'),
('C005', 'French', 'Classic French dishes like croissants, coq au vin, and more'),
('C006', 'Japanese', 'Japanese dishes including sushi, ramen, and tempura'),
('C007', 'Thai', 'Thai cuisine with dishes like pad thai, curry, and tom yum'),
('C008', 'Greek', 'Greek cuisine including moussaka, souvlaki, and tzatziki'),
('C009', 'Spanish', 'Spanish dishes like paella, tapas, and churros'),
('C010', 'Middle Eastern', 'Middle Eastern dishes such as shawarma, falafel, and hummus'),
('C011', 'Vietnamese', 'Vietnamese dishes like pho, banh mi, and spring rolls'),
('C012', 'Korean', 'Korean dishes including bibimbap, kimchi, and galbi'),
('C013', 'American', 'Classic American dishes like hamburgers, fries, and apple pie'),
('C014', 'Caribbean', 'Caribbean dishes like jerk chicken, plantains, and conch fritters'),
('C015', 'Turkish', 'Turkish dishes like kebabs, baklava, and lahmacun'),
('C016', 'Lebanese', 'Lebanese dishes such as kibbeh, tabbouleh, and hummus'),
('C017', 'Argentine', 'Argentine dishes like empanadas, asado, and chimichurri'),
('C018', 'Brazilian', 'Brazilian dishes like feijoada, coxinha, and pão de queijo'),
('C019', 'Ethiopian', 'Ethiopian dishes like doro wat, injera, and kitfo'),
('C020', 'Russian', 'Russian dishes like borscht, blini, and caviar'),
('C021', 'Peruvian', 'Peruvian dishes like ceviche, lomo saltado, and quinoa salad'),
('C022', 'South African', 'South African dishes like bobotie, biltong, and braai'),
('C023', 'Polish', 'Polish dishes such as pierogi, kielbasa, and bigos'),
('C024', 'Belgian', 'Belgian dishes including moules frites, waterzooi, and stoofvlees'),
('C025', 'Cuban', 'Cuban dishes like Cuban sandwich, ropa vieja, and tostones'),
('C026', 'Moroccan', 'Moroccan dishes like tagine, couscous, and bastilla'),
('C027', 'Swedish', 'Swedish dishes including meatballs, lingonberry jam, and herring'),
('C028', 'Swiss', 'Swiss dishes like fondue, raclette, and rösti'),
('C029', 'Australian', 'Australian dishes like Vegemite on toast, meat pie, and sausages'),
('C030', 'Indonesian', 'Indonesian dishes like nasi goreng, satay, and rendang'),
('C031', 'Filipino', 'Filipino dishes like adobo, sinigang, and lumpia'),
('C032', 'Malaysian', 'Malaysian dishes like nasi lemak, satay, and roti john'),
('C033', 'Nepalese', 'Nepalese dishes like momo, dal bhat, and gundruk'),
('C034', 'Chilean', 'Chilean dishes including empanadas and pastel de choclo');

select * 
from payment;

INSERT INTO menu (menu_id, cuisine_id, menu_name, menu_date)
VALUES
('M001', 'C001', 'Spaghetti Bolognese', '2025-03-01'),
('M002', 'C001', 'Margherita Pizza', '2025-03-02'),
('M003', 'C001', 'Lasagna', '2025-03-03'),
('M004', 'C002', 'Kung Pao Chicken', '2025-03-01'),
('M005', 'C002', 'Sweet and Sour Pork', '2025-03-02'),
('M006', 'C002', 'Peking Duck', '2025-03-03'),
('M007', 'C003', 'Chicken Tacos', '2025-03-01'),
('M008', 'C003', 'Beef Burritos', '2025-03-02'),
('M009', 'C003', 'Vegetarian Enchiladas', '2025-03-03'),
('M010', 'C004', 'Butter Chicken', '2025-03-01'),
('M011', 'C004', 'Paneer Tikka', '2025-03-02'),
('M012', 'C004', 'Chole Bhature', '2025-03-03'),
('M013', 'C005', 'Coq au Vin', '2025-03-01'),
('M014', 'C005', 'Croque Monsieur', '2025-03-02'),
('M015', 'C005', 'Boeuf Bourguignon', '2025-03-03'),
('M016', 'C006', 'Sushi Roll', '2025-03-01'),
('M017', 'C006', 'Ramen', '2025-03-02'),
('M018', 'C006', 'Tempura', '2025-03-03'),
('M019', 'C007', 'Pad Thai', '2025-03-01'),
('M020', 'C007', 'Green Curry', '2025-03-02'),
('M021', 'C007', 'Tom Yum Soup', '2025-03-03'),
('M022', 'C008', 'Moussaka', '2025-03-01'),
('M023', 'C008', 'Souvlaki', '2025-03-02'),
('M024', 'C008', 'Fasolada', '2025-03-03'),
('M025', 'C009', 'Paella', '2025-03-01'),
('M026', 'C009', 'Tapas', '2025-03-02'),
('M027', 'C009', 'Churros', '2025-03-03'),
('M028', 'C010', 'Falafel', '2025-03-01'),
('M029', 'C010', 'Shawarma', '2025-03-02'),
('M030', 'C010', 'Hummus', '2025-03-03'),
('M031', 'C011', 'Pho', '2025-03-01'),
('M032', 'C011', 'Banh Mi', '2025-03-02'),
('M033', 'C011', 'Spring Rolls', '2025-03-03'),
('M034', 'C012', 'Bibimbap', '2025-03-01'),
('M035', 'C012', 'Kimchi', '2025-03-02'),
('M036', 'C012', 'Galbi', '2025-03-03'),
('M037', 'C013', 'Hamburger', '2025-03-01'),
('M038', 'C013', 'BBQ Ribs', '2025-03-02'),
('M039', 'C013', 'Apple Pie', '2025-03-03'),
('M040', 'C014', 'Jerk Chicken', '2025-03-01'),
('M041', 'C014', 'Plantains', '2025-03-02'),
('M042', 'C014', 'Conch Fritters', '2025-03-03'),
('M043', 'C015', 'Kebab', '2025-03-01'),
('M044', 'C015', 'Baklava', '2025-03-02'),
('M045', 'C015', 'Lahmacun', '2025-03-03'),
('M046', 'C016', 'Kibbeh', '2025-03-01'),
('M047', 'C016', 'Tabbouleh', '2025-03-02'),
('M048', 'C016', 'Hummus with Pita', '2025-03-03'),
('M049', 'C017', 'Empanadas', '2025-03-01'),
('M050', 'C017', 'Asado', '2025-03-02')
;

select *
from menu;

INSERT INTO menu_item (item_id, menu_id, item_name, health_score, quantity_instock) VALUES
('i001', 'M001', 'Burger', 85, 50),
('i002', 'M002', 'Pizza', 90, 30),
('i003', 'M003', 'Salad', 95, 100),
('i004', 'M004', 'Pasta', 80, 20),
('i005', 'M005', 'Soup', 92, 25),
('i006', 'M006', 'Sushi', 87, 40),
('i007', 'M007', 'Tacos', 88, 60),
('i008', 'M008', 'Steak', 75, 15),
('i009', 'M009', 'Chicken Wings', 82, 35),
('i010', 'M010', 'Fried Rice', 90, 80),
('i011', 'M011', 'Noodles', 84, 45),
('i012', 'M012', 'Fish Tacos', 93, 22),
('i013', 'M013', 'Vegetarian Pizza', 85, 50),
('i014', 'M014', 'Cheeseburger', 78, 60),
('i015', 'M015', 'French Fries', 87, 70),
('i016', 'M016', 'Grilled Cheese', 92, 40),
('i017', 'M017', 'Tomato Soup', 95, 25),
('i018', 'M018', 'Margarita Pizza', 90, 55),
('i019', 'M019', 'Caesar Salad', 82, 10),
('i020', 'M020', 'BBQ Ribs', 79, 12),
('i021', 'M021', 'Coleslaw', 88, 65),
('i022', 'M022', 'Fish and Chips', 81, 50),
('i023', 'M023', 'Clam Chowder', 94, 30),
('i024', 'M024', 'Chicken Parmesan', 76, 90),
('i025', 'M025', 'Spaghetti', 85, 100),
('i026', 'M026', 'Steak Fries', 78, 15),
('i027', 'M027', 'Chicken Nugget', 91, 25),
('i028', 'M028', 'Lamb Chops', 88, 18),
('i029', 'M029', 'Salmon', 93, 60),
('i030', 'M030', 'Ramen', 86, 50),
('i031', 'M031', 'Banh Mi', 91, 30),
('i032', 'M032', 'Pulled Pork Sandwich', 79, 40),
('i033', 'M033', 'Tuna Salad', 82, 45),
('i034', 'M034', 'Eggplant Parmesan', 90, 55),
('i035', 'M035', 'Mushroom Risotto', 92, 30),
('i036', 'M036', 'Kebabs', 85, 75),
('i037', 'M037', 'Hummus', 93, 60),
('i038', 'M038', 'Chicken Fajitas', 78, 100),
('i039', 'M039', 'Quesadilla', 86, 80),
('i040', 'M040', 'Peking Duck', 88, 25),
('i041', 'M041', 'Dim Sum', 90, 35),
('i042', 'M042', 'Hot Dog', 80, 50),
('i043', 'M043', 'Pretzel', 85, 15),
('i044', 'M044', 'Moussaka', 75, 30),
('i045', 'M045', 'Baklava', 92, 60),
('i046', 'M046', 'Burrito', 85, 90),
('i047', 'M047', 'Enchiladas', 88, 40),
('i048', 'M048', 'Quiche', 93, 20),
('i049', 'M049', 'Croissant', 87, 50),
('i050', 'M050', 'Falafel', 90, 45);

INSERT INTO item_allergen (allergy_id, item_id, allergy_name) VALUES
('A0001', 'i001', 'Peanuts'),
('A0002', 'i002', 'Milk'),
('A0003', 'i003', 'Eggs'),
('A0004', 'i004', 'Gluten'),
('A0005', 'i005', 'Shellfish'),
('A0006', 'i006', 'Soy'),
('A0007', 'i007', 'Wheat'),
('A0008', 'i008', 'Tree Nuts'),
('A0009', 'i009', 'Fish'),
('A0010', 'i010', 'Sesame'),
('A0011', 'i011', 'Mustard'),
('A0012', 'i012', 'Celery'),
('A0013', 'i013', 'Lupin'),
('A0014', 'i014', 'Molluscs'),
('A0015', 'i015', 'Peanuts'),
('A0016', 'i016', 'Milk'),
('A0017', 'i017', 'Eggs'),
('A0018', 'i018', 'Gluten'),
('A0019', 'i019', 'Shellfish'),
('A0020', 'i020', 'Soy'),
('A0021', 'i021', 'Wheat'),
('A0022', 'i022', 'Tree Nuts'),
('A0023', 'i023', 'Fish'),
('A0024', 'i024', 'Sesame'),
('A0025', 'i025', 'Mustard'),
('A0026', 'i026', 'Celery'),
('A0027', 'i027', 'Lupin'),
('A0028', 'i028', 'Molluscs'),
('A0029', 'i029', 'Peanuts'),
('A0030', 'i030', 'Milk'),
('A0031', 'i031', 'Eggs'),
('A0032', 'i032', 'Gluten'),
('A0033', 'i033', 'Shellfish'),
('A0034', 'i034', 'Soy'),
('A0035', 'i035', 'Wheat'),
('A0036', 'i036', 'Tree Nuts'),
('A0037', 'i037', 'Fish'),
('A0038', 'i038', 'Sesame'),
('A0039', 'i039', 'Mustard'),
('A0040', 'i040', 'Celery'),
('A0041', 'i041', 'Lupin'),
('A0042', 'i042', 'Molluscs'),
('A0043', 'i043', 'Peanuts'),
('A0044', 'i044', 'Milk'),
('A0045', 'i045', 'Eggs'),
('A0046', 'i046', 'Gluten'),
('A0047', 'i047', 'Shellfish'),
('A0048', 'i048', 'Soy'),
('A0049', 'i049', 'Wheat'),
('A0050', 'i050', 'Tree Nuts');

select *
from item_allergen ia;

INSERT INTO nutrition (nutrition_id, item_id, calories, protein, iron) VALUES
('N0001', 'i001', 250, 10, 1),
('N0002', 'i002', 180, 8, 0.5),
('N0003', 'i003', 300, 12, 1.2),
('N0004', 'i004', 150, 5, 0.8),
('N0005', 'i005', 500, 20, 2),
('N0006', 'i006', 200, 7, 0.9),
('N0007', 'i007', 400, 15, 1),
('N0008', 'i008', 350, 18, 1.5),
('N0009', 'i009', 600, 25, 3),
('N0010', 'i010', 280, 11, 1.3),
('N0011', 'i011', 180, 6, 0.7),
('N0012', 'i012', 220, 9, 1),
('N0013', 'i013', 160, 4, 0.6),
('N0014', 'i014', 450, 22, 2.5),
('N0015', 'i015', 240, 10, 1.1),
('N0016', 'i016', 310, 13, 1.8),
('N0017', 'i017', 180, 6, 0.8),
('N0018', 'i018', 250, 8, 1),
('N0019', 'i019', 500, 19, 2),
('N0020', 'i020', 420, 17, 1.7),
('N0021', 'i021', 330, 12, 1.5),
('N0022', 'i022', 200, 7, 1),
('N0023', 'i023', 350, 14, 2.2),
('N0024', 'i024', 300, 11, 1),
('N0025', 'i025', 470, 22, 2.8),
('N0026', 'i026', 270, 9, 1.2),
('N0027', 'i027', 250, 10, 0.8),
('N0028', 'i028', 320, 13, 1.4),
('N0029', 'i029', 450, 20, 2),
('N0030', 'i030', 350, 15, 1.5),
('N0031', 'i031', 400, 16, 1.3),
('N0032', 'i032', 290, 12, 0.9),
('N0033', 'i033', 180, 7, 1),
('N0034', 'i034', 220, 9, 1.2),
('N0035', 'i035', 380, 14, 2),
('N0036', 'i036', 200, 6, 0.7),
('N0037', 'i037', 240, 8, 1),
('N0038', 'i038', 330, 12, 1.5),
('N0039', 'i039', 260, 10, 0.8),
('N0040', 'i040', 400, 18, 2.1),
('N0041', 'i041', 500, 25, 3),
('N0042', 'i042', 300, 12, 1.2),
('N0043', 'i043', 280, 10, 1),
('N0044', 'i044', 210, 7, 1),
('N0045', 'i045', 370, 15, 2),
('N0046', 'i046', 500, 22, 2.3),
('N0047', 'i047', 230, 8, 1.1),
('N0048', 'i048', 380, 14, 2.5),
('N0049', 'i049', 320, 13, 1.7),
('N0050', 'i050', 420, 19, 2.4);

select * from nutrition n ;

INSERT INTO restaurant (restaurant_id, restaurant_name, restaurant_location, lease_start_date, hours) VALUES
('R0001', 'Bistro Bella', 'University of Utah, 100 S Central Campus Dr, Salt Lake City, UT', '2020-01-01', '08:00:00'),
('R0002', 'Sushi Sensation', 'University of Utah, 200 S Medical Dr, Salt Lake City, UT', '2019-06-15', '10:00:00'),
('R0003', 'Pasta Paradise', 'University of Utah, 300 S 2000 E, Salt Lake City, UT', '2021-03-22', '09:00:00'),
('R0004', 'Taco Town', 'University of Utah, 400 S 1400 E, Salt Lake City, UT', '2018-11-11', '11:00:00'),
('R0005', 'Curry Corner', 'University of Utah, 500 S 1600 E, Salt Lake City, UT', '2020-07-25', '07:00:00'),
('R0006', 'Pizza Perfection', 'University of Utah, 600 S 1300 E, Salt Lake City, UT', '2017-05-30', '10:00:00'),
('R0007', 'Burger Bliss', 'University of Utah, 700 S 1100 E, Salt Lake City, UT', '2021-01-18', '09:00:00'),
('R0008', 'Seafood Shack', 'University of Utah, 800 S 1500 E, Salt Lake City, UT', '2019-09-12', '12:00:00'),
('R0009', 'Steakhouse Supreme', 'University of Utah, 900 S 2000 E, Salt Lake City, UT', '2020-03-01', '16:00:00'),
('R0010', 'Veggie Vibes', 'University of Utah, 1000 S 1700 E, Salt Lake City, UT', '2021-06-20', '08:00:00'),
('R0011', 'Fried Chicken Fest', 'University of Utah, 1100 S 1600 E, Salt Lake City, UT', '2018-08-13', '11:00:00'),
('R0012', 'Sushi Supreme', 'University of Utah, 1200 S 1400 E, Salt Lake City, UT', '2020-10-01', '13:00:00'),
('R0013', 'Burrito Bonanza', 'University of Utah, 1300 S 1100 E, Salt Lake City, UT', '2021-05-10', '09:00:00'),
('R0014', 'Italian Indulgence', 'University of Utah, 1400 S 1300 E, Salt Lake City, UT', '2017-12-05', '10:00:00'),
('R0015', 'Noodle Nirvana', 'University of Utah, 1500 S 1600 E, Salt Lake City, UT', '2021-02-25', '12:00:00'),
('R0016', 'Grill & Thrill', 'University of Utah, 1600 S 1500 E, Salt Lake City, UT', '2018-10-12', '13:00:00'),
('R0017', 'Dumpling Dynasty', 'University of Utah, 1700 S 1400 E, Salt Lake City, UT', '2019-04-30', '14:00:00'),
('R0018', 'Taco Temptation', 'University of Utah, 1800 S 1300 E, Salt Lake City, UT', '2020-07-04', '09:00:00'),
('R0019', 'Coffee & Croissants', 'University of Utah, 1900 S 1200 E, Salt Lake City, UT', '2020-09-15', '08:00:00'),
('R0020', 'BBQ Bliss', 'University of Utah, 2000 S 1100 E, Salt Lake City, UT', '2018-03-19', '11:00:00'),
('R0021', 'Waffle Wonder', 'University of Utah, 2100 S 1000 E, Salt Lake City, UT', '2021-01-30', '07:00:00'),
('R0022', 'Ramen Revival', 'University of Utah, 2200 S 1200 E, Salt Lake City, UT', '2019-07-07', '10:00:00'),
('R0023', 'Bagel Bonanza', 'University of Utah, 2300 S 1400 E, Salt Lake City, UT', '2020-04-11', '07:00:00'),
('R0024', 'Smoothie Spot', 'University of Utah, 2400 S 1500 E, Salt Lake City, UT', '2021-02-05', '08:00:00'),
('R0025', 'Café Caffeine', 'University of Utah, 2500 S 1700 E, Salt Lake City, UT', '2020-06-19', '06:00:00'),
('R0026', 'Wings World', 'University of Utah, 2600 S 1800 E, Salt Lake City, UT', '2019-11-02', '11:00:00'),
('R0027', 'Salad Station', 'University of Utah, 2700 S 1500 E, Salt Lake City, UT', '2020-01-22', '08:00:00'),
('R0028', 'Crepe Corner', 'University of Utah, 2800 S 1400 E, Salt Lake City, UT', '2017-09-14', '10:00:00'),
('R0029', 'Pasta Palace', 'University of Utah, 2900 S 1300 E, Salt Lake City, UT', '2019-05-16', '09:00:00'),
('R0030', 'Burger Haven', 'University of Utah, 3000 S 1200 E, Salt Lake City, UT', '2020-12-25', '12:00:00'),
('R0031', 'Sushi Sensations', 'University of Utah, 3100 S 1100 E, Salt Lake City, UT', '2018-07-01', '13:00:00'),
('R0032', 'Steak Spot', 'University of Utah, 3200 S 1000 E, Salt Lake City, UT', '2021-04-10', '16:00:00'),
('R0033', 'Taco Treat', 'University of Utah, 3300 S 900 E, Salt Lake City, UT', '2020-02-20', '11:00:00'),
('R0034', 'Burrito Bar', 'University of Utah, 3400 S 1100 E, Salt Lake City, UT', '2021-03-15', '12:00:00'),
('R0035', 'Pho Paradise', 'University of Utah, 3500 S 1200 E, Salt Lake City, UT', '2019-08-12', '10:00:00'),
('R0036', 'Noodle Nation', 'University of Utah, 3600 S 1400 E, Salt Lake City, UT', '2020-05-28', '09:00:00'),
('R0037', 'Pizza Parlor', 'University of Utah, 3700 S 1500 E, Salt Lake City, UT', '2018-02-17', '11:00:00'),
('R0038', 'Salad Supreme', 'University of Utah, 3800 S 1600 E, Salt Lake City, UT', '2020-11-05', '10:00:00'),
('R0039', 'Pasta Place', 'University of Utah, 3900 S 1700 E, Salt Lake City, UT', '2021-01-02', '13:00:00'),
('R0040', 'Fried Fish Fry', 'University of Utah, 4000 S 1800 E, Salt Lake City, UT', '2019-03-28', '11:00:00'),
('R0041', 'Grill Gourmet', 'University of Utah, 4100 S 1900 E, Salt Lake City, UT', '2020-09-13', '12:00:00'),
('R0042', 'Taco Time', 'University of Utah, 4200 S 2000 E, Salt Lake City, UT', '2021-05-17', '09:00:00'),
('R0043', 'Bakery Bliss', 'University of Utah, 4300 S 2100 E, Salt Lake City, UT', '2017-11-19', '07:00:00'),
('R0044', 'Burrito Bros', 'University of Utah, 4400 S 2200 E, Salt Lake City, UT', '2020-12-14', '11:00:00'),
('R0045', 'Sushi Street', 'University of Utah, 4500 S 2300 E, Salt Lake City, UT', '2019-10-02', '13:00:00'),
('R0046', 'Hot Dog Haven', 'University of Utah, 4600 S 2400 E, Salt Lake City, UT', '2020-01-10', '08:00:00'),
('R0047', 'Fried Feast', 'University of Utah, 4700 S 2500 E, Salt Lake City, UT', '2021-04-22', '11:00:00'),
('R0048', 'Noodle Nook', 'University of Utah, 4800 S 2600 E, Salt Lake City, UT', '2019-08-23', '10:00:00'),
('R0049', 'Pizza Planet', 'University of Utah, 4900 S 2700 E, Salt Lake City, UT', '2020-03-14', '14:00:00'),
('R0050', 'Café Corner', 'University of Utah, 5000 S 2800 E, Salt Lake City, UT', '2021-02-18', '07:00:00');

select * from restaurant r ;

INSERT INTO orders (restaurant_id, order_id, order_date, order_type) VALUES
('R0001', 'O0001', '2023-01-15', 'Takeout'),
('R0002', 'O0002', '2023-02-10', 'Delivery'),
('R0003', 'O0003', '2023-03-05', 'Dine-In'),
('R0004', 'O0004', '2023-04-20', 'Delivery'),
('R0005', 'O0005', '2023-05-25', 'Takeout'),
('R0006', 'O0006', '2023-06-10', 'Dine-In'),
('R0007', 'O0007', '2023-07-04', 'Delivery'),
('R0008', 'O0008', '2023-08-15', 'Takeout'),
('R0009', 'O0009', '2023-09-22', 'Delivery'),
('R0010', 'O0010', '2023-10-13', 'Dine-In'),
('R0011', 'O0011', '2023-11-11', 'Takeout'),
('R0012', 'O0012', '2023-12-01', 'Delivery'),
('R0013', 'O0013', '2024-01-10', 'Takeout'),
('R0014', 'O0014', '2024-02-18', 'Dine-In'),
('R0015', 'O0015', '2024-03-25', 'Delivery'),
('R0016', 'O0016', '2024-04-10', 'Takeout'),
('R0017', 'O0017', '2024-05-05', 'Dine-In'),
('R0018', 'O0018', '2024-06-15', 'Takeout'),
('R0019', 'O0019', '2024-07-25', 'Delivery'),
('R0020', 'O0020', '2024-08-20', 'Takeout'),
('R0021', 'O0021', '2024-09-15', 'Dine-In'),
('R0022', 'O0022', '2024-10-10', 'Delivery'),
('R0023', 'O0023', '2024-11-18', 'Takeout'),
('R0024', 'O0024', '2024-12-05', 'Delivery'),
('R0025', 'O0025', '2025-01-01', 'Dine-In'),
('R0026', 'O0026', '2025-02-14', 'Takeout'),
('R0027', 'O0027', '2025-03-30', 'Delivery'),
('R0028', 'O0028', '2025-04-22', 'Takeout'),
('R0029', 'O0029', '2025-05-17', 'Dine-In'),
('R0030', 'O0030', '2025-06-19', 'Delivery'),
('R0031', 'O0031', '2025-07-23', 'Takeout'),
('R0032', 'O0032', '2025-08-10', 'Delivery'),
('R0033', 'O0033', '2025-09-05', 'Dine-In'),
('R0034', 'O0034', '2025-10-14', 'Takeout'),
('R0035', 'O0035', '2025-11-25', 'Delivery'),
('R0036', 'O0036', '2025-12-30', 'Dine-In'),
('R0037', 'O0037', '2026-01-08', 'Takeout'),
('R0038', 'O0038', '2026-02-01', 'Delivery'),
('R0039', 'O0039', '2026-03-14', 'Dine-In'),
('R0040', 'O0040', '2026-04-18', 'Takeout'),
('R0041', 'O0041', '2026-05-06', 'Delivery'),
('R0042', 'O0042', '2026-06-25', 'Takeout'),
('R0043', 'O0043', '2026-07-12', 'Dine-In'),
('R0044', 'O0044', '2026-08-17', 'Delivery'),
('R0045', 'O0045', '2026-09-20', 'Takeout'),
('R0046', 'O0046', '2026-10-05', 'Dine-In'),
('R0047', 'O0047', '2026-11-02', 'Delivery'),
('R0048', 'O0048', '2026-12-16', 'Takeout'),
('R0049', 'O0049', '2027-01-03', 'Delivery'),
('R0050', 'O0050', '2027-02-20', 'Takeout');

INSERT INTO order_item (order_item_id, order_id, item_id) VALUES
('OI0001', 'O0001', 'i001'),
('OI0002', 'O0001', 'i002'),
('OI0003', 'O0002', 'i003'),
('OI0004', 'O0002', 'i004'),
('OI0005', 'O0003', 'i005'),
('OI0006', 'O0003', 'i006'),
('OI0007', 'O0004', 'i007'),
('OI0008', 'O0004', 'i008'),
('OI0009', 'O0005', 'i009'),
('OI0010', 'O0005', 'i010'),
('OI0011', 'O0006', 'i011'),
('OI0012', 'O0006', 'i012'),
('OI0013', 'O0007', 'i013'),
('OI0014', 'O0007', 'i014'),
('OI0015', 'O0008', 'i015'),
('OI0016', 'O0008', 'i016'),
('OI0017', 'O0009', 'i017'),
('OI0018', 'O0009', 'i018'),
('OI0019', 'O0010', 'i019'),
('OI0020', 'O0010', 'i020'),
('OI0021', 'O0011', 'i021'),
('OI0022', 'O0011', 'i022'),
('OI0023', 'O0012', 'i023'),
('OI0024', 'O0012', 'i024'),
('OI0025', 'O0013', 'i025'),
('OI0026', 'O0013', 'i026'),
('OI0027', 'O0014', 'i027'),
('OI0028', 'O0014', 'i028'),
('OI0029', 'O0015', 'i029'),
('OI0030', 'O0015', 'i030'),
('OI0031', 'O0016', 'i031'),
('OI0032', 'O0016', 'i032'),
('OI0033', 'O0017', 'i033'),
('OI0034', 'O0017', 'i034'),
('OI0035', 'O0018', 'i035'),
('OI0036', 'O0018', 'i036'),
('OI0037', 'O0019', 'i037'),
('OI0038', 'O0019', 'i038'),
('OI0039', 'O0020', 'i039'),
('OI0040', 'O0020', 'i040'),
('OI0041', 'O0021', 'i041'),
('OI0042', 'O0021', 'i042'),
('OI0043', 'O0022', 'i043'),
('OI0044', 'O0022', 'i044'),
('OI0045', 'O0023', 'i045'),
('OI0046', 'O0023', 'i046'),
('OI0047', 'O0024', 'i047'),
('OI0048', 'O0024', 'i048'),
('OI0049', 'O0025', 'i049'),
('OI0050', 'O0025', 'i050');

select *
from order_item oi ;

INSERT INTO meal_plan (meal_plan_id, plan_name, plan_start_date, plan_expiration_date, payment_id) VALUES
('MP0001', 'Basic Plan', '2023-01-01', '2023-12-31', 'P0001'),
('MP0002', 'Premium Plan', '2023-02-01', '2024-01-31', 'P0002'),
('MP0003', 'Student Plan', '2023-03-01', '2023-08-31', 'P0003'),
('MP0004', 'Vegetarian Plan', '2023-04-01', '2023-12-31', 'P0004'),
('MP0005', 'Vegan Plan', '2023-05-01', '2023-10-31', 'P0005'),
('MP0006', 'Gluten-Free Plan', '2023-06-01', '2023-11-30', 'P0006'),
('MP0007', 'Family Plan', '2023-07-01', '2024-06-30', 'P0007'),
('MP0008', 'Weight Loss Plan', '2023-08-01', '2024-07-31', 'P0008'),
('MP0009', 'Fitness Plan', '2023-09-01', '2024-08-31', 'P0009'),
('MP0010', 'Diet Plan', '2023-10-01', '2024-09-30', 'P0010'),
('MP0011', 'Luxury Plan', '2023-11-01', '2024-10-31', 'P0011'),
('MP0012', 'Corporate Plan', '2023-12-01', '2024-11-30', 'P0012'),
('MP0013', 'Holiday Plan', '2024-01-01', '2024-12-31', 'P0013'),
('MP0014', 'Executive Plan', '2024-02-01', '2024-12-31', 'P0014'),
('MP0015', 'Balanced Diet Plan', '2024-03-01', '2025-02-28', 'P0015'),
('MP0016', 'Low Carb Plan', '2024-04-01', '2025-03-31', 'P0016'),
('MP0017', 'Paleo Plan', '2024-05-01', '2025-04-30', 'P0017'),
('MP0018', 'Keto Plan', '2024-06-01', '2025-05-31', 'P0018'),
('MP0019', 'Mediterranean Plan', '2024-07-01', '2025-06-30', 'P0019'),
('MP0020', 'Organic Plan', '2024-08-01', '2025-07-31', 'P0020'),
('MP0021', 'Whole30 Plan', '2024-09-01', '2025-08-31', 'P0021'),
('MP0022', 'Diabetic Plan', '2024-10-01', '2025-09-30', 'P0022'),
('MP0023', 'Heart Health Plan', '2024-11-01', '2025-10-31', 'P0023'),
('MP0024', 'Pregnancy Plan', '2024-12-01', '2025-11-30', 'P0024'),
('MP0025', 'Postpartum Plan', '2025-01-01', '2025-12-31', 'P0025'),
('MP0026', 'Recovery Plan', '2025-02-01', '2025-12-31', 'P0026'),
('MP0027', 'Senior Plan', '2025-03-01', '2025-12-31', 'P0027'),
('MP0028', 'Hiking Plan', '2025-04-01', '2025-12-31', 'P0028'),
('MP0029', 'Active Lifestyle Plan', '2025-05-01', '2025-12-31', 'P0029'),
('MP0030', 'Low Sodium Plan', '2025-06-01', '2025-12-31', 'P0030'),
('MP0031', 'Anti-Inflammatory Plan', '2025-07-01', '2025-12-31', 'P0031'),
('MP0032', 'Fertility Plan', '2025-08-01', '2025-12-31', 'P0032'),
('MP0033', 'Allergy-Free Plan', '2025-09-01', '2025-12-31', 'P0033'),
('MP0034', 'Sustainable Plan', '2025-10-01', '2025-12-31', 'P0034'),
('MP0035', 'Custom Plan', '2025-11-01', '2025-12-31', 'P0035'),
('MP0036', 'Sports Plan', '2025-12-01', '2026-11-30', 'P0036'),
('MP0037', 'Intermittent Fasting Plan', '2026-01-01', '2026-12-31', 'P0037'),
('MP0038', 'Clean Eating Plan', '2026-02-01', '2026-12-31', 'P0038'),
('MP0039', 'Ayurvedic Plan', '2026-03-01', '2026-12-31', 'P0039'),
('MP0040', 'Raw Food Plan', '2026-04-01', '2026-12-31', 'P0040'),
('MP0041', 'Low Fat Plan', '2026-05-01', '2026-12-31', 'P0041'),
('MP0042', 'Superfoods Plan', '2026-06-01', '2026-12-31', 'P0042'),
('MP0043', 'Cleanse Plan', '2026-07-01', '2026-12-31', 'P0043'),
('MP0044', 'Low Sugar Plan', '2026-08-01', '2026-12-31', 'P0044'),
('MP0045', 'Macro Counting Plan', '2026-09-01', '2026-12-31', 'P0045'),
('MP0046', 'Personalized Plan', '2026-10-01', '2026-12-31', 'P0046'),
('MP0047', 'Meal Prep Plan', '2026-11-01', '2026-12-31', 'P0047'),
('MP0048', 'Quick & Easy Plan', '2026-12-01', '2027-11-30', 'P0048'),
('MP0049', 'Whole Foods Plan', '2027-01-01', '2027-12-31', 'P0049'),
('MP0050', 'Budget Plan', '2027-02-01', '2027-12-31', 'P0050');

select *
from meal_plan;

INSERT INTO event (event_id, restaurant_id, event_name, event_date) VALUES
('E0001', 'R0001', 'Live Music Night', '2023-01-15'),
('E0002', 'R0002', 'Wine Tasting Event', '2023-02-20'),
('E0003', 'R0003', 'Valentine’s Day Dinner', '2023-02-14'),
('E0004', 'R0004', 'Food Truck Festival', '2023-03-25'),
('E0005', 'R0005', 'Jazz Night', '2023-04-10'),
('E0006', 'R0006', 'Sushi Making Class', '2023-05-05'),
('E0007', 'R0007', 'Family BBQ Night', '2023-06-12'),
('E0008', 'R0008', 'Chef’s Table Experience', '2023-07-01'),
('E0009', 'R0009', 'Pasta Party', '2023-08-10'),
('E0010', 'R0010', 'Oktoberfest Celebration', '2023-09-22'),
('E0011', 'R0011', 'Halloween Costume Party', '2023-10-31'),
('E0012', 'R0012', 'Holiday Feast', '2023-12-25'),
('E0013', 'R0013', 'New Year’s Eve Bash', '2023-12-31'),
('E0014', 'R0014', 'Farm-to-Table Dinner', '2024-01-20'),
('E0015', 'R0015', 'Cooking Competition', '2024-02-12'),
('E0016', 'R0016', 'Mother’s Day Brunch', '2024-05-12'),
('E0017', 'R0017', 'Beer Pairing Dinner', '2024-06-22'),
('E0018', 'R0018', 'Pizza Making Workshop', '2024-07-15'),
('E0019', 'R0019', 'Summer Solstice Party', '2024-06-21'),
('E0020', 'R0020', 'Taco Tuesday Special', '2024-08-06'),
('E0021', 'R0021', 'Thanksgiving Dinner', '2024-11-28'),
('E0022', 'R0022', 'Christmas Market', '2024-12-05'),
('E0023', 'R0023', 'Winter Wonderland Event', '2024-12-15'),
('E0024', 'R0024', 'Live Comedy Night', '2024-09-19'),
('E0025', 'R0025', 'Gourmet Wine Pairing', '2024-10-07'),
('E0026', 'R0026', 'International Cuisine Night', '2024-11-11'),
('E0027', 'R0027', 'Yoga and Brunch', '2025-01-25'),
('E0028', 'R0028', 'Vegan Cooking Class', '2025-02-05'),
('E0029', 'R0029', 'Lobster Feast', '2025-03-10'),
('E0030', 'R0030', 'Chocolate Tasting Event', '2025-04-01'),
('E0031', 'R0031', 'Street Food Festival', '2025-05-20'),
('E0032', 'R0032', 'BBQ Championship', '2025-06-08'),
('E0033', 'R0033', 'Vegetarian Dinner Night', '2025-07-17'),
('E0034', 'R0034', 'Wine and Cheese Night', '2025-08-14'),
('E0035', 'R0035', 'Cooking with Local Ingredients', '2025-09-25'),
('E0036', 'R0036', 'Music and Mimosas', '2025-10-02'),
('E0037', 'R0037', 'Food and Film Night', '2025-11-14'),
('E0038', 'R0038', 'Cultural Cuisine Night', '2025-12-05'),
('E0039', 'R0039', 'Spring Fling Celebration', '2026-04-01'),
('E0040', 'R0040', 'Chef’s Special Event', '2026-05-08'),
('E0041', 'R0041', 'Brewery Tour and Tasting', '2026-06-25'),
('E0042', 'R0042', 'Outdoor Picnic Event', '2026-07-18'),
('E0043', 'R0043', 'Gourmet Pizza Night', '2026-08-22'),
('E0044', 'R0044', 'Taste of Italy', '2026-09-12'),
('E0045', 'R0045', 'Farmers Market Dinner', '2026-10-20'),
('E0046', 'R0046', 'BBQ and Blues Festival', '2026-11-03'),
('E0047', 'R0047', 'New Year’s Eve Gala', '2026-12-31'),
('E0048', 'R0048', 'Cocktail and Dessert Pairing', '2027-01-14'),
('E0049', 'R0049', 'Seafood Feast', '2027-02-11'),
('E0050', 'R0050', 'French Bistro Night', '2027-03-25');

select * from event;

INSERT INTO seating (table_number, restaurant_id, seating_capacity) VALUES
(1, 'R0001', 4),
(2, 'R0001', 2),
(3, 'R0001', 6),
(4, 'R0001', 8),
(5, 'R0001', 4),
(6, 'R0002', 4),
(7, 'R0002', 2),
(8, 'R0002', 6),
(9, 'R0002', 10),
(10, 'R0002', 4),
(11, 'R0003', 4),
(12, 'R0003', 2),
(13, 'R0003', 6),
(14, 'R0003', 8),
(15, 'R0003', 4),
(16, 'R0004', 4),
(17, 'R0004', 2),
(18, 'R0004', 6),
(19, 'R0004', 10),
(20, 'R0004', 4),
(21, 'R0005', 4),
(22, 'R0005', 2),
(23, 'R0005', 6),
(24, 'R0005', 8),
(25, 'R0005', 4),
(26, 'R0006', 4),
(27, 'R0006', 2),
(28, 'R0006', 6),
(29, 'R0006', 10),
(30, 'R0006', 4),
(31, 'R0007', 4),
(32, 'R0007', 2),
(33, 'R0007', 6),
(34, 'R0007', 8),
(35, 'R0007', 4),
(36, 'R0008', 4),
(37, 'R0008', 2),
(38, 'R0008', 6),
(39, 'R0008', 10),
(40, 'R0008', 4),
(41, 'R0009', 4),
(42, 'R0009', 2),
(43, 'R0009', 6),
(44, 'R0009', 8),
(45, 'R0009', 4),
(46, 'R0010', 4),
(47, 'R0010', 2),
(48, 'R0010', 6),
(49, 'R0010', 8),
(50, 'R0010', 4);

select * 
from seating s;

INSERT INTO employee (employee_id, restaurant_id, employee_name, employee_role) VALUES
('E0001', 'R0001', 'Alice Johnson', 'Manager'),
('E0002', 'R0001', 'Bob Smith', 'Chef'),
('E0003', 'R0001', 'Catherine Lee', 'Waitstaff'),
('E0004', 'R0001', 'David White', 'Waitstaff'),
('E0005', 'R0001', 'Emma Brown', 'Sous Chef'),
('E0006', 'R0002', 'Frank Wilson', 'Manager'),
('E0007', 'R0002', 'Grace Davis', 'Chef'),
('E0008', 'R0002', 'Henry Clark', 'Waitstaff'),
('E0009', 'R0002', 'Ivy Martin', 'Bartender'),
('E0010', 'R0002', 'Jackie Thompson', 'Dishwasher'),
('E0011', 'R0003', 'Kyle Evans', 'Manager'),
('E0012', 'R0003', 'Lily Harris', 'Chef'),
('E0013', 'R0003', 'Megan Carter', 'Waitstaff'),
('E0014', 'R0003', 'Nathaniel Scott', 'Sous Chef'),
('E0015', 'R0003', 'Olivia Roberts', 'Hostess'),
('E0016', 'R0004', 'Paul Green', 'Manager'),
('E0017', 'R0004', 'Quincy Adams', 'Chef'),
('E0018', 'R0004', 'Rita Collins', 'Waitstaff'),
('E0019', 'R0004', 'Steve Walker', 'Dishwasher'),
('E0020', 'R0004', 'Tina Perez', 'Bartender'),
('E0021', 'R0005', 'Ursula King', 'Manager'),
('E0022', 'R0005', 'Victor Moore', 'Chef'),
('E0023', 'R0005', 'Wendy Young', 'Waitstaff'),
('E0024', 'R0005', 'Xander Gray', 'Sous Chef'),
('E0025', 'R0005', 'Yvonne Bell', 'Dishwasher'),
('E0026', 'R0006', 'Zachary Miller', 'Manager'),
('E0027', 'R0006', 'Aaron Davis', 'Chef'),
('E0028', 'R0006', 'Bethany Taylor', 'Waitstaff'),
('E0029', 'R0006', 'Caleb Anderson', 'Bartender'),
('E0030', 'R0006', 'Debbie Mitchell', 'Dishwasher'),
('E0031', 'R0007', 'Ethan Carter', 'Manager'),
('E0032', 'R0007', 'Fiona Stewart', 'Chef'),
('E0033', 'R0007', 'George Harris', 'Waitstaff'),
('E0034', 'R0007', 'Holly Williams', 'Sous Chef'),
('E0035', 'R0007', 'Ian Lee', 'Hostess'),
('E0036', 'R0008', 'Jack Peters', 'Manager'),
('E0037', 'R0008', 'Karen Robinson', 'Chef'),
('E0038', 'R0008', 'Laura Thompson', 'Waitstaff'),
('E0039', 'R0008', 'Michael White', 'Dishwasher'),
('E0040', 'R0008', 'Nina Clark', 'Bartender'),
('E0041', 'R0009', 'Olga Scott', 'Manager'),
('E0042', 'R0009', 'Paul Foster', 'Chef'),
('E0043', 'R0009', 'Quinn Edwards', 'Waitstaff'),
('E0044', 'R0009', 'Rachel Lewis', 'Sous Chef'),
('E0045', 'R0009', 'Sam Miller', 'Hostess'),
('E0046', 'R0010', 'Timothy Harris', 'Manager'),
('E0047', 'R0010', 'Ursula Perez', 'Chef'),
('E0048', 'R0010', 'Vince Gray', 'Waitstaff'),
('E0049', 'R0010', 'Wanda Johnson', 'Bartender'),
('E0050', 'R0010', 'Xander Roberts', 'Dishwasher');

select * from employee e ;

INSERT INTO delivery (delivery_id, order_id, delivery_building, delivery_date) VALUES
(1, 'O0001', 101, '2023-01-10'),
(2, 'O0002', 102, '2023-01-11'),
(3, 'O0003', 103, '2023-01-12'),
(4, 'O0004', 104, '2023-01-13'),
(5, 'O0005', 105, '2023-01-14'),
(6, 'O0006', 106, '2023-01-15'),
(7, 'O0007', 107, '2023-01-16'),
(8, 'O0008', 108, '2023-01-17'),
(9, 'O0009', 109, '2023-01-18'),
(10, 'O0010', 110, '2023-01-19'),
(11, 'O0011', 111, '2023-01-20'),
(12, 'O0012', 112, '2023-01-21'),
(13, 'O0013', 113, '2023-01-22'),
(14, 'O0014', 114, '2023-01-23'),
(15, 'O0015', 115, '2023-01-24'),
(16, 'O0016', 116, '2023-01-25'),
(17, 'O0017', 117, '2023-01-26'),
(18, 'O0018', 118, '2023-01-27'),
(19, 'O0019', 119, '2023-01-28'),
(20, 'O0020', 120, '2023-01-29'),
(21, 'O0021', 121, '2023-02-01'),
(22, 'O0022', 122, '2023-02-02'),
(23, 'O0023', 123, '2023-02-03'),
(24, 'O0024', 124, '2023-02-04'),
(25, 'O0025', 125, '2023-02-05'),
(26, 'O0026', 126, '2023-02-06'),
(27, 'O0027', 127, '2023-02-07'),
(28, 'O0028', 128, '2023-02-08'),
(29, 'O0029', 129, '2023-02-09'),
(30, 'O0030', 130, '2023-02-10'),
(31, 'O0031', 131, '2023-02-11'),
(32, 'O0032', 132, '2023-02-12'),
(33, 'O0033', 133, '2023-02-13'),
(34, 'O0034', 134, '2023-02-14'),
(35, 'O0035', 135, '2023-02-15'),
(36, 'O0036', 136, '2023-02-16'),
(37, 'O0037', 137, '2023-02-17'),
(38, 'O0038', 138, '2023-02-18'),
(39, 'O0039', 139, '2023-02-19'),
(40, 'O0040', 140, '2023-02-20'),
(41, 'O0041', 141, '2023-02-21'),
(42, 'O0042', 142, '2023-02-22'),
(43, 'O0043', 143, '2023-02-23'),
(44, 'O0044', 144, '2023-02-24'),
(45, 'O0045', 145, '2023-02-25'),
(46, 'O0046', 146, '2023-02-26'),
(47, 'O0047', 147, '2023-02-27'),
(48, 'O0048', 148, '2023-02-28'),
(49, 'O0049', 149, '2023-03-01'),
(50, 'O0050', 150, '2023-03-02');

select *
from delivery d ;

INSERT INTO student_nutrition (student_nutrition_id, student_id, nutrition_id, quantity) VALUES
(1, 'S0001', 'N0001', 2),
(2, 'S0002', 'N0002', 1),
(3, 'S0003', 'N0003', 3),
(4, 'S0004', 'N0004', 2),
(5, 'S0005', 'N0005', 4),
(6, 'S0006', 'N0006', 1),
(7, 'S0007', 'N0007', 5),
(8, 'S0008', 'N0008', 2),
(9, 'S0009', 'N0009', 3),
(10, 'S0010', 'N0010', 1),
(11, 'S0011', 'N0011', 4),
(12, 'S0012', 'N0012', 2),
(13, 'S0013', 'N0013', 1),
(14, 'S0014', 'N0014', 3),
(15, 'S0015', 'N0015', 2),
(16, 'S0016', 'N0016', 1),
(17, 'S0017', 'N0017', 3),
(18, 'S0018', 'N0018', 5),
(19, 'S0019', 'N0019', 4),
(20, 'S0020', 'N0020', 2),
(21, 'S0021', 'N0021', 1),
(22, 'S0022', 'N0022', 3),
(23, 'S0023', 'N0023', 5),
(24, 'S0024', 'N0024', 2),
(25, 'S0025', 'N0025', 4),
(26, 'S0026', 'N0026', 3),
(27, 'S0027', 'N0027', 1),
(28, 'S0028', 'N0028', 2),
(29, 'S0029', 'N0029', 3),
(30, 'S0030', 'N0030', 4),
(31, 'S0031', 'N0031', 2),
(32, 'S0032', 'N0032', 5),
(33, 'S0033', 'N0033', 1),
(34, 'S0034', 'N0034', 4),
(35, 'S0035', 'N0035', 2),
(36, 'S0036', 'N0036', 1),
(37, 'S0037', 'N0037', 3),
(38, 'S0038', 'N0038', 5),
(39, 'S0039', 'N0039', 2),
(40, 'S0040', 'N0040', 4),
(41, 'S0041', 'N0041', 3),
(42, 'S0042', 'N0042', 1),
(43, 'S0043', 'N0043', 2),
(44, 'S0044', 'N0044', 5),
(45, 'S0045', 'N0045', 3),
(46, 'S0046', 'N0046', 2),
(47, 'S0047', 'N0047', 4),
(48, 'S0048', 'N0048', 1),
(49, 'S0049', 'N0049', 3),
(50, 'S0050', 'N0050', 2);

select * from student_nutrition;
