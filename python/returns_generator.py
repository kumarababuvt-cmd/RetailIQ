import pandas as pd
import random
from datetime import datetime,timedelta
TOTAL_RETURNS = 250
returns = []
order_items_df=pd.read_csv("C:\RetailIq\order_items.csv")
orders_df = pd.read_csv("C:\RetailIq\orders.csv")
order_date_lookup = {}

for index, row in orders_df.iterrows():
    order_date_lookup[row["order_id"]]= pd.to_datetime(row["order_date"])

selected_returns = order_items_df.sample(n=TOTAL_RETURNS,random_state=42)   

for index, row in selected_returns.iterrows():
    return_id =len(returns) + 1
    order_id = row["order_id"]
    product_id = row["product_id"]
    order_date=order_date_lookup[order_id]
    return_date = order_date + timedelta(days=random.randint(1,30))


    inspection_status = random.choices(
            ["passed","failed"],
            weights=[40,60],
            k=1
        )[0]
    return_type = random.choices(
            ["replacement","refund"],
            weights=[60,40],
            k=1
        )[0]
    return_record ={
        "return_id":return_id,
        "order_id": order_id,
        "product_id":product_id,
        "return_date":return_date,
        "inspection_status":inspection_status,
        "return_type":return_type

    }
    returns.append(return_record)

df = pd.DataFrame(returns)
print(df.head())
df.to_csv("returns.csv",index=False)
    



