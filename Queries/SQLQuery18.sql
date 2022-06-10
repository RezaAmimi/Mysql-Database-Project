create table Transactions(
Transaction_ID       varchar,
Customer_ID          varchar,
Transaction_Name     varchar,
Transaction_Date    Date,
Product_Key         varchar,
primary key (Transaction_ID),
foreign key (Product_Key) references Product,
foreign key (Customer_ID) references Customer);
