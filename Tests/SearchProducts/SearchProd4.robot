*** Settings ***
Documentation  Demo for robot framework guide - Improved script
Resource  ../../Resources/AmazonApp.robot
Resource  ../../Resources/Common.robot
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

*** Variables ***
${BROWSER} =  Chrome
${TEST_URL} =  https://www.amazon.com.mx
${SEARCH_TERM} =  ps4
${EMAIL} =  aira921101hasvmn05@gmail.com
${PASSWORD} =  DrWho2019
*** Test Cases ***
User must sign in to check out
    [Documentation]  This is an improved version of the first script
    [Tags]  Refactor  Final

    AmazonApp.Search for Products
    AmazonApp.Select Product from Search Results
    AmazonApp.Add Product to Cart
    AmazonApp.Begin Checkout
