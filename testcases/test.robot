*** Settings ***
Documentation    Automation tests for https://www.demoblaze.com
Library          SeleniumLibrary
Resource         ../resources/resources.robot

Suite Setup      Open DemoBlaze
Suite Teardown   Close Browser

*** Test Cases ***
SIGNUP_TEST
    [Documentation]    Test sign-up functionality
    Sign Up New User
LOGIN_TEST
    [Documentation]    Test login functionality
    Log In Existing User

LOGOUT_TEST
    [Documentation]  Test logout functionality
    Ensure Logged In
    Log Out User

BUY_PRODUCT_TEST
    [Documentation]    Add Iphone 6 32gb to cart and complete purchase
    Ensure Logged In
    Go To Phones Category
    Open Product Page    ${Locators.PRODUCT_IPHONE_6_32gb}
    Add Product To Cart
    Open Cart And Place Order
    Fill Place Order Form
    Confirm Purchase And Verify Receipt

REMOVE_FROM_CART_TEST
    [Documentation]    Test removing product from the cart
    Ensure Logged In
    Add Product To Cart For Deletion Test
    Remove Product From Cart
