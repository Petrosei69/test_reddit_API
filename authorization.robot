*** Settings ***
Library      RequestsLibrary
Library      Collections
Resource     variables.robot

*** Keywords ***
Authorization
    ${body}=       Create Dictionary    grant_type=password    username=${username}    password=${password}
    ${headers}=    Create Dictionary    User-Agent=${headers}
    ${auth}=       Create List          ${client_id}           ${secret_key}

    Create Session  alias=authorizating    url=${token_url}    auth=${auth}    headers=${headers}     verify=true

    ${response}=    POST On Session    authorizating    ${auth_url}    data=${body}    headers=${headers}
    Status Should Be    200    ${response}

    ${token}=    Catenate    bearer    ${response.json()['access_token']}
    Set To Dictionary    ${headers}    Authorization    ${token}

    [Return]    ${headers}