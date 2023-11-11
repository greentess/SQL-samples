--������� ������, ������� �������� ��� ��������� ���������� � ��������:
CREATE VIEW fullSalesViewNEWNEW AS
SELECT sell_num, r.receipt_num, t.tovar_num, tovar_name, category_name, theme_name,author_name, buyer_name, buyer_date,buyer_gender, publisher_name,seller_name, dept_name,
 k.store_num, store_name,  store_town, receipt_date, t.tovar_price, sell_count
FROM sell s JOIN receipt r ON s.receipt_num=r.receipt_num
 JOIN buyer b ON b.buyer_num=s.buyer_num
 JOIN seller pro ON pro.seller_num=s.seller_num
 JOIN dept dp ON dp.dept_num=pro.dept_num
 JOIN tovar t ON t.tovar_num=s.tovar_num
 JOIN store k ON k.store_num=dp.store_num
 JOIN publisher p ON p.publisher_num=t.publisher_num
 JOIN category c ON c.category_num=t.category_num
 Left JOIN book_theme bt ON bt.tovar_num=t.tovar_num 
 Left JOIN theme m ON m.theme_num=bt.theme_num
 Left JOIN book_author ba ON ba.tovar_num=t.tovar_num 
 Left JOIN author a ON a.author_num=ba.author_num

 --������� ������, ������� ��������  ��������� ���������� � �������� (��� ������ ����):
 SELECT r.receipt_num, tovar_name, category_name, publisher_name,seller_name, dp.dept_num,
 store_name,  store_town, receipt_date,  t.tovar_price, sell_count
FROM sell s JOIN receipt r ON s.receipt_num=r.receipt_num
 JOIN seller pro ON pro.seller_num=s.seller_num
 JOIN dept dp ON dp.dept_num=pro.dept_num
 JOIN tovar t ON t.tovar_num=s.tovar_num
 JOIN store k ON k.store_num=dp.store_num
 JOIN publisher p ON p.publisher_num=t.publisher_num
 JOIN category c ON c.category_num=t.category_num



 CREATE TABLE fullSalesTable
(
sell_num NUMERIC(6),
receipt_num NUMERIC(6),
tovar_name VARCHAR(100), 
category_name VARCHAR(100), 
theme_name VARCHAR(100) ,
author_name VARCHAR(100) , 
buyer_name VARCHAR(100) , 
publisher_name  VARCHAR(100) ,
seller_name VARCHAR(100) , 
dept_name VARCHAR(100) ,
store_name VARCHAR(100) ,  
store_town VARCHAR(100) , 
receipt_date DATE, 
tovar_price decimal(6), 
sell_count numeric(6)
CONSTRAINT pk_sales PRIMARY KEY(sell_num, tovar_name, buyer_name, seller_name, receipt_num)
)
INSERT INTO fullSalesTable SELECT * FROM fullSalesView
SELECT * FROM fullSalesViewNEW

--������� ������ ������� ������ � �� ����� ����� ������� ������ ���������?
SELECT tovar_name AS ��������������, seller_name AS �����������, SUM(sell_count) AS ����������, SUM(sell_count*tovar_price) AS ���������
FROM fullSalesView
GROUP BY tovar_name, seller_name

--������� ������ ������ ��������� ������� � �� ����� ����� ������� � ������ ������?
SELECT category_name AS ���������, dept_name AS �����,
 SUM(sell_count) AS ����������,
 SUM(sell_count*tovar_price) AS ���������
FROM fullSalesView GROUP BY category_name, dept_name

--������� ������ ������ ��������� ������� � �� ����� ����� ������� � ������ ������?
SELECT category_name AS ���������, store_town AS �����,
SUM(sell_count) AS ����������,
SUM(sell_count*tovar_price) AS ���������
FROM fullSalesView GROUP BY category_name, store_town

--�� ����� ����� ������� ���� � ������ ������� � ������� �������� �������� �����?
SELECT store_name AS �������, SUM(sell_count*tovar_price) AS ���������
FROM fullSalesView
WHERE category_name='�����'
GROUP BY store_name
ORDER BY 2 DESC

--����� ������ ���� � ����� '������-��������������� ����������' �� ������� � ������� �������� ������?
SELECT MONTH(receipt_date) AS �����,
SUM(sell_count*tovar_price) AS ���������
FROM fullSalesView
WHERE theme_name='������-��������������� ����������'
GROUP BY MONTH(receipt_date)
ORDER BY 2 DESC

--�� ����� ��������� � ������ ������ ���� ������� ������ ������ ���������? 
CREATE VIEW ViewExcel AS
SELECT category_name AS ���������,  MONTH(receipt_date) AS �����,
SUM(sell_count*tovar_price) AS ���������
FROM fullSalesView GROUP BY category_name, MONTH(receipt_date)

--� ������� ����������� ������ � ��������� ������ 136� � �������� ������� 44� �� 2018 ���?
CREATE PROC detailSales
@store_name VARCHAR(100),
@tovar_name VARCHAR(100),
@year INT
AS
SELECT SUM(sell_count*tovar_price) FROM fullSalesView
WHERE store_name=@store_name AND tovar_name=@tovar_name  AND
YEAR(receipt_date)=@year 
GO
EXEC detailSales
'������� ������� 44', '����� 136', 2018


--�������, � ������� ������� -  ������, � ������ -   ����� ���� � ����� ������ �� �������?

SELECT  theme_name, [01], [02] ,[03], [04], [05] ,[06], [07], [08], [09], [10], [11], [12]
FROM (  
    select theme_name,sell_cp=sell_count*tovar_price, sell_month = month(receipt_date)
    from  fullSalesView a
) a
PIVOT (SUM(sell_cp) FOR sell_month IN ([01], [02] ,[03], [04], [05] ,[06], [07], [08], [09], [10], [11], [12])) AS PIVOTtable
