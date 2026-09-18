import pandas as pd
import random
TOTAL_STORES = 50
TOTAL_PRODUCTS = 500    
store_inventories = []

for store_id in range(1,TOTAL_STORES+1):
    for product_id in range(1,TOTAL_PRODUCTS+1):
        stock_level = random.choices(
            ["Low","Medium","High"],
            weights=[20,30,50],
            k=1
        )[0]
        if stock_level == "Low":
            quantity = random.randint(10,50)
        elif stock_level == "Medium":
            quantity = random.randint(51,500)
        else:
            quantity = random.randint(501,1000)

        store_inventory = {
                "store_id": store_id,
                "product_id" : product_id,
                "quantity": quantity

            }

        store_inventories.append(store_inventory)

df = pd.DataFrame(store_inventories)

print(df.head())
df.to_csv("store_inventory.csv",index=False)
        

