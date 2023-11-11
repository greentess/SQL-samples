SELECT * FROM fullSalesTable WHERE tovar_name IS NULL
SELECT * FROM fullSalesTable WHERE category_name IS NULL
SELECT * FROM fullSalesTable WHERE publisher_name IS NULL
SELECT * FROM fullSalesTable WHERE theme_name IS NULL
SELECT * FROM fullSalesTable WHERE YEAR(receipt_date) NOT IN
(2018,2019,2020)
SELECT COUNT(*) FROM fullSalesTable
SELECT COUNT(*) FROM sell

--����� 2400 ����� �� ������� ��� �� ���� ������������� � ������� ������ - ��� �����
SELECT * FROM receipt WHERE receipt_num NOT IN
 (SELECT receipt_num FROM sell )

--��� ���� ����� ������� ��� �� ����������� ������� �������� ������� - ������ ���� ���������, ����� 1 (����� ����)
 CREATE PROCEDURE insert_sell_ostatok2
AS
DECLARE @rn Int
BEGIN
DECLARE cur1 CURSOR FOR 
SELECT receipt_num FROM receipt WHERE receipt_num NOT IN
 (SELECT receipt_num FROM sell )

OPEN cur1
FETCH cur1 INTO @rn

WHILE @@FETCH_STATUS=0
BEGIN
		DECLARE @ver_rn numeric(6), @x FLOAT,@tn numeric(6),@p decimal(6), @y FLOAT, @count numeric(6), @bn numeric(6), @sn numeric(6)
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

			SET @tn=(SELECT TOP 1 tovar_num FROM tovar WHERE category_num=2  OR category_num=3 OR category_num=4  OR category_num=5 OR category_num=6  OR category_num=7 OR category_num=8 OR category_num=9  OR category_num=10  ORDER BY NEWID())
			
			SET @p=(SELECT tovar_price from tovar WHERE tovar_num=@tn)

			 INSERT INTO sell(sell_price,sell_count,seller_num ,receipt_num ,buyer_num ,tovar_num)
			 VALUES (@p,@count,@sn , @rn,@bn ,@tn)
			 SET @ver_rn=@ver_rn-1
		 END
		 --SET @rn=@rn+1

FETCH cur1 INTO @rn
END

DEALLOCATE cur1
END
GO
Exec insert_sell_ostatok2

--��� ���� ��������� � ��������
select*from sell order by receipt_num
--�� ������ �� �� ���� ����� ������� ������ � ����� ���������
select*from receipt
select*from tovar

--������������ ��������� � ������ ��� ����������� �����
CREATE PROC DiscountsFORostatok AS
DECLARE cur1 CURSOR FOR SELECT receipt_num FROM receipt WHERE receipt_price IS NULL
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
exec DiscountsFORostatok

--���������, ��� ��� ���� ����� ���������� ��������� � ������
select*from receipt WHERE receipt_price IS NULL




