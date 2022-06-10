create table Department(
Department_key   varchar(20),
Department_NO    numeric,
Department_description varchar,
Branch_key varchar(20)
Primary key (Department_key),
foreign key (Branch_key) references Branch);
