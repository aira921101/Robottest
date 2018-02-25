*** Settings ***
Documentation  Demo for robot framework guide - Improved script
Resource  ../Resources/AmazonApp.robot
Resource  ../Resources/Common.robot
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

*** Variables ***
${BROWSER} =  Chrome
${TEST_URL} =  https://www.amazon.com.mx
${SEARCH_TERM} =  World of Warcraft
*** Test Cases ***
User must sign in to check out
    [Documentation]  This is a improved version of the first script
    [Tags]  current

    AmazonApp.Search for Products
    AmazonApp.Select Product from Search Results
    AmazonApp.Add Product to Cart
    AmazonApp.Begin Checkout