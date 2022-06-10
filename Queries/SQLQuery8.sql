create table EmployeeDepartment(
Employee_ID   varchar(10),
Department_key varchar(20),
primary key (Employee_ID,Department_key),
foreign key (Employee_ID) references Employee,
foreign key (Department_key) references Department);
