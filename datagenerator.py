from faker import Faker
import random
import datetime

fake = Faker()

#predetermined sets of choices
agentNames = ["Jake", "Sam", "Andy", "Elizabeth", "Brendan", "Izabela", "Micah"]
healthScores = ["red", "yellow", "green"]
ratings = [1, 2, 3, 4, 5]
industries = ["civil", "mining", "waste", "aggregates"]
jobs = ["surveyor", "pilot", "foreman", "manager", "owner"]
categories = ["troubleshooting", "renewal", "training"]

#change these numbers to change how much data you generate
numTickets = 15
numCustomers = 10
numCompanies = 5


#agents
outfile = open("agents_data", "w")
for i in range(len(agentNames)):
    s = str(i+1) + "\t" + agentNames[i] + "\n"
    outfile.write(s)
outfile.close()

#tickets
outfile = open("tickets_data", "w")
startDate = datetime.date(2021, 1, 1)
endDate = datetime.date(2021, 12, 31)
for i in range(numTickets):
    d = fake.date_between_dates(startDate, endDate)
    d2 = d + datetime.timedelta(days=2)
    s = str(i+1) + "\t" + random.choice(categories) + "\t" + d.isoformat() + "\t" + d2.isoformat() + "\n"
    outfile.write(s)
outfile.close()


#customers
outfile = open("customers_data", "w")
for i in range(numCustomers):
    s = str(i+1) + "\t" + fake.name() + "\t" + random.choice(jobs) + "\n"
    outfile.write(s)
outfile.close()


#companies
outfile = open("companies_data", "w")
for i in range(numCompanies):
    s = str(i+1) + "\t" + fake.company() + "\t" + random.choice(industries) + "\n"
    outfile.write(s)
outfile.close()
