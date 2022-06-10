create table checking_account(
Account_ID     varchar,
minumum_balance int,
service_Charges int,
primary key (Account_ID),
foreign key (Account_ID) references Account
);