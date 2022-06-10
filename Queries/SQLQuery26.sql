create table ProductAccount(
Product_Key         varchar,
Account_ID     varchar,
primary key (Product_Key,Account_ID),
foreign key (Product_Key) references Product,
foreign key (Account_ID) references Account  
);