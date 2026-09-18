import pandas as pd
import random
TOTAL_SUPPLIERS = 41
suppliers=[]
supplier_names =[
    "Apple",
    "Samsung",
    "Dell ",
    "HP",
    "Lenovo",
    "LG ",
    "Sony",
    "ASUS",
    "Acer",
    "Canon",
    "Xiaomi",
    "Garmin",
    "Amazfit",
    "Cisco",
    "Ubiquiti",
    "Kingston",
    "SanDisk",
    "Hisense",
    "OnePlus",
    "Google",
    "Nothing",
    "MSI",
    "JBL",
    "Boat",
    "Whirlpool",
    "Bosch",
    "IFB",
    "Logitech",
    "Corsair",
    "TP-Link",
    "Microsoft",
    "Nintendo",
    "Razer",
    "Nikon",
    "Fujifilm",
    "Panasonic",
    "Netgear",
    "D-Link",
    "Western Digital",
    "Seagate",
    "TCL"
]

for i in range(TOTAL_SUPPLIERS):
    supplier_id = i + 1
    supplier_name = supplier_names[i]
    product_quality = random.randint(70,100)
    correct_time_delivery_rating =random.randint(75,100)
    total_deliveries = random.randint(500,5000)

    supplier={
        "supplier_id":supplier_id,
        "supplier_name":supplier_name,
        "product_quality":product_quality,
        "correct_time_delivery_rating": correct_time_delivery_rating,
        "total_deliveries":total_deliveries


    }
    suppliers.append(supplier)

df=pd.DataFrame(suppliers)
print(df.head())
df.to_csv("supplier.csv",index=False)
