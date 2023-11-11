USE MyBook

--+_______________________________________________________________________________________________________________________
CREATE TABLE publisher 
	(publisher_num NUMERIC(6) PRIMARY KEY,
	 publisher_name VARCHAR(100) NOT NULL,
	)
--+_______________________________________________________________________________________________________________________
CREATE TABLE category
	(category_num NUMERIC(6) PRIMARY KEY,
	 category_name VARCHAR(100) NOT NULL,
	)
--+_______________________________________________________________________________________________________________________
CREATE TABLE tovar
	(tovar_num NUMERIC(6)  PRIMARY KEY,
	 publisher_num NUMERIC(6),
	 tovar_name VARCHAR(100) NOT NULL,
	 tovar_price decimal(6),
	 category_num NUMERIC(6),
	 CONSTRAINT fk_tovar_publisher_num FOREIGN KEY (publisher_num)  REFERENCES publisher (publisher_num)  ,
	 CONSTRAINT fk_tovar_category_num FOREIGN KEY (category_num)  REFERENCES category (category_num)  
	)
--+_______________________________________________________________________________________________________________________
 CREATE TABLE theme 
	(theme_num NUMERIC(6) IDENTITY  PRIMARY KEY,
	 theme_name VARCHAR(100) NOT NULL,
	)
--+_______________________________________________________________________________________________________________________
CREATE TABLE book_theme
	(tovar_num NUMERIC(6),
	 theme_num NUMERIC(6),
		 CONSTRAINT pk_book_theme PRIMARY KEY (tovar_num), 
	 	 CONSTRAINT fk_tovar_book_num FOREIGN KEY (tovar_num)  REFERENCES tovar (tovar_num) ,
		 CONSTRAINT fk_book_theme_num FOREIGN KEY (theme_num)  REFERENCES theme (theme_num),
	)
--+_______________________________________________________________________________________________________________________
CREATE TABLE author
	(author_num NUMERIC(6) IDENTITY PRIMARY KEY,
	 author_name VARCHAR(100) NOT NULL,
	 author_date DATE,
	)
--+_______________________________________________________________________________________________________________________
CREATE TABLE book_author
	(tovar_num NUMERIC(6),
	 author_num NUMERIC(6),
	 	 CONSTRAINT pk_book_author PRIMARY KEY (tovar_num, author_num), 
	 	 CONSTRAINT fk_tovar1_book_num FOREIGN KEY (tovar_num)  REFERENCES tovar (tovar_num) ,
		 CONSTRAINT fk_tovar_author_num FOREIGN KEY (author_num)  REFERENCES author (author_num),
	)
--+_______________________________________________________________________________________________________________________
CREATE TABLE buyer
	(buyer_num NUMERIC(6) PRIMARY KEY,
	 buyer_name VARCHAR(100) NOT NULL,
	 buyer_date Date,
	 buyer_gender CHAR(1),
		CHECK(buyer_gender IN ('M','Æ')), 
	 buyer_phone VARCHAR(12),
	)
		
CREATE TABLE receipt
	(receipt_num NUMERIC(6)PRIMARY KEY,
	 receipt_date DATE,
	 receipt_discount  NUMERIC(3),
	 receipt_price  decimal(6) ,
	)

--+_______________________________________________________________________________________________________________________
CREATE TABLE store
	(store_num NUMERIC(6)  PRIMARY KEY,
	 store_name VARCHAR(100) NOT NULL,
	 store_town VARCHAR(100),
	)

--+_______________________________________________________________________________________________________________________
CREATE TABLE dept
	(dept_num NUMERIC(6)  PRIMARY KEY,
	 dept_name VARCHAR(100),
	 store_num NUMERIC(6),
	 dept_address VARCHAR(100),
	 dept_phone VARCHAR(12),
	 CONSTRAINT fk_dept_store_num FOREIGN KEY (store_num)  REFERENCES store (store_num),
	)
--+_______________________________________________________________________________________________________________________
CREATE TABLE seller
	(seller_num NUMERIC(6) IDENTITY  PRIMARY KEY,
	 seller_name VARCHAR(100) NOT NULL,
	 dept_num NUMERIC(6),
	 CONSTRAINT fk_seller_dept_num  FOREIGN KEY ( dept_num )  REFERENCES dept ( dept_num ),
	)
--+_______________________________________________________________________________________________________________________
CREATE TABLE sell
	(sell_num numeric (6) IDENTITY  PRIMARY KEY,
	 sell_price decimal(6) ,
	 sell_count numeric(6) ,
	 seller_num NUMERIC(6),
	 receipt_num NUMERIC(6),
	 buyer_num NUMERIC(6),
	 tovar_num NUMERIC(6), 
	 CONSTRAINT fk_sell_seller_num FOREIGN KEY (seller_num)  REFERENCES seller (seller_num),
	 CONSTRAINT fk_sell_receipt_num FOREIGN KEY (receipt_num)  REFERENCES receipt (receipt_num),
	 CONSTRAINT fk_sell_buyer_num FOREIGN KEY ( buyer_num)  REFERENCES  buyer ( buyer_num),
	 CONSTRAINT fk_sell_book_num FOREIGN KEY (tovar_num)  REFERENCES tovar (tovar_num),
	)