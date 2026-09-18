import pandas as pd
import random
TOTAL_WAREHOUSES = 10
warehouses = []
warehouse_names=[
"Chennai Central Warehouse",

"Bangalore Tech Warehouse",

"Hyderabad Distribution Center",

"Mumbai Logistics Hub",

"Delhi Regional Warehouse",

"Pune Fulfillment Center",

"Kolkata Storage Hub",

"Ahmedabad Distribution Center",

"Coimbatore Warehouse",

"Kochi Supply Hub"
]
warehouse_location=[
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

for i in range(TOTAL_WAREHOUSES):
    warehouse_id= i + 1
    warehouse_name= warehouse_names[i]
    warehouse_locations= warehouse_location[i]
    capacity = random.randint(30000,100000)

    warehouse ={
        "warehouse_id": warehouse_id,
        "warehouse_name": warehouse_name,
        "warehouse_location": warehouse_locations,
        "capacity": capacity
    }
    warehouses.append(warehouse)

df= pd.DataFrame(warehouses)
print (df.head())
df.to_csv("warehouse.csv",index=False)