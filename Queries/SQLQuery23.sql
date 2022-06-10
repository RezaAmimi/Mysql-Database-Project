create table saving_account(
Account_ID     varchar,
interest_rate float,
Overdraft_limits float,
primary key (Account_ID),
foreign key (Account_ID) references Account
);