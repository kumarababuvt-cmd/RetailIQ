import pandas as pd
import random
from datetime import datetime,timedelta
TOTAL_PRODUCTS = 500
products = []
catalog = {
    "SmartPhones": {
        "Samsung":[
            "Galaxy S25",
            "Galaxy S25+",
            "Galaxy S25 Ultra",
            "Galaxy A56",
            "Galaxy M36"
        ],

        "Apple":[
            "iphone 17",
            "iphone 17 Plus",
            "iphone 17 Pro",
            "iphone 17 Pro max "
        ],

        "OnePlus":[
            "OnePlus 13",
            "OnePlus Nord 5",
            "OnePlus Nord CE 5"
        ],

        "Xiaomi":[
            "Xiaomi 15",
            "Redmi Note 15 Pro",
            "Poco F7"
        ],

        "Google":[
            "Pixel 10",
            "pixel 10 pro"
        ],

        "Nothing":[
            "Phone 3",
            "Phone 3a"
        ]

    },
    "Laptops":{

        "Dell":[
            "Inspiron 15",
            "Xps 13",
            "Latitude 540"
        ],

        "HP":[
            "Pavilion 14",
            "Victus 15",
            "Spectre x360"
        ],

        "ASUS":[
            "Vivobook 15",
            "Zenbook 14",
            "Rog Strix G16"
        ],

        "Acer":[
            "Aspire 7",
            "Nitro v",
            "Swift Go"
        ],

        "MSI":[
            "Modern 15",
            "Katana 15",
            "Stealth 16"
        ]
    },

    "Tablets":{

        "Apple":[
            "ipad Pro 13",
            "ipad Air M3",
            "ipad Mini"
        ],

        "Samsung":[
            "Galaxy Tab S10 Ultra",
            "Galaxy Tab S10+",
            "Galaxy Tab A9+"
        ],

        "Lenovo":[
            "Tab P12",
            "Tab M11",
            "Legion Y700"
        ],

        "Xiaomi":[
            "Pad 7",
            "Pad 7 Pro",
            "Redmi Pad Pro"
        ]
        
    },

    "Smart Watches":{
        "Apple":[
            "Apple Watch SE",
            "Apple Watch Series 10",
            "Apple Watch Ultra 2"
        ],

        "Samsung":[
            "Galaxy Watch FE",
            "Galaxy Watch 7",
            "Galaxy Watch Ultra"
        ],

        "Garmin":[
            "Venu 3",
            "Forerunner 265",
            "Fenix 8"
        ],

        "Amazfit":[
            "GTR 4",
            "Balance",
            "Bip 5"
        ]
    },

    "Audio Devices":{

        "Sony":[
            "WH-1000XM6",
            "WH-1000XM5",
            "ULT WEAR"
        ],

        "JBL":[
            "Tune 770NC",
            "Live 770NC",
            "Flip 7"
        ],

        "Boat":[
            "Airpods 141",
            "Rockerz 450",
            "Stone 350"
        ],

        "Apple":[
            "Airpods 4",
            "Airpods Pro 2",
            "HomePod Mini"
        ],

        "Samsung":[
            "Galaxy Buds FE",
            "Galaxy Buds 3",
            "Galaxy Buds 3 Pro"
        ]
    },

    "Televisions": {

        "Samsung": [
            "Crystal UHD 55",
            "Neo QLED 65",
            "OLED S95D"
        ],

        "LG": [
            "UQ75 55",
            "QNED86 65",
            "OLED C5"
        ],

        "Sony": [
            "Bravia 3",
            "Bravia 7",
            "Bravia 9"
        ],

        "TCL": [
            "P755",
            "C755",
            "C855"
        ],

        "Hisense": [
            "A6N",
            "U7N",
            "U8N"
        ]

    },

    "Home Appliances": {

        "LG": [
            "Front Load Washing Machine",
            "Double Door Refrigerator",
            "Dual Inverter AC"
        ],

        "Samsung": [
            "Top Load Washing Machine",
            "Side-by-Side Refrigerator",
            "WindFree AC"
        ],

        "Whirlpool": [
            "Magic Clean Washing Machine",
            "IntelliFresh Refrigerator",
            "3D Cool AC"
        ],

        "Bosch": [
            "Series 6 Washing Machine",
            "Double Door Refrigerator",
            "Dishwasher SMS6"
        ],

        "IFB": [
            "Senorita Washing Machine",
            "Neptune Dishwasher",
            "Microwave Oven"
        ]

    },

    "Computer Accessories": {

    "Logitech": [
        "MX Master 3S",
        "MX Keys S",
        "Brio 4K Webcam"
    ],

    "HP": [
        "Wireless Keyboard 330",
        "Wireless Mouse X200",
        "USB-C Dock G5"
    ],

    "Dell": [
        "MS3320W Mouse",
        "KB216 Keyboard",
        "WD19 Dock"
    ],

    "Corsair": [
        "K70 RGB Keyboard",
        "M75 Wireless Mouse",
        "HS80 Headset"
    ],

    "TP-Link": [
        "USB WiFi Adapter",
        "USB Bluetooth Adapter",
        "UH720 USB Hub"
    ]

    },

    "Gaming": {

    "Sony": [
        "PlayStation 5",
        "PlayStation 5 Slim",
        "PlayStation Portal"
    ],

    "Microsoft": [
        "Xbox Series S",
        "Xbox Series X",
        "Xbox Wireless Controller"
    ],

    "Nintendo": [
        "Nintendo Switch OLED",
        "Nintendo Switch Lite",
        "Switch 2"
    ],

    "ASUS": [
        "ROG Ally",
        "ROG Ally X",
        "ROG Chakram Mouse"
    ],

    "Razer": [
        "BlackWidow V4",
        "DeathAdder V3",
        "Kraken V4 Headset"
    ]

    },
    "Cameras": {

    "Canon": [
        "EOS R10",
        "EOS R8",
        "EOS R6 Mark II"
    ],

    "Nikon": [
        "Z50 II",
        "Z6 III",
        "Z8"
    ],

    "Sony": [
        "Alpha A6700",
        "Alpha A7 IV",
        "ZV-E10 II"
    ],

    "Fujifilm": [
        "X-T5",
        "X-S20",
        "X100VI"
    ],

    "Panasonic": [
        "Lumix S5 II",
        "Lumix G9 II",
        "Lumix GH7"
    ]

    },

    "Networking Devices": {

    "Cisco": [
        "Catalyst 9200",
        "ISR 1100 Router",
        "Business 350 Switch"
    ],

    "TP-Link": [
        "Archer AX73",
        "Deco X55",
        "TL-SG108 Switch"
    ],

    "Netgear": [
        "Nighthawk AX12",
        "Orbi RBK852",
        "GS308 Switch"
    ],

    "D-Link": [
        "DIR-X5460",
        "DGS-1210 Switch",
        "DWR-M921 Router"
    ],

    "Ubiquiti": [
        "UniFi Dream Machine",
        "UniFi AP U7 Pro",
        "EdgeRouter X"
    ]

    },

    "Storage Devices": {

    "Samsung": [
        "990 Pro SSD",
        "980 SSD",
        "T9 Portable SSD"
    ],

    "Western Digital": [
        "WD Black SN850X",
        "WD Blue SN580",
        "My Passport 2TB"
    ],

    "Seagate": [
        "FireCuda 530",
        "Barracuda 2TB",
        "Expansion Portable 2TB"
    ],

    "Kingston": [
        "NV3 SSD",
        "KC3000 SSD",
        "DataTraveler Max"
    ],

    "SanDisk": [
        "Extreme Portable SSD",
        "Ultra Dual Drive Luxe",
        "Ultra microSDXC 256GB"
    ]

    },


}
price_ranges = {
    "SmartPhones":(8000,120000),
    "Laptops":(25000,180000),
    "Tablets":(10000,90000),
    "Smart Watches":(1500,45000),
    "Audio Devices":(500,35000),
    "Televisions":(12000,300000),
    "Home Appliances":(3000,250000),
    "Computer Accessories":(300,25000),
    "Gaming":(1500,80000),
    "Cameras":(25000,350000),
    "Networking Devices":(800,50000),
    "Storage Devices":(500,35000)

    }
Statuses=[
    "In Stock",
    "Out of Stock",
    "Discontinued",
    "Coming Soon"
]

Weights = [
    70,
    20,
    5,
    5
]
supplier_lookup = {}
supplier_df =pd.read_csv("C:\RetailIq\supplier.csv")

for index, row in supplier_df.iterrows():
    supplier_name = row["supplier_name"].replace("India","").strip()
    supplier_lookup[supplier_name] = row["supplier_id"]


category_df = pd.read_csv("C:\RetailIq\category.csv")
category_lookup={}
for index, row in category_df.iterrows():
    category_lookup[row["category_name"]] = row["category_id"]

for i in range(TOTAL_PRODUCTS):
    category = random.choice(list(catalog.keys()))
    category_id = category_lookup[category]
    brand = random.choice(list(catalog[category].keys()))
    model = random.choice(list(catalog[category][brand]))
    min_price,max_price=price_ranges[category]
    cost_price=random.randint(min_price,max_price)
    profit_margin=random.randint(10,25)
    selling_price= round(cost_price * (1 + profit_margin / 100))
    today=datetime.now()
    manufacture_date= (today - timedelta(days=random.randint(0,365))).date()
    sku = category[:2].upper()+ "-" + brand[:3].upper() + "-" +str(i+1).zfill(4)
    status = random.choices(
        Statuses,
        weights=Weights,
        k=1
        )[0]
    supplier_id = supplier_lookup[brand]
    product = {
        "product_id": i + 1,
        "sku":sku,
        "category_id":category_id,
        "brand":brand,
        "model":model,
        "cost_price":cost_price,
        "selling_price":selling_price,
        "manufacture_date":manufacture_date,
        "status":status,
        "supplier_id":supplier_id
    
    }

    products.append(product)


df = pd.DataFrame(products)
print(df.head())
df.to_csv("products.csv",index=False)

