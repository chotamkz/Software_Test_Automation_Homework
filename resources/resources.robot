*** Settings ***
Library    SeleniumLibrary
Variables  ./testData.py
Variables  ./locators.py

*** Keywords ***
Open DemoBlaze
    Open Browser    ${TestData.BASE_URL}    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    ${Locators.SIGNUP_BUTTON}    timeout=10s

Sign Up New User
    Click Element    ${Locators.SIGNUP_BUTTON}
    Wait Until Element Is Visible    ${Locators.SIGNUP_USERNAME_INPUT}    timeout=5s
    Input Text    ${Locators.SIGNUP_USERNAME_INPUT}    ${TestData.USERNAME}
    Input Text    ${Locators.SIGNUP_PASSWORD_INPUT}    ${TestData.PASSWORD}
    Click Element    ${Locators.SIGNUP_SUBMIT_BUTTON}
    Sleep    2s
    Handle Alert    accept

Log In Existing User
    Click Element    ${Locators.LOGIN_BUTTON}
    Wait Until Element Is Visible    ${Locators.LOGIN_USERNAME_INPUT}    timeout=5s
    Input Text    ${Locators.LOGIN_USERNAME_INPUT}    ${TestData.USERNAME}
    Input Text    ${Locators.LOGIN_PASSWORD_INPUT}    ${TestData.PASSWORD}
    Click Element    ${Locators.LOGIN_SUBMIT_BUTTON}
    Sleep    2s
    Wait Until Page Contains Element    ${Locators.USERNAME_DISPLAY}    timeout=8s
