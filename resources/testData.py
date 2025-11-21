import time
import random

baseurl = "https://www.demoblaze.com"

timestamp = str(int(time.time()))[-6:]
random_num = random.randint(100, 999)
unique_username = f"Daniyar{timestamp}{random_num}"

class TestData:
    BASE_URL = "https://www.demoblaze.com"
    USERNAME = unique_username
    PASSWORD = "qwerty123"

    ORDER_NAME = "Daniyar Nurlanov"
    ORDER_COUNTRY = "Kazakhstan"
    ORDER_CITY = "Almaty"
    ORDER_CARD = "43324356678678"
    ORDER_MONTH = "10"
    ORDER_YEAR = "2025"
