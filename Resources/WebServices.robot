*** Settings ***
Library  SudsLibrary
Library  RequestsLibrary
Library  XML  true

*** Variables ***

*** Keywords ***

Make Addition Request
    Make Calculator Request  Add

Make Subtraction Request
    Make Calculator Request  Subtract

Make Multiplication Request
    Make Calculator Request  Multiply

Make Division Request
    Make Calculator Request  Divide

Make Calculator Request
    [Documentation]  Make SOAP request using the parameters provided. The response is returned as XML and also pasted in the log for reference.
    [Arguments]  ${SERVICE_NAME}

    #Loads a WSDL from the given URL/path and creates a Suds SOAP client.
    Create Soap Client  ${CALCULATOR_WSDL}

    #put static message
    #Create raw soap message needs an entire SOAP message as a string
    ${request}=  Create Raw Soap Message  <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:tem="http://tempuri.org/"><soap:Header/><soap:Body><tem:${SERVICE_NAME}><tem:intA>${NUMBER_1}</tem:intA><tem:intB>${NUMBER_2}</tem:intB></tem:${SERVICE_NAME}></soap:Body></soap:Envelope>

    #Change return settings
    Set Return Xml	True

    #call soap method(operation)
    ${response}=    Call Soap Method  ${SERVICE_NAME}    ${request}
    set test variable  ${SOAP_RESPONSE}  ${response}
    Log  ${SOAP_RESPONSE}

Validate Addition Response
    Validate Calculator Response  Add

Validate Subtraction Response
    Validate Calculator Response  Subtract

Validate Multiplication Response
    Validate Calculator Response  Multiply

Validate Division Response
    Validate Calculator Response  Divide

Validate Calculator Response
    [Arguments]  ${opertator}
    Log  ${EXPECTED_RESULT}
    Log  ${SOAP_RESPONSE}
    ${response_result} =  get element text  ${SOAP_RESPONSE}  *//${opertator}Result
    should be equal as numbers  ${response_result}  ${EXPECTED_RESULT}