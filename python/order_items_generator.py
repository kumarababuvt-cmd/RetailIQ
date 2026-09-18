import pandas as pd
import random
TOTAL_ORDERS = 5000
order_items =[]
orders_df= pd.read_csv("C:\RetailIq\orders.csv")
products_df = pd.read_csv("C:\RetailIq\products.csv")
all_product_ids= products_df["product_id"].tolist()
pro_price ={}
for _, row in products_df.iterrows():
    pro_price[row["product_id"]] = row["selling_price"]


                          
for _, row in orders_df.iterrows():
    order_id = row["order_id"]
    no_of_products = random.randint(1,5)
    selected_products = random.sample(all_product_ids,no_of_products)

    for product_id in selected_products:
        quantity = random.randint(1,5)
        unit_price = pro_price[product_id]
        order_item={
            "order_id":order_id,
            "product_id":product_id,
            "quantity":quantity,
            "unit_price":unit_price

        }

        order_items.append(order_item)

df = pd.DataFrame(order_items)
print(df.head())
df.to_csv("order_items.csv",index=False)
    
