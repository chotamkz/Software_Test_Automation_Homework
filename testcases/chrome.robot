*** Settings ***
Documentation    Chrome Browser Tests on BrowserStack
Library          SeleniumLibrary
Resource         ../resources/resources.robot
Resource         ../resources/browserstack.robot

Suite Setup      Open Browser On BrowserStack    
...              ${TestData.BASE_URL}
...              Chrome
...              Windows
...              11
...              DemoBlaze Chrome Tests
Suite Teardown   Close Browser

*** Test Cases ***
Chrome - SIGNUP_TEST
    [Documentation]    Test sign-up functionality on Chrome
    Sign Up New User

Chrome - LOGIN_TEST
    [Documentation]    Test login functionality on Chrome
    Log In Existing User

Chrome - LOGOUT_TEST
    [Documentation]    Test logout functionality on Chrome
    Ensure Logged In
    Log Out User

Chrome - BUY_PRODUCT_TEST
    [Documentation]    Add Iphone 6 32gb to cart and complete purchase on Chrome
    Ensure Logged In
    Go To Phones Category
    Open Product Page    ${Locators.PRODUCT_IPHONE_6_32gb}
    Add Product To Cart
    Open Cart And Place Order
    Fill Place Order Form
    Confirm Purchase And Verify Receipt

Chrome - REMOVE_FROM_CART_TEST
    [Documentation]    Test removing product from the cart on Chrome
    Ensure Logged In
    Add Product To Cart For Deletion Test
    Remove Product From Cart

