import pandas as pd
import random
TOTAL_WAREHOUSES = 10
TOTAL_PRODUCTS = 500
warehouse_inventory =[]
for warehouse_id in range(1,TOTAL_WAREHOUSES+1):
    for product_id in range(1,TOTAL_PRODUCTS+1):
        stock_level=random.choices(
            ["Low","Medium","High"],
            weights=[10,50,40],
            k=1
        )[0]
        if stock_level == "Low":
            current_quantity = random.randint(0,50)
        elif stock_level == "Medium":
            current_quantity= random.randint(51,300)
        elif stock_level == "High":
            current_quantity= random.randint(301,800)

        inventory = {
            "warehouse_id":warehouse_id,
            "product_id":product_id,
            "current_quantity":current_quantity
        }
        warehouse_inventory.append(inventory)

df =  pd.DataFrame(warehouse_inventory)
print(df.head())
df.to_csv("warehouse_inventory.csv",index=False)