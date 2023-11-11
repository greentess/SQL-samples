USE MyBook

--������� �������� ��������� � ������� �������� ������ �� �������� ���������� �����
 SELECT *from theme

 --������� ��������� ��������� � ������� �������� ������ �� �������� ���������� �����
 SELECT *from category

 --������� ����� ��������� � ������� �������� ������ �� �������� ���������� �����
 SELECT *from author

--������� ������������ ��������� � ������� ���������
CREATE PROC insert_publisher AS
	DECLARE @nom INT
	SET @nom=1
	WHILE @nom<=50
	BEGIN
		 INSERT INTO publisher(publisher_num, publisher_name)
		 VALUES (@nom, '������������ '+LTRIM(STR(@nom)))
		 SET @nom=@nom+1
	 END
EXEC insert_publisher
SELECT *from publisher

--������� ������� ������� ��������� � ������� ���������.����� ������ ������������ �������� �� 1 �� 10
CREATE PROC insert_store AS
	DECLARE @nom INT
	SET @nom=1
	WHILE @nom<=50
	BEGIN
		 INSERT INTO store(store_num, store_name, store_town)
		 VALUES (@nom, '������� ������� '+LTRIM(STR(@nom)), '����� '+LTRIM(STR(CEILING(RAND()*(10)))))
		 SET @nom=@nom+1
	 END
EXEC insert_store
SELECT *from store

--������� ��������� ��������� � ������� ���������.����� ������������ ��������. � ������� �������� �� 3 ��������� (50*3=150)
CREATE PROC insert_dept AS
	DECLARE @nom INT
	DECLARE @nem INT
	SET @nom=1
	SET @nem=1
	WHILE @nom<=150
	BEGIN
		 INSERT INTO dept(dept_num, dept_name, store_num, dept_address, dept_phone)
		 VALUES (@nom,'��������� '+LTRIM(STR(@nom)), @nem, '����� �'+LTRIM(STR(CEILING(RAND()*(100))))+', ��� �'+LTRIM(STR(CEILING(RAND()*(100)))), '+7'+LTRIM(STR(CEILING(RAND()*(9999999999-1000000000)+1000000000))))
		 SET @nom=@nom+1
		 SET @nem=@nem+1 
		 if @nem=51 or @nem=101
		 SET @nem=1
	 END
EXEC insert_dept
SELECT *from dept

--������� �������� ��������� � ������� ���������.� ������ ��������� �� 2 �������� (150*2=300)
SET IDENTITY_INSERT seller ON
CREATE PROC insert_seller AS
	DECLARE @nom INT
	DECLARE @nem INT
	SET @nom=1
	SET @nem=1
	WHILE @nom<=300
	BEGIN
		 INSERT INTO seller(seller_num,seller_name,dept_num)
		 VALUES (@nom,'�������� '+LTRIM(STR(@nom)), @nem)
		 SET @nom=@nom+1
		 SET @nem=@nem+1 
		 if @nem=151
		 SET @nem=1
	 END
EXEC insert_seller
SELECT *from seller

--������� ���������� ��������� 8-� ����������� (4 ���������� ��������� * 2 ��������� ����). ����������� ������� � ������ ������������ ������� ������
SET IDENTITY_INSERT buyer ON
CREATE PROC insert_buyer1 AS
	DECLARE @nom INT
	SET @nom=1
	declare @begin datetime, @end datetime;
     SET @begin =dateadd(year, -55, CAST(Getdate() AS datetime))  
	 SET @end = '1920-01-01';
	WHILE @nom<=235
	BEGIN
		 INSERT INTO buyer(buyer_num,buyer_name,buyer_date,buyer_gender,buyer_phone)
		 VALUES (@nom,'���������� '+LTRIM(STR(@nom)),cast(cast(@begin as float) + (cast(@end as float) - cast(@begin as float)) * rand() as datetime),'�', '+7'+LTRIM(STR(CEILING(RAND()*(9999999999-1000000000)+1000000000))))
		 SET @nom=@nom+1
	 END
EXEC insert_buyer1
SELECT *from buyer

SET IDENTITY_INSERT buyer ON
CREATE PROC insert_buyer2 AS
	DECLARE @nom INT
	SET @nom=236
	declare @begin datetime, @end datetime;
     SET @begin =dateadd(year, -55, CAST(Getdate() AS datetime))  
	 SET @end = '1920-01-01';
	WHILE @nom<=236+115
	BEGIN
		 INSERT INTO buyer(buyer_num,buyer_name,buyer_date,buyer_gender,buyer_phone)
		 VALUES (@nom,'���������� '+LTRIM(STR(@nom)),cast(cast(@begin as float) + (cast(@end as float) - cast(@begin as float)) * rand() as datetime),'M', '+7'+LTRIM(STR(CEILING(RAND()*(9999999999-1000000000)+1000000000))))
		 SET @nom=@nom+1
	 END
EXEC insert_buyer2
SELECT *from buyer

SET IDENTITY_INSERT buyer ON
CREATE PROC insert_buyer3 AS
	DECLARE @nom INT
	SET @nom=352
	declare @begin datetime, @end datetime;
     SET @begin =dateadd(year, -31, CAST(Getdate() AS datetime))  
	 SET @end = '1967-01-01';
	WHILE @nom<=352+115
	BEGIN
		 INSERT INTO buyer(buyer_num,buyer_name,buyer_date,buyer_gender,buyer_phone)
		 VALUES (@nom,'���������� '+LTRIM(STR(@nom)),cast(cast(@begin as float) + (cast(@end as float) - cast(@begin as float)) * rand() as datetime),'�', '+7'+LTRIM(STR(CEILING(RAND()*(9999999999-1000000000)+1000000000))))
		 SET @nom=@nom+1
	 END
EXEC insert_buyer3
SELECT *from buyer

SET IDENTITY_INSERT buyer ON
CREATE PROC insert_buyer4 AS
	DECLARE @nom INT
	SET @nom=468
	declare @begin datetime, @end datetime;
     SET @begin =dateadd(year, -31, CAST(Getdate() AS datetime))  
	 SET @end = '1967-01-01';
	WHILE @nom<=468+125
	BEGIN
		 INSERT INTO buyer(buyer_num,buyer_name,buyer_date,buyer_gender,buyer_phone)
		 VALUES (@nom,'���������� '+LTRIM(STR(@nom)),cast(cast(@begin as float) + (cast(@end as float) - cast(@begin as float)) * rand() as datetime),'M', '+7'+LTRIM(STR(CEILING(RAND()*(9999999999-1000000000)+1000000000))))
		 SET @nom=@nom+1
	 END
EXEC insert_buyer4
SELECT *from buyer

SET IDENTITY_INSERT buyer ON
CREATE PROC insert_buyer5 AS
	DECLARE @nom INT
	SET @nom=594
	declare @begin datetime, @end datetime;
     SET @begin =dateadd(year, -18, CAST(Getdate() AS datetime))  
	 SET @end = '1991-01-01';
	WHILE @nom<=594+160
	BEGIN
		 INSERT INTO buyer(buyer_num,buyer_name,buyer_date,buyer_gender,buyer_phone)
		 VALUES (@nom,'���������� '+LTRIM(STR(@nom)),cast(cast(@begin as float) + (cast(@end as float) - cast(@begin as float)) * rand() as datetime),'�', '+7'+LTRIM(STR(CEILING(RAND()*(9999999999-1000000000)+1000000000))))
		 SET @nom=@nom+1
	 END
EXEC insert_buyer5
SELECT *from buyer

SET IDENTITY_INSERT buyer ON
CREATE PROC insert_buyer6 AS
	DECLARE @nom INT
	SET @nom=755
	declare @begin datetime, @end datetime;
     SET @begin =dateadd(year, -18, CAST(Getdate() AS datetime))  
	 SET @end = '1991-01-01';
	WHILE @nom<=755+130
	BEGIN
		 INSERT INTO buyer(buyer_num,buyer_name,buyer_date,buyer_gender,buyer_phone)
		 VALUES (@nom,'���������� '+LTRIM(STR(@nom)),cast(cast(@begin as float) + (cast(@end as float) - cast(@begin as float)) * rand() as datetime),'M', '+7'+LTRIM(STR(CEILING(RAND()*(9999999999-1000000000)+1000000000))))
		 SET @nom=@nom+1
	 END
EXEC insert_buyer6
SELECT *from buyer

SET IDENTITY_INSERT buyer ON
CREATE PROC insert_buyer7 AS
	DECLARE @nom INT
	SET @nom=886
	declare @begin datetime, @end datetime;
     SET @begin =dateadd(year, -6, CAST(Getdate() AS datetime))  
	 SET @end = '2004-01-01';
	WHILE @nom<=886+80
	BEGIN
		 INSERT INTO buyer(buyer_num,buyer_name,buyer_date,buyer_gender,buyer_phone)
		 VALUES (@nom,'���������� '+LTRIM(STR(@nom)),cast(cast(@begin as float) + (cast(@end as float) - cast(@begin as float)) * rand() as datetime),'�', '+7'+LTRIM(STR(CEILING(RAND()*(9999999999-1000000000)+1000000000))))
		 SET @nom=@nom+1
	 END
EXEC insert_buyer7
SELECT *from buyer
CREATE PROC insert_buyer8 AS
	DECLARE @nom INT
	SET @nom=967
	declare @begin datetime, @end datetime;
     SET @begin =dateadd(year, -6, CAST(Getdate() AS datetime))  
	 SET @end = '2004-01-01';
	WHILE @nom<=967+40
	BEGIN
		 INSERT INTO buyer(buyer_num,buyer_name,buyer_date,buyer_gender,buyer_phone)
		 VALUES (@nom,'���������� '+LTRIM(STR(@nom)),cast(cast(@begin as float) + (cast(@end as float) - cast(@begin as float)) * rand() as datetime),'M', '+7'+LTRIM(STR(CEILING(RAND()*(9999999999-1000000000)+1000000000))))
		 SET @nom=@nom+1
	 END
EXEC insert_buyer8
SELECT *from buyer

--������� ����� ��������� � ������� 2 ��������, ����� - ��������� �����, ������ - ������ ��������� �������.
SET IDENTITY_INSERT tovar ON
CREATE PROC insert_book AS
	DECLARE @nom INT
		SET @nom=1
	DECLARE @price decimal(6), @x FLOAT
			
	WHILE @nom<=650
	BEGIN
		SET @x= RAND()
		IF @x<=0.35 -- � ������������ 0.35 ���� �� 800 �� 1999
			 SET @price= (RAND()*1199.0+800.0)
		IF @x<=0.15 -- � ������������ 0.15 ���� �� 2000 �� 10000
			SET @price=(RAND()*8000.0+2000.0)
		IF @x>=0.50  -- � ������������ 0.5 ���� �� 120 �� 799
			 SET @price=(RAND()*679.0+120.0)
		 INSERT INTO tovar (tovar_num,publisher_num,tovar_name,tovar_price,category_num )
		 VALUES (@nom,CEILING(RAND()*(50)),'����� '+LTRIM(STR(@nom)),@price,1)
		 SET @nom=@nom+1
	 END
EXEC insert_book
SELECT *from  tovar
Delete from tovar

CREATE PROC insert_tovar AS
	DECLARE @nom INT
		SET @nom=651
	WHILE @nom<=680
	BEGIN
		 INSERT INTO tovar (tovar_num,publisher_num,tovar_name,tovar_price,category_num )
		 VALUES (@nom,CEILING(RAND()*(50)),'����� '+LTRIM(STR(@nom)),CEILING(RAND()*180+20),2)
		 SET @nom=@nom+1
	 END
	 SET @nom=681
	 WHILE @nom<=681+49
	BEGIN
		 INSERT INTO tovar (tovar_num,publisher_num,tovar_name,tovar_price,category_num )
		 VALUES (@nom,CEILING(RAND()*(50)),'����� '+LTRIM(STR(@nom)),CEILING(RAND()*330+20),3)
		 SET @nom=@nom+1
	 END
	 SET @nom=681+50
	 WHILE @nom<=681+50+59
	BEGIN
		 INSERT INTO tovar (tovar_num,publisher_num,tovar_name,tovar_price,category_num )
		 VALUES (@nom,CEILING(RAND()*(50)),'����� '+LTRIM(STR(@nom)),CEILING(RAND()*250+100),4)
		 SET @nom=@nom+1
	 END
	  SET @nom=681+50+60
	 WHILE @nom<=681+50+60+59
	BEGIN
		 INSERT INTO tovar (tovar_num,publisher_num,tovar_name,tovar_price,category_num )
		 VALUES (@nom,CEILING(RAND()*(50)),'����� '+LTRIM(STR(@nom)),CEILING(RAND()*335+15),6)
		 SET @nom=@nom+1
	 END
	 SET @nom=681+50+60+60
	 WHILE @nom<=681+50+60+60+19
	BEGIN
		 INSERT INTO tovar (tovar_num,publisher_num,tovar_name,tovar_price,category_num )
		 VALUES (@nom,CEILING(RAND()*(50)),'����� '+LTRIM(STR(@nom)),CEILING(RAND()*1700+300),7)
		 SET @nom=@nom+1
	 END
	 	 SET @nom=681+50+60+60+20
	 WHILE @nom<=681+50+60+60+20+79
	BEGIN
		 INSERT INTO tovar (tovar_num,publisher_num,tovar_name,tovar_price,category_num )
		 VALUES (@nom,CEILING(RAND()*(50)),'����� '+LTRIM(STR(@nom)),CEILING(RAND()*5850+150),8)
		 SET @nom=@nom+1
	 END
	 	 	 SET @nom=681+50+60+60+20+80
	 WHILE @nom<=681+50+60+60+20+80+9
	BEGIN
		 INSERT INTO tovar (tovar_num,publisher_num,tovar_name,tovar_price,category_num )
		 VALUES (@nom,CEILING(RAND()*(50)),'����� '+LTRIM(STR(@nom)),CEILING(RAND()*130+70),9)
		 SET @nom=@nom+1
	 END
	 	 	 	 SET @nom=681+50+60+60+20+80+10
	 WHILE @nom<=681+50+60+60+20+80+10+29
	BEGIN
		 INSERT INTO tovar (tovar_num,publisher_num,tovar_name,tovar_price,category_num )
		 VALUES (@nom,CEILING(RAND()*(50)),'����� '+LTRIM(STR(@nom)),CEILING(RAND()*700+100),10)
		 SET @nom=@nom+1
	 END
	 	 	 	 	 SET @nom=681+50+60+60+20+80+10+30
	 WHILE @nom<=681+50+60+60+20+80+10+30+9
	BEGIN
		 INSERT INTO tovar (tovar_num,publisher_num,tovar_name,tovar_price,category_num )
		 VALUES (@nom,CEILING(RAND()*(50)),'����� '+LTRIM(STR(@nom)),CEILING(RAND()*250+100),5)
		 SET @nom=@nom+1
	 END
EXEC insert_tovar
SELECT *from  tovar
Delete from tovar

--������� �����-����� ��������� � ������� ��������� 
CREATE PROC insert_book_author AS
	DECLARE @nom INT, @nb INT
	SET @nom=1
	SET @nb=1
	WHILE @nb<=650
	BEGIN
		 INSERT INTO book_author(tovar_num,author_num)
		 VALUES (@nb,@nom)
		 SET @nom=@nom+1
		 SET @nb=@nb+1
		 IF @nom=105 SET @nom=1
	 END
EXEC insert_book_author
SELECT * from book_author
order by tovar_num
delete book_author
--������� �����-�������� ��������� � ������� ��������� (��������� ��������� �������������� ��� ������� ��������+��������, ��� ���� �� ��������� ����� ������, ���, ��������, ������� �������� � �.�.)


--������ ���� � ������� ������� ���������� (120)
SELECT DISTINCT tovar_num from book_author
WHERE author_num>=119 AND author_num<=127

--������ ���� ������� ����� (22)
SELECT DISTINCT tovar_num from book_author
WHERE author_num=111 OR author_num=112 OR author_num=144

--������ ���� ������� ��������� (12)
SELECT DISTINCT tovar_num from book_author
WHERE author_num=110 OR author_num=142 


--������ ���� ������� ������� ���������� (49)
SELECT DISTINCT tovar_num from book_author
WHERE author_num=111 OR author_num=112 OR author_num=151 OR author_num=156 OR author_num=161

--������ ���� ������� ��������� (40)
SELECT DISTINCT tovar_num from book_author
WHERE author_num>=113 AND author_num<=116

--������ ���� ������� ������������ ����� (51)
SELECT DISTINCT tovar_num from book_author
WHERE author_num=117 OR author_num=143 OR author_num=146 OR author_num=175

--������ ���� ������� ��������-��������������� ������� (33)
SELECT DISTINCT tovar_num from book_author
WHERE author_num=117 OR author_num=118

--������ ���� ������� ���������� ���������� (106)
SELECT DISTINCT tovar_num from book_author
WHERE author_num>=128 AND author_num<=136 

--������ ���� ������� ������-��������������� ���������� (116)
SELECT DISTINCT tovar_num from book_author
WHERE author_num>=128 AND author_num<=137 

--������ ���� ������� ���������� �������� (132)
SELECT DISTINCT tovar_num from book_author
WHERE author_num>=138 AND author_num<=143 OR author_num>=192 AND author_num<=198 

--������ ���� ������� ������� �������� (254)
SELECT DISTINCT tovar_num from book_author
WHERE author_num>=144 AND author_num<=163

--������ ���� ������� ����������� ����� (39)
SELECT DISTINCT tovar_num from book_author
WHERE author_num>=165 AND author_num<=168

--������ ���� ������� ������ (71)
SELECT DISTINCT tovar_num from book_author
WHERE author_num>=169 AND author_num<=173

--������ ���� ������� ��������� (45)
SELECT DISTINCT tovar_num from book_author
WHERE author_num>=174 AND author_num<=177

--������ ���� ������� �������� ������ (62)
SELECT DISTINCT tovar_num from book_author
WHERE author_num>=178 AND author_num<=181

--������ ���� ������� ������� (81)
SELECT DISTINCT tovar_num from book_author
WHERE author_num>=185 AND author_num<=190

--������ ���� ������� ������� ���������� (39)
SELECT DISTINCT tovar_num from book_author
WHERE author_num>=182 AND author_num<=184

--������ ���� ������� ���������� ���������� (44)
SELECT DISTINCT tovar_num from book_author
WHERE author_num>=188 AND author_num<=190

--������ ���� ������� ����� (30)
SELECT DISTINCT tovar_num from book_author
WHERE author_num>=190 AND author_num<=191

--������ ���� ������� ������� ���� (48)
SELECT DISTINCT tovar_num from book_author
WHERE author_num>=203 AND author_num<=207

--������ ���� ������� ����������� (28)
SELECT DISTINCT tovar_num from book_author
WHERE author_num>=208 AND author_num<=210

--������ ���� ������� ��������� (29)
SELECT DISTINCT tovar_num from book_author
WHERE author_num>=211 AND author_num<=213

CREATE PROC insert_book_theme AS
	DECLARE  @n INT,@c INT, @tn INT
	Set @tn=1
	SET @n=1
	WHILE @n<=650
	BEGIN
		SET @c=1

		WHILE @c<=6
		BEGIN
			 INSERT INTO book_theme(tovar_num,theme_num)
			 VALUES (@tn,1)
			 SET @n=@n+1
			 SET @c=@c+1
			 SET @tn=@tn+1
		END

		WHILE @c<=12
		BEGIN
			 INSERT INTO book_theme(tovar_num,theme_num)
			 VALUES (@tn,2)
			 SET @n=@n+1
			 SET @c=@c+1
			 SET @tn=@tn+1
		END

		 WHILE @c<=18
		 BEGIN
			 INSERT INTO book_theme(tovar_num,theme_num)
			 VALUES (@tn,3)
			 SET @n=@n+1
			 SET @c=@c+1
			 SET @tn=@tn+1
		 END

		 WHILE @c<=50
		 BEGIN
			 INSERT INTO book_theme(tovar_num,theme_num)
			 VALUES (@tn,4)
			 SET @n=@n+1
			 SET @c=@c+1
			 SET @tn=@tn+1
		 END

		 WHILE @c<=115
		 BEGIN
			 INSERT INTO book_theme(tovar_num,theme_num)
			 VALUES (@tn,5)
			 SET @n=@n+1
			 SET @c=@c+1
			 SET @tn=@tn+1
		 END

		 WHILE @c<=147
	 	 BEGIN
			 INSERT INTO book_theme(tovar_num,theme_num)
			 VALUES (@tn,6)
			 SET @n=@n+1
			 SET @c=@c+1
			 SET @tn=@tn+1
		 END

		 WHILE @c<=173
		 BEGIN
			 INSERT INTO book_theme(tovar_num,theme_num)
			 VALUES (@tn,7)
			 SET @n=@n+1
			 SET @c=@c+1
			 SET @tn=@tn+1
		 END

		 WHILE @c<=207
		 BEGIN
			 INSERT INTO book_theme(tovar_num,theme_num)
			 VALUES (@tn,8)
			 SET @n=@n+1
			 SET @c=@c+1
			 SET @tn=@tn+1
		 END

		 WHILE @c<=239
	   	 BEGIN
			 INSERT INTO book_theme(tovar_num,theme_num)
			 VALUES (@tn,9)
			 SET @n=@n+1
			 SET @c=@c+1
			 SET @tn=@tn+1
		 END

		 WHILE @c<=271
		 BEGIN
			 INSERT INTO book_theme(tovar_num,theme_num)
			 VALUES (@tn,10)
			 SET @n=@n+1
			 SET @c=@c+1
			 SET @tn=@tn+1
		 END

		 WHILE @c<=290
		 BEGIN
			 INSERT INTO book_theme(tovar_num,theme_num)
			 VALUES (@tn,11)
			 SET @n=@n+1
			 SET @c=@c+1
			 SET @tn=@tn+1
		 END

		 WHILE @c<=390
		 BEGIN

			 INSERT INTO book_theme(tovar_num,theme_num)
			 VALUES (@tn,12)
			 SET @n=@n+1
			 SET @c=@c+1
			 SET @tn=@tn+1
		 END

		 WHILE @c<=487
		 BEGIN
			 INSERT INTO book_theme(tovar_num,theme_num)
			 VALUES (@tn,13)
			 SET @n=@n+1
			 SET @c=@c+1
			 SET @tn=@tn+1
		 END

		 WHILE @c<=494
		 BEGIN
			
			 INSERT INTO book_theme(tovar_num,theme_num)
			 VALUES (@tn,14)
			 SET @n=@n+1
			 SET @c=@c+1
			 SET @tn=@tn+1
		 END

		 WHILE @c<=501
		 BEGIN
			
			 INSERT INTO book_theme(tovar_num,theme_num)
			 VALUES (@tn,15)
			 SET @n=@n+1
			 SET @c=@c+1
			 SET @tn=@tn+1
		 END

		 WHILE @c<=514
		 BEGIN
			
			 INSERT INTO book_theme(tovar_num,theme_num)
			 VALUES (@tn,16)
			 SET @n=@n+1
			 SET @c=@c+1
			 SET @tn=@tn+1
		 END

		 WHILE @c<=547
		 BEGIN
			
			 INSERT INTO book_theme(tovar_num,theme_num)
			 VALUES (@tn,17)
			 SET @n=@n+1
			 SET @c=@c+1
			 SET @tn=@tn+1
		 END

		 WHILE @c<=554
		 BEGIN
			
			 INSERT INTO book_theme(tovar_num,theme_num)
			 VALUES (@tn,18)
			 SET @n=@n+1
			 SET @c=@c+1
			 SET @tn=@tn+1
		 END

		 WHILE @c<=561
		 BEGIN
			
			 INSERT INTO book_theme(tovar_num,theme_num)
			 VALUES (@tn,19)
			 SET @n=@n+1
			 SET @c=@c+1
			 SET @tn=@tn+1
		 END

		 WHILE @c<=574
		 BEGIN
			
			 INSERT INTO book_theme(tovar_num,theme_num)
			 VALUES (@tn,20)
			 SET @n=@n+1
			 SET @c=@c+1
			 SET @tn=@tn+1
		 END

		 WHILE @c<=587
		 BEGIN
			
			 INSERT INTO book_theme(tovar_num,theme_num)
			 VALUES (@tn,21)
			 SET @n=@n+1
			 SET @c=@c+1
			 SET @tn=@tn+1
		 END

		 WHILE @c<=619
		 BEGIN
			
			 INSERT INTO book_theme(tovar_num,theme_num)
			 VALUES (@tn,22)
			 SET @n=@n+1
			 SET @c=@c+1
			 SET @tn=@tn+1
		 END

		 WHILE @c<=650
		 BEGIN
			
			 INSERT INTO book_theme(tovar_num,theme_num)
			 VALUES (@tn,23)
			 SET @n=@n+1
			 SET @c=@c+1
			 SET @tn=@tn+1
		 END
	 END
EXEC insert_book_theme
SELECT *from book_theme
SELECT *from theme
SELECT *from book_author
Delete book_theme

--������� ��� ��������� � ������� ��������� (� 2018 - 6000 �����, � 2019-8000 ����� � � 2020 - 10000 �����)

SET IDENTITY_INSERT receipt ON
CREATE PROC insert_rec AS
	DECLARE @nom INT
	SET @nom=1
	declare @begin datetime, @end datetime;
     SET @begin ='2018-01-01T00:00:00'  
	 SET @end = '2018-12-31T00:00:00';
	WHILE @nom<=6000
	BEGIN
		 INSERT INTO receipt(receipt_num,receipt_date)
		 VALUES (@nom,cast(cast(@begin as float) + (cast(@end as float) - cast(@begin as float)) * rand() as datetime))
		 SET @nom=@nom+1
	 END
	 SET @nom=6001
     SET @begin ='2019-01-01T00:00:00'  
	 SET @end = '2019-12-31T00:00:00';
	 	WHILE @nom<=14000
	BEGIN
		 INSERT INTO receipt(receipt_num,receipt_date)
		 VALUES (@nom,cast(cast(@begin as float) + (cast(@end as float) - cast(@begin as float)) * rand() as datetime))
		 SET @nom=@nom+1
	 END
	 SET @nom=14001
     SET @begin ='2020-01-01T00:00:00'  
	 SET @end = '2020-12-31T00:00:00';
	 WHILE @nom<=24000
   	 BEGIN
		 INSERT INTO receipt(receipt_num,receipt_date)
		 VALUES (@nom,cast(cast(@begin as float) + (cast(@end as float) - cast(@begin as float)) * rand() as datetime))
		 SET @nom=@nom+1
	 END
EXEC insert_rec
SELECT *from receipt
delete receipt

--������� ������� - ��������� � ������� ���������

--������ ������ ����������
SELECT sell_num, sell_price, sell_count, receipt_num, buyer_num, s.tovar_num, th.theme_num, theme_name
FROM sell s,  book_theme bth, theme th
WHERE
s.tovar_num=bth.tovar_num AND
bth.theme_num=th.theme_num AND
buyer_num>=886 
order by th.theme_num
--������ ������ ��������
SELECT sell_num, sell_price, sell_count, receipt_num, buyer_num, s.tovar_num, th.theme_num, theme_name
FROM sell s,  book_theme bth, theme th
WHERE
s.tovar_num=bth.tovar_num AND
bth.theme_num=th.theme_num AND
buyer_num>=594 AND
buyer_num<=885 
order by th.theme_num

--������ ������ ��������
SELECT sell_num, sell_price, sell_count, receipt_num, buyer_num, s.tovar_num, th.theme_num, theme_name
FROM sell s,  book_theme bth, theme th
WHERE
s.tovar_num=bth.tovar_num AND
bth.theme_num=th.theme_num AND
buyer_num>=352 AND
buyer_num<=593 
order by th.theme_num

--������ ������ �������
SELECT sell_num, sell_price, sell_count, receipt_num, buyer_num, s.tovar_num, th.theme_num, theme_name
FROM sell s,  book_theme bth, theme th
WHERE
s.tovar_num=bth.tovar_num AND
bth.theme_num=th.theme_num AND
buyer_num<=351 
order by th.theme_num

--������ ������ �������� �������� � �������
SELECT sell_num, sell_price, sell_count, receipt_num, buyer_num, s.tovar_num, th.theme_num, theme_name
FROM sell s,  book_theme bth, theme th
WHERE
s.tovar_num=bth.tovar_num AND
bth.theme_num=th.theme_num AND
buyer_num>=352  AND buyer_num<=467
OR
s.tovar_num=bth.tovar_num AND
bth.theme_num=th.theme_num AND buyer_num<=235
order by th.theme_num

--������ ������ �������� �������� � �������
SELECT sell_num, sell_price, sell_count, receipt_num, buyer_num, s.tovar_num, th.theme_num, theme_name
FROM sell s,  book_theme bth, theme th
WHERE
s.tovar_num=bth.tovar_num AND
bth.theme_num=th.theme_num AND
buyer_num>=236  AND buyer_num<=351
OR
s.tovar_num=bth.tovar_num AND
bth.theme_num=th.theme_num AND buyer_num>=468 AND buyer_num<=593
order by th.theme_num

--������ ������ �������� �������� � ����������
SELECT sell_num, sell_price, sell_count, receipt_num, buyer_num, s.tovar_num, th.theme_num, theme_name
FROM sell s,  book_theme bth, theme th
WHERE
s.tovar_num=bth.tovar_num AND
bth.theme_num=th.theme_num AND
buyer_num>=967 
OR
s.tovar_num=bth.tovar_num AND
bth.theme_num=th.theme_num AND buyer_num>=755 AND buyer_num<=885
order by th.theme_num

--������ ������ �������� �������� � ����������
SELECT sell_num, sell_price, sell_count, receipt_num, buyer_num, s.tovar_num, th.theme_num, theme_name
FROM sell s,  book_theme bth, theme th
WHERE
s.tovar_num=bth.tovar_num AND
bth.theme_num=th.theme_num AND
buyer_num>=594 AND buyer_num<=754
OR
s.tovar_num=bth.tovar_num AND
bth.theme_num=th.theme_num AND buyer_num>=886 AND buyer_num<=966
order by th.theme_num



CREATE PROCEDURE insert_sell_all 
AS
DECLARE @rn Int
BEGIN
DECLARE cur1 CURSOR FOR 
SELECT receipt_num FROM receipt

OPEN cur1
FETCH cur1 INTO @rn

WHILE @@FETCH_STATUS=0
BEGIN
		DECLARE @ver_rn numeric(6), @x FLOAT,@tn numeric(6),@p decimal(6), @y FLOAT, @count numeric(6), @bn numeric(6), @sn numeric(6), @z FLOAT, @g CHAR(1), @h FLOAT, @OSN FLOAT, @data FLOAT
				SET @x= RAND()
		SET @bn=CEILING(RAND()*(1007))
		SET @sn=CEILING(RAND()*(300))
		IF @x<=0.4 -- � ������������ 0.2 - 2 �����
			SET @ver_rn=2
		IF @x<=0.2-- � ������������ 0.2 - 3 �����
			SET @ver_rn=3
		IF @x<=0.1 -- � ������������ 0.3 - 4 �����
			SET @ver_rn=4
		IF @x<=0.09 -- � ������������ 0.1 - 5 ����
			 SET @ver_rn=5
		IF @x>=0.5 -- � ������������ 0.5 - 1 �����
			SET @ver_rn=1

		 WHILE @ver_rn>=1
		 BEGIN
			SET @y=RAND()
			SET @OSN=RAND()

			IF @OSN >=0.3
			BEGIN
						IF @y<=0.3 -- � ������������ 0.3 - 2 �����
						SET @count=2
						IF @y<=0.1 -- � ������������ 0.1 - 3 ����
						SET @count=3
						IF @y>0.3 -- � ������������ 0.7 - 1 �����
						SET @count=1
						SET @tn=CEILING(RAND()*(650))

						SET @z=RAND()
						IF @bn>=886 -- ��������� (60% - ������� � ���������� ����������)
						BEGIN
						IF @z<=0.65 -- � ������������ 0.6
							SET @tn=(SELECT TOP 1 tovar_num FROM book_theme WHERE theme_num=16 OR theme_num=17  ORDER BY NEWID())
						IF @z>0.65  -- � ������������ 0.4 
							SET @tn=CEILING(RAND()*(650))
						END

						IF @bn>=594 AND @bn<=885 --�������� (60% - ������� ����������)
						BEGIN
						IF @z<=0.65 -- � ������������ 0.6
							SET @tn=(SELECT TOP 1 tovar_num FROM book_theme WHERE theme_num=5  ORDER BY NEWID())
						IF @z>0.65  -- � ������������ 0.4 
							SET @tn=CEILING(RAND()*(650))
						END

						IF @bn>=352 AND @bn<=593 --�������� (60% - ��������-����. ������ + ��������� + ����������� �����)
						BEGIN
						IF @z<=0.65 -- � ������������ 0.6
							SET @tn=(SELECT TOP 1 tovar_num FROM book_theme WHERE theme_num=4 OR theme_num=8 OR theme_num=10 ORDER BY NEWID())
						IF @z>0.65 -- � ������������ 0.4 
							SET @tn=CEILING(RAND()*(650))
						END

						IF @bn<=351 --������� (60% - �����.����� + ������� ��������)
						BEGIN
						IF @z<=0.65 -- � ������������ 0.6
							SET @tn=(SELECT TOP 1 tovar_num FROM book_theme WHERE theme_num=11 OR theme_num=12   ORDER BY NEWID())
						IF @z>0.65 -- � ������������ 0.4 
							SET @tn=CEILING(RAND()*(650))
						END
			 
						SET @h= RAND()
						SET @g=(SELECT buyer_gender from buyer WHERE buyer_num=@bn)

						-- ������� � �������� ������� (60% - ����������� 20,  ��������� 21,  ������� ���������� 23)
						IF (@g='�' AND @bn<=235 AND NOT EXISTS(SELECT tovar_num FROM book_theme WHERE (theme_num=11 OR theme_num=12) AND tovar_num=@tn)) OR (@g='�' AND @bn>=352 AND @bn<=467 AND NOT EXISTS(SELECT tovar_num FROM book_theme WHERE (theme_num=4 OR theme_num=8 OR theme_num=10)  AND tovar_num=@tn)) 
						BEGIN
						IF @h<=0.6 -- � ������������ 0.6
							SET @tn=(SELECT TOP 1 tovar_num FROM book_theme WHERE theme_num=20 OR theme_num=21 OR theme_num=23   ORDER BY NEWID())
						IF @h>0.6 -- � ������������ 0.4 
							SET @tn=CEILING(RAND()*(650))
						END

						--�������� � ������� ������� (60% -  �����.������� 18 � ������� ���� 19)
						IF (@g='M' AND @bn>=236  AND @bn<=351 AND NOT EXISTS(SELECT tovar_num FROM book_theme WHERE (theme_num=11 OR theme_num=12) AND tovar_num=@tn)) OR (@g='M' AND @bn>=468 AND @bn<=593 AND NOT EXISTS(SELECT tovar_num FROM book_theme WHERE (theme_num=4 OR theme_num=8 OR theme_num=10) AND tovar_num=@tn )) 
						BEGIN
						IF @h<=0.6 -- � ������������ 0.6
							SET @tn=(SELECT TOP 1 tovar_num FROM book_theme WHERE theme_num=18 OR theme_num=19  ORDER BY NEWID())
						IF @h>0.6-- � ������������ 0.4 
							SET @tn=CEILING(RAND()*(650))
						END

						--��������� � �������� ������� (60% - ���������� �������� 13)
						IF (@g='M' AND @bn>=967  AND NOT EXISTS(SELECT tovar_num FROM book_theme WHERE (theme_num=16 OR theme_num=17) AND tovar_num=@tn)) OR (@g='M' AND @bn>=755 AND @bn<=885 AND NOT EXISTS(SELECT tovar_num FROM book_theme WHERE theme_num=5 AND tovar_num=@tn)) 
						BEGIN
						IF @h<=0.8 -- � ������������ 0.6
							SET @tn=(SELECT TOP 1 tovar_num FROM book_theme WHERE theme_num=13  ORDER BY NEWID())
						IF @h>0.8 -- � ������������ 0.4 
							SET @tn=CEILING(RAND()*(650))
						END

						--��������� � �������� ������� (60% - �������� ������ 22)
						IF (@g='�' AND @bn>=886 AND @bn<=966  AND NOT EXISTS(SELECT tovar_num FROM book_theme WHERE (theme_num=16 OR theme_num=17) AND  tovar_num=@tn)) OR (@g='�' AND @bn>=594 AND @bn<=754 AND NOT EXISTS(SELECT tovar_num FROM book_theme WHERE theme_num=5 AND tovar_num=@tn)) 
						BEGIN
						IF @h<=0.8 -- � ������������ 0.6
							SET @tn=(SELECT TOP 1 tovar_num FROM book_theme WHERE theme_num=22   ORDER BY NEWID())
						IF @h>0.8 -- � ������������ 0.4 
							SET @tn=CEILING(RAND()*(650))
						END
						--��������� 6 ������-���������������, 7 ���������� ����������
						IF EXISTS(SELECT receipt_num FROM receipt WHERE MONTH(receipt_date)=9  AND  receipt_num=@rn) 
						BEGIN
						SET @data=RAND()
						IF @data<=0.7
						SET @tn=(SELECT TOP 1 tovar_num FROM book_theme WHERE theme_num=6 OR  theme_num=7 ORDER BY NEWID())
						IF @data>0.7
						SET @tn=CEILING(RAND()*650)
						END
			END

			IF @OSN<0.3
			BEGIN
						IF @y<=0.8 -- � ������������ 0.3 - 2 �����
						SET @count=2
						IF @y<=0.5 -- � ������������ 0.2 - 3 ����
						SET @count=3
						IF @y<=0.3 -- � ������������ 0.1 - 4 ����
						SET @count=4
						IF @y<=0.2 -- � ������������ 0.1 - 5 ����
						SET @count=5
						IF @y<=0.1 -- � ������������ 0.05 - 6 ����
						SET @count=6
						IF @y<=0.05 -- � ������������ 0.05 - 7 ����
						SET @count=7
						IF @y>0.8 -- � ������������ 0.2 - 1 �����
						SET @count=1
			--������� - 10 ��������,5 ���������, 2 �������� 80%
				IF EXISTS(SELECT receipt_num FROM receipt WHERE MONTH(receipt_date)=12  AND  receipt_num=@rn) 
				BEGIN
				SET @data=RAND()
				IF @data<=0.85
				SET @tn=(SELECT TOP 1 tovar_num FROM tovar WHERE category_num=5  OR category_num=2 OR category_num=10  ORDER BY NEWID())
				IF @data>0.85
				SET @tn=CEILING(RAND()*349+651)
				END
			--���������3 �������, 6 ���������� 80%
				IF EXISTS(SELECT receipt_num FROM receipt WHERE MONTH(receipt_date)=9  AND  receipt_num=@rn) 
				BEGIN
				SET @data=RAND()
				IF @data<=0.85
				SET @tn=(SELECT TOP 1 tovar_num FROM tovar WHERE category_num=3  OR category_num=6  ORDER BY NEWID())
				IF @data>0.85
				SET @tn=CEILING(RAND()*349+651)
						IF @y<=0.8 -- � ������������ 0.3 - 7 �����
						SET @count=7
						IF @y<=0.5 -- � ������������ 0.2 - 5 ����
						SET @count=5
						IF @y<=0.3 -- � ������������ 0.1 - 4 ����
						SET @count=4
						IF @y<=0.2 -- � ������������ 0.1 - 3 ����
						SET @count=3
						IF @y<=0.1 -- � ������������ 0.05 - 2 ����
						SET @count=2
						IF @y<=0.05 -- � ������������ 0.05 - 1 ����
						SET @count=1
						IF @y>0.8 -- � ������������ 0.2 - 6 �����
						SET @count=6
				END
			END
			
			SET @p=(SELECT tovar_price from tovar WHERE tovar_num=@tn)

			 INSERT INTO sell(sell_price,sell_count,seller_num ,receipt_num ,buyer_num ,tovar_num)
			 VALUES (@p,@count,@sn , @rn,@bn ,@tn)
			 SET @ver_rn=@ver_rn-1
		 END
		 SET @rn=@rn+1

FETCH cur1 INTO @rn
END

DEALLOCATE cur1
END
GO
Exec insert_sell_all
delete sell
select*from sell
order by tovar_num
select*from receipt
select*from tovar


CREATE PROC Discounts AS
DECLARE cur1 CURSOR FOR SELECT receipt_num FROM receipt
DECLARE @rn NUMERIC(6),
 @sr Decimal(6),
 @k INT

OPEN cur1
FETCH cur1 INTO @rn
WHILE @@FETCH_STATUS=0
 BEGIN
-- ������� ����� ���� � ������� ������
SELECT @sr=SUM(sell_price*sell_count), @k=
 (CASE
WHEN @sr>5000 THEN 15
WHEN @sr>1000 AND @sr<=1999 THEN 5
WHEN @sr>2000 AND @sr<=4999 THEN 10
ELSE 0
 END)
 FROM sell WHERE @rn=receipt_num
-- ���������� ������ � ���
UPDATE receipt SET  receipt_discount=@k WHERE @rn=receipt_num
-- ��������� ���� � ���� �� ������� ������
UPDATE receipt SET receipt_price=@sr*(100.0-@k)/100.0
WHERE @rn=receipt_num
FETCH cur1 INTO @rn
END
DEALLOCATE cur1
exec Discounts
select*from receipt order by receipt_price
select*from tovar
select*from sell where receipt_num=18473
