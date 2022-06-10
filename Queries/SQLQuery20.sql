create table Account(
Account_ID     varchar,
Account_NO     numeric,
Account_Type   varchar,
Account_Password  varchar,
Account_Opent_Date  Date,
Account_Status_Key      varchar(10),
Branch_key    varchar(20),
primary key (Account_ID),
foreign key (Account_Status_Key) references Account_Status,
foreign key (Branch_Key) references Branch);
