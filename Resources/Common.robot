*** Settings ***
Library  Selenium2Library
*** Keywords ***

Begin Web Test
    Create Webdriver  ${BROWSER}
End Web Test
    Close Browser