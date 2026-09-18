import pandas as pd 
import random
TOTAL_PAYMENTS = 5000
payments=[]
orders_df=pd.read_csv("C:\RetailIq\orders.csv")
order_items_df=pd.read_csv("C:\RetailIq\order_items.csv")
order_price ={}

for index, row in order_items_df.iterrows():
    order_id = row["order_id"]
    quantity = row["quantity"]
    unit_price = row["unit_price"]
    payment_total= quantity * unit_price
    if order_id in order_price :
        order_price[order_id] += payment_total
    else:
        order_price[order_id] = payment_total
    


for index, row in orders_df.iterrows():
    payment_id = index + 1
    order_id = row["order_id"]
    payment_type = random.choices(
        ["cash","card","upi"],
        weights=[25,30,45],
        k=1
    )[0]
    payment_date = row["order_date"]
    payment_status = random.choices(
        ["completed","failed","pending","return"],
        weights=[75,10,10,5],
        k=1

    )[0]

    payment ={
        "payment_id":payment_id,
        "order_id":order_id,
        "payment_type":payment_type,
        "payment_amount":order_price[order_id],
        "payment_date":payment_date,
        "payment_status":payment_status
    }

    payments.append(payment)

df=pd.DataFrame(payments)
print(df.head())
df.to_csv("payments.csv",index=False)

