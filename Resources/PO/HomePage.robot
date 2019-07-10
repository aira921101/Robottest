*** Settings ***
Library  SeleniumLibrary
*** Variables ***

*** Keywords ***
Load
    Go To  ${TEST_URL}
    Wait Until Page Contains Element  css=.nav-right .nav-input

Verify Page Loaded
    Wait Until Page Contains Element  css=.nav-right .nav-input
