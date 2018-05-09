*** Settings ***
Documentation  Demo to show the capacity of robot framework to test APIs.
Library  OperatingSystem
Library  SudsLibrary
Library  BuiltIn
Library  Collections
Library  XML  true
Library  RequestsLibrary
Resource  ../Resources/WebServices.robot
Suite Setup  set log level  TRACE

*** Variables ***
#robot -d Results/CalculatorImproved --include Demo Tests/WebServices_Calculator_Improved.robot
${CALCULATOR_WSDL}  http://www.dneonline.com/calculator.asmx?WSDL
${NUMBER_1}  10
${NUMBER_2}  5

${REST_API_URL}  http://www.webservicex.net
*** Test Cases ***



Add_Should_Be_Correct
    [Tags]  Demo
    Calculate Addition Expected Value
    Make Addition Request
    Validate Addition Response

Subtract_Should_Be_Correct
    [Tags]  Demo
    Calculate Subtraction Expected Value
    Make Subtraction Request
    Validate Subtraction Response

Multiply_Should_Be_Correct
    [Tags]  Demo
    Calculate Multiplication Expected Value
    Make Multiplication Request
    Validate Multiplication Response

Divide_Should_Be_Correct
    [Tags]  Demo
    Calculate Division Expected Value
    Make Division Request
    Validate Division Response

*** Keywords ***
Calculate Addition Expected Value
    Calculate Expected Value  ${NUMBER_1}  ${NUMBER_2}  +

Calculate Subtraction Expected Value
    Calculate Expected Value  ${NUMBER_1}  ${NUMBER_2}  -

Calculate Multiplication Expected Value
    Calculate Expected Value  ${NUMBER_1}  ${NUMBER_2}  *

Calculate Division Expected Value
    Calculate Expected Value  ${NUMBER_1}  ${NUMBER_2}  /

Calculate Expected Value
    [Arguments]  ${number1}  ${number2}  ${operator}
    ${result} =  evaluate  ${number1} ${operator} ${number2}
    Set test variable  ${EXPECTED_RESULT}  ${result}