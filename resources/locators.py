class Locators:
    SIGNUP_BUTTON = "//a[@id='signin2']"
    LOGIN_BUTTON = "//a[@id='login2']"
    LOGOUT_BUTTON = "//a[@id='logout2']"
    USERNAME_DISPLAY = "//a[@id='nameofuser']"

    SIGNUP_USERNAME_INPUT = "//input[@id='sign-username']"
    SIGNUP_PASSWORD_INPUT = "//input[@id='sign-password']"
    SIGNUP_SUBMIT_BUTTON = "//button[text()='Sign up']"

    LOGIN_USERNAME_INPUT = "//input[@id='loginusername']"
    LOGIN_PASSWORD_INPUT = "//input[@id='loginpassword']"
    LOGIN_SUBMIT_BUTTON = "//button[text()='Log in']"

    CATEGORY_PHONES = "//a[text()='Phones']"
    PRODUCT_IPHONE_6_32gb = "//a[text()='Iphone 6 32gb']"
    PRODUCT_SAMSUNG_GALAXY_S6 = "//a[text()='Samsung galaxy s6']"
    ADD_TO_CART_BUTTON = "//a[text()='Add to cart']"

    CART_LINK = "//a[@id='cartur']"
    PLACE_ORDER_BUTTON = "//button[text()='Place Order']"
    ORDER_MODAL = "//div[@id='orderModal']"

    ORDER_NAME_INPUT = "//input[@id='name']"
    ORDER_COUNTRY_INPUT = "//input[@id='country']"
    ORDER_CITY_INPUT = "//input[@id='city']"
    ORDER_CARD_INPUT = "//input[@id='card']"
    ORDER_MONTH_INPUT = "//input[@id='month']"
    ORDER_YEAR_INPUT = "//input[@id='year']"
    PURCHASE_BUTTON = "//button[text()='Purchase']"

    PURCHASE_CONFIRM_TEXT = "Thank you for your purchase"
    PURCHASE_OK_BUTTON = "//button[text()='OK']"

    DELETE_BUTTON = "//a[text()='Delete']"
    CART_PRODUCT_ROW = "//tr/td[2]"
    TOTAL_PRICE = "//h3[@id='totalp']"
