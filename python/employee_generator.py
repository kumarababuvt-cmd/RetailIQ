import pandas as pd
import random
from datetime import timedelta,datetime
TOTAL_EMPLOYEES = 250
employees = []

first_names = [
    "Arjun", "Vikram", "Rahul", "Karthik", "Sanjay",
    "Praveen", "Surya", "Ashwin", "Harish", "Rohit",
    "Ajay", "Deepak", "Naveen", "Vignesh", "Manoj",
    "Dinesh", "Kiran", "Sathish", "Varun", "Gokul",
    "Akash", "Abhishek", "Rakesh", "Nithin", "Madhan",
    "Suresh", "Ganesh", "Lokesh", "Bharath", "Prakash",
    "Anand", "Ramesh", "Senthil", "Yogesh", "Mohan",
    "Kishore", "Saravanan", "Siva", "Vinod", "Aravind"
]

last_names = [
    "Kumar", "Sharma", "Reddy", "Patel", "Gupta",
    "Singh", "Verma", "Nair", "Iyer", "Menon",
    "Raj", "Babu", "Krishnan", "Mohan", "Prasad",
    "Raman", "Subramanian", "Narayanan", "Pillai", "Rao",
    "Das", "Chandra", "Joseph", "Fernandes", "Thomas",
    "Khan", "Ali", "Srinivasan", "Sekar", "Murugan",
    "Balaji", "Selvam", "Arun", "Ravi", "Venkatesh",
    "Mishra", "Yadav", "Pandey", "Chauhan", "Jain"
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
    "Kochi"
]

work_categories = [
    "Store Manager",
    "Assistant Manager",
    "Sales Executive",
    "Cashier",
    "Inventory Associate",
    "Customer Support",
    "Technician",
    "Security",
    "Housekeeping"
]


weights = [
    3,   # Store Manager
    5,   # Assistant Manager
    30,  # Sales Executive
    18,  # Cashier
    12,  # Inventory Associate
    10,  # Customer Support
    10,  # Technician
    7,   # Security
    5    # Housekeeping
]
start_date = datetime(2021,1,1)
end_date= datetime(2026,7,30)

for i in range(TOTAL_EMPLOYEES):
    employee_id = i +1
    employee_name = random.choice(first_names)+" " + random.choice(last_names)
    phone_number = "98456" + str(i+1).zfill(5)
    email = employee_name.lower().replace(" ",".")+str(employee_id)+ "@retailiq.com"
    city = random.choice(cities)
    work_category= random.choices(
        work_categories,
        weights=weights,
        k=1
    )[0]
    store_id = random.randint(1,50)
    joining_date= start_date+timedelta(days=random.randint(0,(end_date-start_date).days))
    joining_date=joining_date.date()
    if work_category == "Store Manager":
        salary = random.randint(55000,75000)
    elif work_category == "Assistant Manager":
        salary = random.randint(40000,55000)
    elif work_category == "Sales Executive":
        salary= random.randint(22000,35000)
    elif work_category == "Cashier":
        salary = random.randint(20000,28000)
    elif work_category == "Inventory Associate":
        salary = random.randint(22000,30000)
    elif work_category == "Customer Support":
        salary = random.randint(22000,32000)
    elif work_category == "Technician":
        salary =  random.randint(28000,40000)
    elif work_category == "Security":
        salary = random.randint(18000,25000)
    elif work_category == "Housekeeping":
        salary = random.randint(16000,22000)
    status = random.choices(
        [True,False],
        weights=[95,5],
        k=1
    )[0]
    employee={
        "employee_id":employee_id,
        "employee_name":employee_name,
        "phone_number":phone_number,
        "email":email,
        "city":city,
        "work_category":work_category,
        "store_id":store_id,
        "joining_date":joining_date,
        "salary":salary,
        "status":status
    }
    employees.append(employee)

df = pd.DataFrame(employees)
print(df.head())
df.to_csv("employee.csv", index=False)

    



    

