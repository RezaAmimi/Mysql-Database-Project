create table loan_account(
Account_ID     varchar,
loan_value float,
interest_date date,
cycle int,
primary key (Account_ID),
foreign key (Account_ID) references Account
);