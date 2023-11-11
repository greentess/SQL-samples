ALTER TABLE tovar ADD rating2020 INT;
--рейтинг товаров по количеству проданных товаров за определенный год
CREATE PROC Ratingnew @year INT AS
DECLARE @tovar int, @kol INT, @i INT
DECLARE cur CURSOR FOR
SELECT tovar_num, SUM(sell_count) FROM fullSalesViewNEW
WHERE YEAR(receipt_date)=@year
GROUP BY tovar_num
ORDER BY 2 DESC
SET @i=1
OPEN cur
FETCH cur INTO @tovar, @kol
WHILE @@FETCH_STATUS=0
BEGIN
UPDATE tovar SET rating2020=@i
WHERE tovar_num=@tovar
SET @i+=1
FETCH cur INTO @tovar, @kol
END
SELECT * FROM tovar 
ORDER BY rating2020
DEALLOCATE cur

exec Ratingnew 2020

Select*from tovar ORDER by rating2020

ALTER TABLE store ADD rating2020 VARCHAR(2);
--рейтинг книжных магазинов по количеству проданных товаров за определенный год по номерам
CREATE PROC Ratingnewforstore @year INT AS
DECLARE @store int, @kol INT, @i INT
DECLARE cur CURSOR FOR
SELECT store_num, SUM(sell_count) FROM fullSalesViewNEWNEW
WHERE YEAR(receipt_date)=@year
GROUP BY store_num
ORDER BY 2 DESC
SET @i=1
OPEN cur
FETCH cur INTO @store, @kol
WHILE @@FETCH_STATUS=0
BEGIN
UPDATE store SET rating2020=LTRIM(STR(@i))
WHERE store_num=@store
SET @i+=1
FETCH cur INTO @store, @kol
END
SELECT * FROM store
ORDER BY rating2020
DEALLOCATE cur

exec Ratingnewforstore 2020

--рейтинг книжных магазинов по количеству проданных товаров за определенный год по категориям (5 категорий)
CREATE PROC Ratingnewforstore2 AS
DECLARE @store int, @rat VARCHAR
DECLARE cur CURSOR FOR
SELECT store_num, rating2020  from store
OPEN cur
FETCH cur INTO @store, @rat
WHILE @@FETCH_STATUS=0
BEGIN
UPDATE store SET rating2020='A'
WHERE rating2020='1' OR  rating2020='2' OR  rating2020='3' OR  rating2020='4' OR  rating2020='5' OR  rating2020='6' OR  rating2020='7' OR  rating2020='8' OR  rating2020='9' OR rating2020='10'
UPDATE store SET rating2020='B'
WHERE rating2020='11' OR  rating2020='12' OR  rating2020='13' OR  rating2020='14' OR  rating2020='15' OR  rating2020='16' OR  rating2020='17' OR  rating2020='18' OR  rating2020='19' OR rating2020='20'
UPDATE store SET rating2020='C'
WHERE rating2020='21' OR  rating2020='22' OR  rating2020='23' OR  rating2020='24' OR  rating2020='25' OR  rating2020='26' OR  rating2020='27' OR  rating2020='28' OR  rating2020='29' OR rating2020='30'
UPDATE store SET rating2020='D'
WHERE rating2020='31' OR  rating2020='32' OR  rating2020='33' OR  rating2020='34' OR  rating2020='35' OR  rating2020='36' OR  rating2020='37' OR  rating2020='38' OR  rating2020='39' OR rating2020='40'
UPDATE store SET rating2020='E'
WHERE rating2020='41' OR  rating2020='42' OR  rating2020='43' OR  rating2020='44' OR  rating2020='45' OR  rating2020='46' OR  rating2020='47' OR  rating2020='48' OR  rating2020='49' OR rating2020='50'
FETCH cur INTO @store, @rat
END
SELECT * FROM store
ORDER BY rating2020
DEALLOCATE cur

exec Ratingnewforstore2 

--сколько в каждом городе книжных магазинов каждой категории
CREATE VIEW townRating as
SELECT store_town, COUNT(store_num) as Count, rating2020 FROM
store
GROUP BY store_town, rating2020;
SELECT * FROM townRating;



 
