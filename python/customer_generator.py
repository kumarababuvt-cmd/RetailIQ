import pandas as pd
import random
from datetime import datetime,timedelta
TOTAL_CUSTOMERS = 1000
customers=[]
first_names = [
    "Aarav", "Vivaan", "Arjun", "Aditya", "Vihaan",
    "Krishna", "Rohan", "Rahul", "Karthik", "Sanjay",
    "Praveen", "Surya", "Ashwin", "Harish", "Rohit",
    "Ajay", "Deepak", "Naveen", "Vignesh", "Manoj",
    "Dinesh", "Kiran", "Varun", "Gokul", "Akash",
    "Abhishek", "Rakesh", "Nithin", "Madhan", "Suresh",
    "Ganesh", "Lokesh", "Bharath", "Prakash", "Anand",
    "Ramesh", "Senthil", "Yogesh", "Mohan", "Kishore",
    "Saravanan", "Siva", "Vinod", "Aravind", "Akhil",
    "Priya", "Ananya", "Aishwarya", "Divya", "Nisha",
    "Meera", "Sneha", "Kavya", "Pooja", "Neha",
    "Swathi", "Harini", "Keerthana", "Lakshmi", "Riya",
    "Anjali", "Shreya", "Nandhini", "Deepika", "Sowmya",
    "Bhavya", "Preethi", "Gayathri", "Ishita", "Madhumitha",
    "Anu", "Revathi", "Vaishnavi", "Shruthi", "Monika"
]
last_names = [
    "Kumar", "Sharma", "Reddy", "Patel", "Gupta",
    "Singh", "Verma", "Nair", "Iyer", "Menon",
    "Raj", "Babu", "Krishnan", "Mohan", "Prasad",
    "Raman", "Subramanian", "Narayanan", "Pillai", "Rao",
    "Das", "Chandra", "Joseph", "Fernandes", "Thomas",
    "Khan", "Ali", "Srinivasan", "Sekar", "Murugan",
    "Balaji", "Selvam", "Arun", "Ravi", "Venkatesh",
    "Mishra", "Yadav", "Pandey", "Chauhan", "Jain",
    "Agarwal", "Malhotra", "Kapoor", "Bose", "Mukherjee",
    "Saxena", "Tripathi", "Naidu", "Shetty", "Desai"
]
cities = [
    "Chennai",
    "Bangalore",
    "Hyderabad",
    "Mumbai",
    "Delhi",
    "Pune",
    "Kolkata",
    "Ahmedabad",
    "Coimbatore",
    "Kochi",
    "Jaipur",
    "Lucknow",
    "Indore",
    "Bhopal",
    "Nagpur",
    "Visakhapatnam",
    "Vijayawada",
    "Mysore",
    "Madurai",
    "Tiruchirappalli",
    "Salem",
    "Erode",
    "Tirunelveli",
    "Noida",
    "Gurgaon",
    "Chandigarh",
    "Surat",
    "Vadodara",
    "Rajkot",
    "Nashik"
]
start_date=datetime(2020,1,1)
end_date=datetime.now()
dob_start=datetime(1956,1,1)
dob_end=datetime(2008,12,31)

for i in range(TOTAL_CUSTOMERS):
    customer_id =i + 1
    name = random.choice(first_names) + " "+random.choice(last_names)
    dob = dob_start +timedelta(days=random.randint(0,(dob_end-dob_start).days))
    dob = dob.date()
    gender= random.choices(
        ["male","female"],
        weights=[50,50],
        k=1
    )[0]
    city = random.choice(cities)
    phone_number ="98456"+str(i+1).zfill(5)
    email = name.lower().replace(" ",".")+str(customer_id) +  "@gmail.com"
    registration_date= start_date + timedelta(days=random.randint(0,(end_date-start_date).days))
    registration_date = registration_date.date()
    loyalty_level= random.randint(0,5)
    status= random.choices(
        [True,False],
        weights=[85,15],
        k=1
    )[0]
    customer={
        "customer_id":customer_id,
        "name":name,
        "dob":dob,
        "gender":gender,
        "city":city,
        "phone_number":phone_number,
        "email":email,
        "registration_date":registration_date,
        "loyalty_level":loyalty_level,
        "status":status
    }
    customers.append(customer)

df = pd.DataFrame(customers)
print(df.head())
df.to_csv("customer.csv",index=False)
