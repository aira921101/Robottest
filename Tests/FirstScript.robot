*** Settings ***
Documentation  Demo for robot framework guide
Library  Selenium2Library
Test Setup  Begin Web Test
Test Teardown  End Web Test
*** Variables ***

*** Test Cases ***
My very first Robot Framework test
    [Documentation]  This is the first script created using RF
    [Tags]  FirstScript

    Create Webdriver  Chrome
    Go To  https://www.amazon.com.mx/
    Wait Until Page Contains  Mi Amazon.com.mx
    Input Text  id=twotabsearchtextbox  World of Warcraft
    Click Button  css=input[type=submit][class=nav-input]
    Wait Until Page Contains  resultados para "World of Warcraft"
    Click Link  css=#result_0 a.s-access-detail-page
    Wait Until Page Contains  Volver a los resultados de búsqueda
    Click Button  id=add-to-cart-button
    Wait Until Page Contains  producto agregado al carrito
    Click Link  Proceder al pago (1 artículo)
    Title Should Be  Amazon Iniciar sesión
    Close Browser

First script refactor: User:Defined keywords
    [Tags]  Current
    Search Products
    Select Product
    Add to Cart
    Start Checkout

*** Keywords ***
Search Products
    Input Text  id=twotabsearchtextbox  World of Warcraft
    Click Button  css=input[type=submit][class=nav-input]
    Wait Until Page Contains  resultados para "World of Warcraft"

Select Product
    Click Link  css=#result_0 a.s-access-detail-page
    Wait Until Page Contains  Volver a los resultados de búsqueda

Add to Cart
    Click Button  id=add-to-cart-button
    Wait Until Page Contains  producto agregado al carrito

Start Checkout
    Click Link  Proceder al pago (1 artículo)
    Title Should Be  Amazon Iniciar sesión

Begin Web Test
    Create Webdriver  Chrome
    Go To  https://www.amazon.com.mx/
    Wait Until Page Contains  Mi Amazon.com.mx

End Web Test
    Close Browser