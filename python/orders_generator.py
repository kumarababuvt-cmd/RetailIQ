import pandas as pd
import random 
from datetime import datetime,timedelta
TOTAL_ORDERS = 5000
TOTAL_CUSTOMERS = 1000
TOTAL_EMPLOYEES = 250
orders = []
start_date = datetime(2023,1,1)
end_date =datetime.now()
employee_df =pd.read_csv("C:\RetailIq\employee.csv")
employee_store = {}
for _,row in employee_df.iterrows():
    employee_store[row["employee_id"]]= row["store_id"]

for order_id in range(1,TOTAL_ORDERS+1):
    order_date = start_date + timedelta(days=random.randint(0,(end_date-start_date).days))
    order_date = order_date.date()
    customer_id = random.randint(1,TOTAL_CUSTOMERS)
    employee_id = random.randint(1,TOTAL_EMPLOYEES)
    store_id = employee_store[employee_id]

    order= {
        "order_id": order_id,
        "order_date": order_date,
        "customer_id":customer_id,
        "employee_id":employee_id,
        "store_id":store_id
    }
    orders.append(order)

df = pd.DataFrame(orders)
print(df.head())
df.to_csv("orders.csv",index=False)

