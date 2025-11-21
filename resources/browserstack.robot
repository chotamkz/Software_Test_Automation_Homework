*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${BS_USERNAME}       bsuser_YmcLvh
${BS_ACCESS_KEY}     gm6aTqaYdwfDERpW81tw
${BS_URL}            https://${BS_USERNAME}:${BS_ACCESS_KEY}@hub-cloud.browserstack.com/wd/hub

*** Keywords ***
Open Browser On BrowserStack
    [Arguments]    ${url}    ${browser_name}    ${os_name}    ${os_version}    ${test_name}
    [Documentation]    Opens browser session on BrowserStack using Selenium 4 Options

    ${options}=    Run Keyword If    '${browser_name}' == 'Chrome'    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ...    ELSE IF    '${browser_name}' == 'Firefox'    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys, selenium.webdriver
    ...    ELSE IF    '${browser_name}' == 'Safari'    Evaluate    sys.modules['selenium.webdriver'].SafariOptions()    sys, selenium.webdriver

    ${bstack_options}=    Create Dictionary
    ...    os=${os_name}
    ...    osVersion=${os_version}
    ...    sessionName=${test_name}
    ...    buildName=DemoBlaze Automation Build
    ...    projectName=DemoBlaze Testing
    ...    debug=true
    ...    networkLogs=true

    Call Method    ${options}    set_capability    bstack:options    ${bstack_options}

    Call Method    ${options}    set_capability    browserVersion    latest

    Open Browser    ${url}    ${browser_name}    remote_url=${BS_URL}    options=${options}

    Maximize Browser Window
    Set Selenium Speed    0.5s