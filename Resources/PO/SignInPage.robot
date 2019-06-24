*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Verify Page Loaded
    Title Should Be  Amazon Iniciar sesión

Sign In
    Input text  id=ap_email  ${EMAIL}
    Input text  id=ap_password  ${PASSWORD}
    Click element  id=signInSubmit