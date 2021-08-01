from bs4 import BeautifulSoup
import requests
import time
import datetime
import csv

"""
days_index = [name, 2021-07-01, 2021-07-02, ..., 2021-07-15]
row = [name, price0, price1, ..., priceN]
output = [
    row0,
    row1,
    ...
    rowN
]

-- final result --
name, 2021/07/01, 2021/07/02, ..., 2021/07/15
name0, price00, price01, ..., price0N
name1, price10, price11, ..., price1N
...
nameN, priceN0, priceN1, ..., priceNN
"""

URL = "https://www.jalan.net/070000/LRG_071700/SML_071712/?stayYear={year}&stayMonth={month}&stayDay={day}&stayCount={stay}&roomCount={room}&adultNum={adult}"

DAYS = 14 # the number of searching days
ADULT = 2 # the number of adult
STAY = 1 # the number of staying days
ROOM = 1 # the number of room

days_index = ["name"]
days_prices_by_hotels = {}
today = datetime.datetime.now()
output = []

contents = ""
for i in range(DAYS):
    print(f"scraping day {i+1}...")
    days_index.append(str((today + datetime.timedelta(days=i+1)).date()))
    cur_day = days_index[i+1].split("-")
    target_url = URL.format(year=cur_day[0], month=cur_day[1], day=cur_day[2], stay=STAY, room=ROOM, adult=ADULT)
    r = requests.get(target_url)
    time.sleep(1)
    soup = BeautifulSoup(r.content, "lxml")

    detail = soup.find(id="jsiInnList")
    contents = detail.find_all("div",class_="p-yadoCassette__summary p-searchResultItem__summary")
    for content in contents:
        name = content.find("h2",class_="p-searchResultItem__facilityName").text.replace("\n", "").replace("\u3000", "")
        price = content.find("span",class_="p-searchResultItem__lowestPriceValue").text.replace(",", "").replace("円〜", "")

        if name not in days_prices_by_hotels:
            days_prices_by_hotels[name] = []

        days_prices_by_hotels[name].append([days_index[i+1], price])


for h in days_prices_by_hotels.keys():
    row = [h] + [0 for _ in range(DAYS)]
    for dnum in range(1, len(days_index)):
        for dp in days_prices_by_hotels[h]:
            try:
                pos = days_index.index(dp[0])
                row[pos] = dp[1]
            except ValueError as e:
                print(e)
    output.append(row)

with open(f"{today.date()}.csv", "w", encoding="shift-jis") as f:
    writer = csv.writer(f)
    writer.writerow(days_index)
    writer.writerows(output)
    print(f"output file name is {today.date()}.csv")
    print("done")
