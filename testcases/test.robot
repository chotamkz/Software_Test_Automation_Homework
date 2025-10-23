*** Settings ***
Documentation    Automation tests for https://www.demoblaze.com
Library          SeleniumLibrary
Resource         ../resources/resources.robot

Suite Setup      Open DemoBlaze
Suite Teardown   Close Browser

*** Test Cases ***
LOGIN_TEST
    [Documentation]    Test sign-up and login functionality on DemoBlaze
    Sign Up New User
    Log In Existing User
