*** Settings ***
Library  Selenium2Library
*** Variables ***

*** Keywords ***
Load
    Go To  ${TEST_URL}
    Wait Until Page Contains  Mi Amazon.com.mx

Verify Page Loaded
    Wait Until Page Contains  Mi Amazon.com.mx