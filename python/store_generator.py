import pandas as pd
import random
TOTAL_STORES = 50
stores = []
store_locations = [
    "Chennai - T Nagar",
    "Chennai - Velachery",
    "Chennai - Anna Nagar",
    "Chennai - Tambaram",
    "Chennai - OMR",

    "Bangalore - Indiranagar",
    "Bangalore - Whitefield",
    "Bangalore - Koramangala",
    "Bangalore - Jayanagar",
    "Bangalore - Electronic City",

    "Hyderabad - Hitech City",
    "Hyderabad - Banjara Hills",
    "Hyderabad - Gachibowli",
    "Hyderabad - Kukatpally",
    "Hyderabad - Secunderabad",

    "Mumbai - Andheri",
    "Mumbai - Bandra",
    "Mumbai - Powai",
    "Mumbai - Navi Mumbai",
    "Mumbai - Thane",

    "Delhi - Connaught Place",
    "Delhi - Karol Bagh",
    "Delhi - Rohini",
    "Delhi - Dwarka",
    "Delhi - Saket",

    "Pune - Hinjewadi",
    "Pune - Kothrud",
    "Pune - Viman Nagar",
    "Pune - Baner",
    "Pune - Hadapsar",

    "Kolkata - Salt Lake",
    "Kolkata - Park Street",
    "Kolkata - New Town",
    "Kolkata - Howrah",
    "Kolkata - Garia",

    "Ahmedabad - Satellite",
    "Ahmedabad - Navrangpura",
    "Ahmedabad - SG Highway",
    "Ahmedabad - Maninagar",
    "Ahmedabad - Bopal",

    "Coimbatore - Gandhipuram",
    "Coimbatore - RS Puram",
    "Coimbatore - Peelamedu",
    "Coimbatore - Saibaba Colony",
    "Coimbatore - Singanallur",

    "Kochi - Edappally",
    "Kochi - Kakkanad",
    "Kochi - MG Road",
    "Kochi - Vyttila",
    "Kochi - Aluva"
]
phone_numbers = [
    "9876500001","9876500002","9876500003","9876500004","9876500005",
    "9876500006","9876500007","9876500008","9876500009","9876500010",
    "9876500011","9876500012","9876500013","9876500014","9876500015",
    "9876500016","9876500017","9876500018","9876500019","9876500020",
    "9876500021","9876500022","9876500023","9876500024","9876500025",
    "9876500026","9876500027","9876500028","9876500029","9876500030",
    "9876500031","9876500032","9876500033","9876500034","9876500035",
    "9876500036","9876500037","9876500038","9876500039","9876500040",
    "9876500041","9876500042","9876500043","9876500044","9876500045",
    "9876500046","9876500047","9876500048","9876500049","9876500050"
]

emails = [
    "store01@retailiq.com",
    "store02@retailiq.com",
    "store03@retailiq.com",
    "store04@retailiq.com",
    "store05@retailiq.com",
    "store06@retailiq.com",
    "store07@retailiq.com",
    "store08@retailiq.com",
    "store09@retailiq.com",
    "store10@retailiq.com",
    "store11@retailiq.com",
    "store12@retailiq.com",
    "store13@retailiq.com",
    "store14@retailiq.com",
    "store15@retailiq.com",
    "store16@retailiq.com",
    "store17@retailiq.com",
    "store18@retailiq.com",
    "store19@retailiq.com",
    "store20@retailiq.com",
    "store21@retailiq.com",
    "store22@retailiq.com",
    "store23@retailiq.com",
    "store24@retailiq.com",
    "store25@retailiq.com",
    "store26@retailiq.com",
    "store27@retailiq.com",
    "store28@retailiq.com",
    "store29@retailiq.com",
    "store30@retailiq.com",
    "store31@retailiq.com",
    "store32@retailiq.com",
    "store33@retailiq.com",
    "store34@retailiq.com",
    "store35@retailiq.com",
    "store36@retailiq.com",
    "store37@retailiq.com",
    "store38@retailiq.com",
    "store39@retailiq.com",
    "store40@retailiq.com",
    "store41@retailiq.com",
    "store42@retailiq.com",
    "store43@retailiq.com",
    "store44@retailiq.com",
    "store45@retailiq.com",
    "store46@retailiq.com",
    "store47@retailiq.com",
    "store48@retailiq.com",
    "store49@retailiq.com",
    "store50@retailiq.com"
]
statuses =[True,False]
weights = [90,10]

for i in  range(TOTAL_STORES):
    store_id = i + 1
    store_location = store_locations[i]
    phone_number = phone_numbers[i]
    email = emails[i]
    store_capacity = random.randint(500,1000)
    status = random.choices(
        statuses,
        weights=weights,
        k=1
    )[0]

    store = {
        "store_id": store_id,
        "store_location":store_location,
        "phone_number":phone_number,
        "email": email,
        "store_capacity":store_capacity,
        "status":status
        


    }
    stores.append(store)

df=pd.DataFrame(stores)
print(df.head())
df.to_csv("store.csv",index=False)