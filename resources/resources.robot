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
    Input Password    ${Locators.SIGNUP_PASSWORD_INPUT}    ${TestData.PASSWORD}
    Click Element    ${Locators.SIGNUP_SUBMIT_BUTTON}
    Sleep    1s
    Handle Alert    accept

Log In Existing User
    Click Element    ${Locators.LOGIN_BUTTON}
    Wait Until Element Is Visible    ${Locators.LOGIN_USERNAME_INPUT}    timeout=5s
    Input Text    ${Locators.LOGIN_USERNAME_INPUT}    ${TestData.USERNAME}
    Input Password    ${Locators.LOGIN_PASSWORD_INPUT}    ${TestData.PASSWORD}
    Click Element    ${Locators.LOGIN_SUBMIT_BUTTON}
    Wait Until Page Contains Element    ${Locators.USERNAME_DISPLAY}    timeout=10s

Log Out User
    Click Element     ${Locators.LOGOUT_BUTTON}
    Wait Until Page Contains Element  ${Locators.LOGIN_BUTTON}   timeout=10s

Ensure Logged In
    [Documentation]    If not logged in, log in. Checks the visibility of the user's name.
    ${is_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${Locators.USERNAME_DISPLAY}    timeout=2s
    
    IF    not ${is_visible}
        Log In Existing User
    END
    
    Wait Until Element Is Visible    ${Locators.USERNAME_DISPLAY}    timeout=10s
    ${user_text}=    Get Text    ${Locators.USERNAME_DISPLAY}
    Should Contain    ${user_text}    ${TestData.USERNAME}

Go To Phones Category
    Click Element    ${Locators.CATEGORY_PHONES}
    Wait Until Page Contains Element    ${Locators.PRODUCT_SAMSUNG_GALAXY_S6}    timeout=10s

Open Product Page
    [Arguments]    ${product_locator}
    Wait Until Element Is Visible    ${product_locator}    timeout=10s
    Click Element    ${product_locator}
    Wait Until Page Contains Element    ${Locators.ADD_TO_CART_BUTTON}    timeout=10s

Add Product To Cart
    Wait Until Element Is Visible    ${Locators.ADD_TO_CART_BUTTON}    timeout=10s
    Click Element    ${Locators.ADD_TO_CART_BUTTON}
    Sleep    1s
    ${alert_text}=    Handle Alert    action=ACCEPT
    Log    Alert after add to cart: ${alert_text}

Open Cart And Place Order
    Click Element    ${Locators.CART_LINK}
    Wait Until Page Contains Element    ${Locators.PLACE_ORDER_BUTTON}    timeout=10s
    Click Element    ${Locators.PLACE_ORDER_BUTTON}
    Wait Until Element Is Visible    ${Locators.ORDER_MODAL}    timeout=10s
    Wait Until Element Is Visible    ${Locators.ORDER_NAME_INPUT}    timeout=10s

Fill Place Order Form
    Input Text    ${Locators.ORDER_NAME_INPUT}      ${TestData.ORDER_NAME}
    Input Text    ${Locators.ORDER_COUNTRY_INPUT}   ${TestData.ORDER_COUNTRY}
    Input Text    ${Locators.ORDER_CITY_INPUT}      ${TestData.ORDER_CITY}
    Input Text    ${Locators.ORDER_CARD_INPUT}      ${TestData.ORDER_CARD}
    Input Text    ${Locators.ORDER_MONTH_INPUT}     ${TestData.ORDER_MONTH}
    Input Text    ${Locators.ORDER_YEAR_INPUT}      ${TestData.ORDER_YEAR}

Confirm Purchase And Verify Receipt
    Click Element    ${Locators.PURCHASE_BUTTON}
    Wait Until Page Contains    ${Locators.PURCHASE_CONFIRM_TEXT}    timeout=15s
    Run Keyword And Ignore Error    Click Element    ${Locators.PURCHASE_OK_BUTTON}

Add Product To Cart For Deletion Test
    Go To Phones Category
    Open Product Page    ${Locators.PRODUCT_SAMSUNG_GALAXY_S6}
    Add Product To Cart
    Click Element    ${Locators.CART_LINK}
    Wait Until Page Contains Element    ${Locators.DELETE_BUTTON}    timeout=10s

Remove Product From Cart
    [Arguments]    ${product_name}=Samsung galaxy s6
    Wait Until Element Is Visible    ${Locators.DELETE_BUTTON}    timeout=10s
    Page Should Contain    ${product_name}
    Click Element    ${Locators.DELETE_BUTTON}
    
    Wait Until Page Does Not Contain    ${product_name}    timeout=15s
    
    ${is_still_present}=    Run Keyword And Return Status    Page Should Contain    ${product_name}
    Run Keyword If    ${is_still_present}    Fail    The product '${product_name}' was not removed from the shopping cart
