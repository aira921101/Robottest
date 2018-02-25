*** Settings ***

*** Variables ***

*** Keywords ***

Greet the audience
    [Arguments]  ${user_name}
    log  Hello, ${user_name}. How are you?