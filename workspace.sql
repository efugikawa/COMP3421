drop database if exists pda;
create database pda;
use pda;

drop table if exists Agents;
create table Agents (
  agentID int,
  agentName varchar(20) NOT NULL,
  Primary Key (agentID)
) ;

load data local infile "C:/Users/eliza/github/COMP3421/agents_data.txt" into table Agents
fields terminated by "\t"
lines terminated by "\r\n";

drop table if exists Tickets;
create table Tickets (
  ticketID int,
  category varchar(20) NOT NULL,
  timeOpened datetime,
  timeClosed datetime,
  Primary Key (ticketID)
) ;

load data local infile "C:/Users/eliza/github/COMP3421/tickets_data.txt" into table Tickets
fields terminated by "\t"
lines terminated by "\r\n";

drop table if exists Customers;
create table Customers (
  customerID int,
  customerName varchar(40) NOT NULL,
  jobTitle varchar(20) NOT NULL,
  Primary Key (customerID)
) ;

load data local infile "C:/Users/eliza/github/COMP3421/customers_data.txt" into table Customers
fields terminated by "\t"
lines terminated by "\r\n";

drop table if exists Companies;
create table Companies(
  companyID int,
  companyName varchar(40) NOT NULL,
  industry varchar(20) NOT NULL,
  Primary Key (companyID)
) ;

load data local infile "C:/Users/eliza/github/COMP3421/companies_data.txt" into table Companies
fields terminated by "\t"
lines terminated by "\r\n";

drop table if exists Handle;
create table Handle(
  agentID int,
  ticketID int,
  rating int,
  Primary Key (agentID, ticketID, rating),
  Foreign Key (agentID) references Agents(agentID),
  Foreign Key (ticketID) references Tickets(ticketID)
) ;

load data local infile "C:/Users/eliza/github/COMP3421/handles_data.txt" into table Handle
fields terminated by "\t"
lines terminated by "\r\n";

drop table if exists Open;
create table Open(
  customerID int,
  ticketID int,
  Primary Key (customerID, ticketID),
  Foreign Key (customerID) references Customers(customerID),
  Foreign Key (ticketID) references Tickets(ticketID)
) ;

load data local infile "C:/Users/eliza/github/COMP3421/opens_data.txt" into table Open
fields terminated by "\t"
lines terminated by "\r\n";

drop table if exists WorksAt;
create table WorksAt(
  customerID int,
  companyID int,
  Primary Key (customerID, companyID),
  Foreign Key (customerID) references Customers(customerID),
  Foreign Key (companyID) references Companies(companyID)
) ;

load data local infile "C:/Users/eliza/github/COMP3421/worksat_data.txt" into table WorksAt
fields terminated by "\t"
lines terminated by "\r\n";

drop table if exists Manage;
create table Manage(
  agentID int,
  companyID int,
  health varchar(10),
  Primary Key (agentID, companyID, health),
  Foreign Key (agentID) references Agents(agentID),
  Foreign Key (companyID) references Companies(companyID)
);

load data local infile "C:/Users/eliza/github/COMP3421/manages_data.txt" into table Manage
fields terminated by "\t"
lines terminated by "\r\n";
