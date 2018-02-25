*** Settings ***
Documentation  Amazon top navigation bar. It is present in each page.
Library  Selenium2Library
*** Variables ***

*** Keywords ***
Search Product
    Input Text  id=twotabsearchtextbox  ${SEARCH_TERM}
    Click Button  css=input[type=submit][class=nav-input]