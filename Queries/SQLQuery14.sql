create table Customer(
Customer_Key    varchar,
Customer_Name    varchar,
Customer_Date_Of_Birth    numeric,
Phone_No        numeric,
customer_risk_profile_key    varchar,
Customer_Demographic_Key      varchar,
primary key (Customer_Key),
foreign key (customer_risk_profile_key) references Customer_Risk_profile,
foreign key (Customer_Demographic_Key) references Customer_Demographic);
