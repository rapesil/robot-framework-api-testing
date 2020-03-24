*** Settings ***

Library  RequestsLibrary
Library  Collections
Library  String
Library  SeleniumLibrary

*** Variable ***
${URL}    http://httpbin.org
${ALIAS}  httpbin  

*** Test Case ***

Test Case 01: Validar GET
    Dado que eu tenho uma sessão ativa
    Quando eu fizer um get em "/get"
    Então recebo a resposta 200

Test Case 02: Validar Delete
    Dado que eu tenho uma sessão ativa
    Quando eu fizer um delete em "/delete"
    Então recebo a resposta 200

Test Case 03: Validar Delete
    Dado que eu tenho uma sessão ativa
    Quando eu fizer um post em "/post"
    Então recebo a resposta 200

*** Keywords ***
Dado que eu tenho uma sessão ativa
    Create Session  ${ALIAS}  ${URL}

Quando eu fizer um get em "${URI}"
    ${RESP}=  Get Request  ${ALIAS}   ${URI}
    Set Test Variable  ${RESP}

Quando eu fizer um delete em "${URI}"
    ${RESP}=  Delete Request  ${ALIAS}   ${URI}
    Set Test Variable  ${RESP}

Quando eu fizer um post em "${URI}"
    ${RESP}=  Post Request  ${ALIAS}   ${URI}
    Set Test Variable  ${RESP}

Então recebo a resposta ${status_code} 
    Should Be Equal As Strings  ${RESP.status_code}  ${status_code}