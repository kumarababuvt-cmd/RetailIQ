import pandas as pd
import random
TOTAL_CATEGORIES =12
categories =[]
category =[
    "SmartPhones",
	"Laptops",
	"Tablets",
	"Smart Watches",
	"Audio Devices",
	"Televisions",
	"Home Appliances",
	"Computer Accessories",
	"Gaming",
	"Cameras",
	"Networking Devices",
	"Storage Devices",
]
for i in range(TOTAL_CATEGORIES):
    category_id = i+1
    category_name = category[i]
    status = random.choices(
        ["active","non-active"],
        weights=[8,2],
        k=1
    )[0]
    category_final ={
        "category_id":category_id,
        "category_name":category_name,
        "status":status
    }
    categories.append(category_final)

df=pd.DataFrame(categories)
print(df.head())
df.to_csv("category.csv",index=False)