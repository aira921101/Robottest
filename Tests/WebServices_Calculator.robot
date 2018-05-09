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
#robot -d Results/Calculator --include Demo Tests/WebServices_Calculator.robot
${CALCULATOR_WSDL}  http://www.dneonline.com/calculator.asmx?WSDL
${NUMBER_1}  10
${NUMBER_2}  5

*** Test Cases ***
Calculator_Add
    [Tags]  Demo
    ${add_expected} =  evaluate  ${NUMBER_1} + ${NUMBER_2}
    Create Soap Client  http://www.dneonline.com/calculator.asmx?WSDL
    ${request} =  Create raw soap message  <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:tem="http://tempuri.org/"><soap:Header/><soap:Body><tem:Add><tem:intA>${NUMBER_1}</tem:intA><tem:intB>${NUMBER_2}</tem:intB></tem:Add></soap:Body></soap:Envelope>

    Set Return Xml	True
    #call soap method(operation)
    ${result}=    Call Soap Method  Add  ${request}
    set test variable  ${response}  ${result}
    Log  ${response}

    ${add_result} =  get element text  ${response}  *//AddResult
    should be equal as numbers  ${add_result}  ${add_expected}

Calculator_Subtract
    [Tags]  Demo
    ${add_expected} =  evaluate  ${NUMBER_1} - ${NUMBER_2}
    Create Soap Client  http://www.dneonline.com/calculator.asmx?WSDL
    ${request} =  Create raw soap message  <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:tem="http://tempuri.org/"><soap:Header/><soap:Body><tem:Subtract><tem:intA>${NUMBER_1}</tem:intA><tem:intB>${NUMBER_2}</tem:intB></tem:Subtract></soap:Body></soap:Envelope>

    Set Return Xml	True
    #call soap method(operation)
    ${result}=    Call Soap Method  Subtract  ${request}
    set test variable  ${response}  ${result}
    Log  ${response}

    ${add_result} =  get element text  ${response}  *//SubtractResult
    should be equal as numbers  ${add_result}  ${add_expected}

Calculator_Multiply
    [Tags]  Demo
    ${add_expected} =  evaluate  ${NUMBER_1} * ${NUMBER_2}
    Create Soap Client  http://www.dneonline.com/calculator.asmx?WSDL
    ${request} =  Create raw soap message  <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:tem="http://tempuri.org/"><soap:Header/><soap:Body><tem:Multiply><tem:intA>${NUMBER_1}</tem:intA><tem:intB>${NUMBER_2}</tem:intB></tem:Multiply></soap:Body></soap:Envelope>

    Set Return Xml	True
    #call soap method(operation)
    ${result}=    Call Soap Method  Multiply  ${request}
    set test variable  ${response}  ${result}
    Log  ${response}

    ${add_result} =  get element text  ${response}  *//MultiplyResult
    should be equal as numbers  ${add_result}  ${add_expected}

Calculator_Divide
    [Tags]  Demo
    ${add_expected} =  evaluate  ${NUMBER_1} / ${NUMBER_2}
    Create Soap Client  http://www.dneonline.com/calculator.asmx?WSDL
    ${request} =  Create raw soap message  <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:tem="http://tempuri.org/"><soap:Header/><soap:Body><tem:Divide><tem:intA>${NUMBER_1}</tem:intA><tem:intB>${NUMBER_2}</tem:intB></tem:Divide></soap:Body></soap:Envelope>

    Set Return Xml	True
    #call soap method(operation)
    ${result}=    Call Soap Method  Divide  ${request}
    set test variable  ${response}  ${result}
    Log  ${response}

    ${add_result} =  get element text  ${response}  *//DivideResult
    should be equal as numbers  ${add_result}  ${add_expected}