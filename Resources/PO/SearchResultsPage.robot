*** Settings ***
Library  SeleniumLibrary
*** Variables ***

*** Keywords ***

Verify Search Completed
    Wait Until Page Contains  resultados para "${SEARCH_TERM}"

Click Product Link
    [Documentation]  Clicks on the first result of the search
    #Click Link  css=#result_0 a.s-access-detail-page
    Click element  xpath=//*[@id="search"]/div[1]/div[2]/div/span[3]/div[1]/div[1]/div/div/div/div[2]/div[1]/div/div