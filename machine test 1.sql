
CREATE TABLE SHOP(
SHOPID INT PRIMARY KEY, 
	SHOPNAME VARCHAR(25)
)
INSERT INTO SHOP VALUES (1,'Amal Stores'), (2,'Jyothi Stores'), (3,'Indira Stores') 
CREATE TABLE ITEM(ITEMID INT PRIMARY KEY,
	ITEMNAME VARCHAR(20)
)
INSERT INTO ITEM VALUES (1,'Bar-One'), (2,'KitKat'), (3,'MilkyBar'), (4,'Munch')

CREATE TABLE details (
   ID INT PRIMARY KEY IDENTITY,
    ShopID INT,
    ItemID INT,
    Quantity INT,
	UnitPrice DECIMAL(10, 2),
	SaleDate DATE,
    FOREIGN KEY (ShopID) REFERENCES SHOP (SHOPID),
    FOREIGN KEY (ItemID) REFERENCES ITEM (ITEMID)
);

insert into details values
   ( 1, 1, 100, 10.00,'05-Oct-2018'),
    ( 1, 2, 200, 15.00,'05-Oct-2018'),
    ( 1, 3, 50, 5.00,'05-Oct-2018'),
    ( 1, 4, 150, 10.00,'05-Oct-2018'),
    (2, 1, 10 * 28, 280.00,'10-Oct-2018'),
    ( 2, 2, 30 * 28, 420.00,'10-Oct-2018'),
    (2, 3, 40 * 28, 140.00,'10-Oct-2018'),
    ( 2, 4, 20 * 28, 280.00,'10-Oct-2018'),
    (3, 1, 50 * 28, 280.00,'15-Sep-2018'),
    (3, 2, 70 * 28, 420.00,'15-Sep-2018'),
    (3, 3, 30 * 28, 140.00,'10-Oct-2018'),
    (1, 1, 150, 10.00,'15-Sep-2018'),
    (1, 2, 250, 15.00,'15-Sep-2018'),
    ( 1, 4, 200, 10.00,'10-Oct-2018');

select * from item
select * from details
select * from shop

q.1.2

select top(1) i.itemname, SUM(d.quantity * d.unitprice) as Revenue
from details d JOIN item i on d.itemid =i.itemid
where datepart(m, d.saledate) = 10
group by i.itemname
order by Revenue desc

q.1.3
select top(1) i.itemname, sum(d.quantity) as TotalQuantity
from details d JOIN item i on d.itemid = i.itemid
where datepart(M,d.SaleDate) = 10 and d.shopid=1
group by i.itemname order by TotalQuantity desc

--	q.1.4
select i.itemname,SUM(d.Quantity * d.UnitPrice) AS Revenue
from details d  JOIN Item I on d.ItemID = I.ItemID
where datepart(m,d.SaleDate) = 10
group by i.itemName
having SUM(d.Quantity * d.UnitPrice) > 10000
order by Revenue desc;

--q.1.5
select top(1) s.shopname, sum(d.quantity*d.unitprice) as revenue
from details d join shop s on s.shopid=d.shopid
where datepart(m,d.SaleDate) = 10
group by s.shopname
order by revenue desc
    

