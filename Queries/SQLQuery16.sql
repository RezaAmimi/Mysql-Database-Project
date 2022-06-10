create table BranchCustomer(
Branch_key    varchar(20),
Customer_Key    varchar,
primary key (Branch_key,Customer_Key),
foreign key (Branch_key) references Branch,
foreign key (Customer_Key) references Customer);
