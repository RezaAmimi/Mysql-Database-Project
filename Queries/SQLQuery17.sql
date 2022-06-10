create table Loan(
Loan_No       numeric,
Loan_Amount   numeric,
Account_ID     varchar,
primary key (Loan_No),
foreign key (Account_ID) references Account);