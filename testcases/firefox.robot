*** Settings ***
Documentation    Firefox Browser Tests on BrowserStack
Library          SeleniumLibrary
Resource         ../resources/resources.robot
Resource         ../resources/browserstack.robot

Suite Setup      Open Browser On BrowserStack    
...              ${TestData.BASE_URL}
...              Firefox
...              Windows
...              11
...              DemoBlaze Firefox Tests
Suite Teardown   Close Browser

Test Teardown    Update BrowserStack Status

*** Test Cases ***
Firefox - SIGNUP_TEST
    [Documentation]    Test sign-up functionality on Firefox
    Sign Up New User

Firefox - LOGIN_TEST
    [Documentation]    Test login functionality on Firefox
    Log In Existing User

Firefox - LOGOUT_TEST
    [Documentation]    Test logout functionality on Firefox
    Ensure Logged In
    Log Out User

Firefox - BUY_PRODUCT_TEST
    [Documentation]    Add Iphone 6 32gb to cart and complete purchase on Firefox
    Ensure Logged In
    Go To Phones Category
    Open Product Page    ${Locators.PRODUCT_IPHONE_6_32gb}
    Add Product To Cart
    Open Cart And Place Order
    Fill Place Order Form
    Confirm Purchase And Verify Receipt

Firefox - REMOVE_FROM_CART_TEST
    [Documentation]    Test removing product from the cart on Firefox
    Ensure Logged In
    Add Product To Cart For Deletion Test
    Remove Product From Cart

