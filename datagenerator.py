from faker import Faker
import random
import datetime

fake = Faker()

agentNames = ["Jake", "Sam", "Andy", "Elizabeth", "Brendan", "Izabela", "Micah"]
healthScores = ["red", "yellow", "green"]
ratings = [1, 2, 3, 4, 5]
industries = ["civil", "mining", "waste", "aggregates"]
jobs = ["surveyor", "pilot", "foreman", "manager", "owner"]
categories = ["troubleshooting", "renewal", "training"]

outfile = open("agents_data", "w")
for i in range(len(agentNames)):
    s = str(i + 1) + "," + agentNames[i]
    outfile.write(s)
outfile.close()


outfile = open("tickets_data", "w")
numTickets = 15
startDate = datetime.date(2021, 1, 1)
endDate = datetime.date(2021, 12, 31)
for i in range(1, numTickets + 1):
    d = fake.date_between_dates(startDate, endDate)
    d2 = d + datetime.timedelta(days=2)
    s = str(i) + "," + random.choice(categories) + d.isoformat() + "," + d2.isoformat()
    outfile.write(s)

outfile.close()

# company name: random 40-character string
