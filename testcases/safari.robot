*** Settings ***
Documentation    Safari Browser Tests on BrowserStack
Library          SeleniumLibrary
Resource         ../resources/resources.robot
Resource         ../resources/browserstack.robot

Suite Setup      Open Browser On BrowserStack    
...              ${TestData.BASE_URL}
...              Safari
...              OS X
...              Ventura
...              DemoBlaze Safari Tests
Suite Teardown   Close Browser

Test Teardown    Update BrowserStack Status

*** Test Cases ***
Safari - SIGNUP_TEST
    [Documentation]    Test sign-up functionality on Safari
    Sign Up New User

Safari - LOGIN_TEST
    [Documentation]    Test login functionality on Safari
    Log In Existing User

Safari - LOGOUT_TEST
    [Documentation]    Test logout functionality on Safari
    Ensure Logged In
    Log Out User

Safari - BUY_PRODUCT_TEST
    [Documentation]    Add Iphone 6 32gb to cart and complete purchase on Safari
    Ensure Logged In
    Go To Phones Category
    Open Product Page    ${Locators.PRODUCT_IPHONE_6_32gb}
    Add Product To Cart
    Open Cart And Place Order
    Fill Place Order Form
    Confirm Purchase And Verify Receipt

Safari - REMOVE_FROM_CART_TEST
    [Documentation]    Test removing product from the cart on Safari
    Ensure Logged In
    Add Product To Cart For Deletion Test
    Remove Product From Cart

